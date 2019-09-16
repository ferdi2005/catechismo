class DaysController < ApplicationController
  before_action :in_redirect

  def new
    @day = Day.create(apertura: DateTime.now, user: current_user, year: @year)
    redirect_to root_path
    flash[:success] = 'È stata aperta una giornata, ora puoi operare. Quando hai terminato di operare, chiudi la sessione cliccando su "Chiudi giornata"'
  end

  def close
    @day = Day.where(user: current_user, chiusura: nil, year: @year).last
    unless params[:id].blank?
      @day = Day.find_by(id: params[:id].to_i, year: @year)
    end
    unless @day.nil?
      @day.update_attribute(:chiusura, DateTime.now)
      @day.update_attribute(:totale_consegnato, @day.subscriptions.pluck(:quota).sum)
      sign_out
      redirect_to new_user_session_path
      flash[:success] = "Giornata chiusa con successo. Totale giornata da consegnare al parroco: €#{@day.totale_consegnato}. Grazie, ora ho terminato la tua sessione."
    else
      sign_out
      redirect_to new_user_session_path
      flash[:error] = "Nessuna giornata da chiudere, probabile anomalia. Chiudo la tua sessione. Consulta il registro giornate accedendo nuovamente."
    end
  end

  def registro
    @days = Day.where(year: @year)
  end
end
