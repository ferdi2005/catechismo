class SubscriptionController < ApplicationController
  before_action :in_redirect
  before_action :set_day

  def new
    unless (@person = Person.find(params[:id]))
      redirect_to root_path
      flash[:error] = 'Nessuna anagrafica trovata'
    end
    @subscription = Subscription.new
  end

  def create
    @person = Person.find(params[:subscription][:person_id].to_i)
    @group = Person.find(params[:subscription][:group_id].to_i)

    @subscription = Subscription.new(params.merge(person: @person, year: @year, day: @day))
    if @subscription.save
      @person.update_attribute(:group, @subscription.group)
      redirect_to @person
      flash[:success] = "Iscrizione al catechismo per l'anno #{@year.anno} registrata con successo."
    else
      render 'new'
      flash[:danger] = "#{@subscription.errors.each { |error| error}}"
    end
  end

  def delete
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
  def params
    params.require(:subscription).permit(:quota, :quota_versata)
  end 
