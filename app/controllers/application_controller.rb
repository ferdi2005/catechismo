class ApplicationController < ActionController::Base
  before_action :year

  # TODO: TEMPORANEI E DI SVILUPPO
  ENV['QUOTA'] = '15'
  # Variabili globali
  ANNO_DI_CATECHISMO = {
    1 => 'Confessione',
    2 => 'Comunione',
    3 => '1º anno di Cresima',
    4 => '2º anno di Cresima'
  }
  
  $ANNO_DI_CATECHISMO = ANNO_DI_CATECHISMO
  
  $select_anno = [[ANNO_DI_CATECHISMO[1], 1], [ANNO_DI_CATECHISMO[2], 2], [ANNO_DI_CATECHISMO[3], 3], [ANNO_DI_CATECHISMO[4], 4]] 

  # Metodi globali


  def in_redirect
    unless user_signed_in?
      flash[:info] = 'Accedi prima di proseguire.'
      redirect_to new_user_session_path and return
    end
  end

  def admin?
    in_redirect
    unless current_user.admin?
      flash[:error] = 'Serve essere amministratori (parroco) per eseguire questa azione.'
      redirect_to root_path and return
    end
  end


  # Settaggi di variabili
  def set_day
    unless current_user.admin?
      unless @day = Day.find_by(user: current_user, chiusura: nil)
        redirect_to root_path and return
        flash[:error] = 'Apri la giornata prima di eseguire questa operazione.'
      end
    end
  end

  def year
    if !cookies[:year_id].blank? && Year.find_by(id: cookies[:year_id].to_i)
      @year = Year.find(cookies[:year_id].to_i)
    end
  end
end
