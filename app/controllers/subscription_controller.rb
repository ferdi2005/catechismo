class SubscriptionController < ApplicationController
  before_action :in_redirect
  before_action :set_day, except: :delete

  def new
    unless (@person = Person.find(params[:id]))
      flash[:error] = 'Nessuna anagrafica trovata'
      redirect_to root_path and return
    end
    if Subscription.find_by(year: @year, person: @person)
      flash[:error] = "Esiste già un'iscrizione per <b>#{@person.nome} #{@person.cognome}</b> per questo anno (#{@year.anno}). Annulla l'iscrizione precedente o modifica l'anno."
      redirect_to root_path and return
    end
    @subscription = Subscription.new
  end

  def create
    @person = Person.find(params[:subscription][:person_id].to_i)
    @subscription = Subscription.new(sub_params.merge(person: @person, year: @year, day: @day))
    @person.update_attribute(:group, @subscription.group) unless @subscription.group.nil?
    if @subscription.save
      redirect_to @person
      flash[:success] = "Iscrizione al catechismo per l'anno #{@year.anno} registrata con successo."
    else
      flash[:danger] = "#{@subscription.errors.full_messages}"
      render 'new'
    end
  end

  def delete
    @day = Day.find_by(user: current_user, chiusura: nil)
    @subscription = Subscription.find_by(id: params[:id])
    if @subscription 
      if current_user.admin? || (@subscription.day.chiusura.nil? && @subscription.day.user == current_user)
        @person = @subscription.person
        if @subscription.destroy
          redirect_to @person
          flash[:success] = 'Iscrizione eliminata correttamente.'
        else
          redirect_to @person
          flash[:error] = "Errore nell'eliminazione dell'iscrizione."
        end
      end
    end
  end
end
private
  def sub_params
    params.require(:subscription).permit(:quota, :quota_versata, :anno, :group_id)
  end 
