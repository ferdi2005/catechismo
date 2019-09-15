class SubscriptionController < ApplicationController
  before_action :in_redirect

  def new
    unless (@person = Person.find(params[:id]))
      redirect_to root_path
      flash[:error] = 'Nessuna anagrafica trovata'
    end
    @subscription = Subscription.new
  end

  def create
    @person = Person.find(params[:subscription][:person_id].to_i)
    @year = Person.find(params[:subscription][:year_id].to_i)
    @day = Person.find(params[:subscription][:day_id].to_i)

    @subscription = Subscription.new(params.merge(person: @person, year: @year, day: @day))
    if @subscription.save
      redirect_to @person
      flash[:success] = "Iscrizione al catechismo per l'anno #{@year.anno} registrata con successo."
    else
      render 'new'
      flash[:danger] = "#{@subscription.errors.each { |error| error}}"
    end
  end
end
private
  def params
    params.require(:subscription).permit(:quota, :quota_versata)
  end 
