class HomeController < ApplicationController
  before_action :in_redirect
  def home
    unless @day = Day.find_by(user: current_user, chiusura: nil)
      flash[:info] = 'Nessuna giornata è stata iniziata.'
    end
  end
end
