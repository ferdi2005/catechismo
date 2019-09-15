class ApplicationController < ActionController::Base
  before_action :year

  # Variabili globali
  ANNO_DI_CATECHISMO = {
    1 => 'Confessione',
    2 => 'Comunione',
    3 => '1º anno di Cresima',
    4 => '2º anno di Cresima'
  }
  
  $ANNO_DI_CATECHISMO = ANNO_DI_CATECHISMO
  
  $select_anno = [[1, ANNO_DI_CATECHISMO[1]], [2, ANNO_DI_CATECHISMO[2]], [3, ANNO_DI_CATECHISMO[3]], [4, ANNO_DI_CATECHISMO[4]]] 

  # Metodi globali
  def admin?
    unless current_user.admin?
      flash[:error] = 'Serve essere amministratori (parroco) per eseguire questa azione.'
      redirect_to root_path and return
    end
  end

  def in_redirect
    unless user_signed_in?
      flash[:info] = 'Accedi prima di proseguire.'
      redirect_to new_user_session_path and return
    end
  end

  def year
    if !cookies[:year_id].blank? && Year.find_by(id: cookies[:year_id].to_i)
      @year = Year.find(cookies[:year_id].to_i)
    end
  end
end
