class DaysController < ApplicationController
  before_action :in_redirect
  before_action :year

  def new
    @day = Day.create(apertura: DateTime.now, user: current_user)
    redirect_to root_path
    flash[:success] = 'È stata aperta una giornata, ora puoi operare. Quando hai terminato di operare, chiudi la sessione cliccando su "Chiudi giornata"'
  end

  def close
    if params[:id]
      @day = Day.find_by(id: params[:id].to_i)
    else
      @day = Day.where(user: current_user, chiusura: nil).last
    end
    @day.update_attribute(:chiusura, DateTime.now)
    @day.update_attribute(:totale_consegnato, @day.subscriptions.pluck(:quota).sum)
    redirect_to root_path
    flash[:success] = "Giornata chiusa con successo. Totale giornata da consegnare a don Pasquale: #{@day.totale_consegnato}"
  end

  def registro
    @days = Day.all
  end
end
