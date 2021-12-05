class ApplicationController < ActionController::Base
  def redirect_to_dashboard_if_logged_in
    if current_user.nil?
      return
    elsif @current_user.role == "student"
      redirect_to mapa_path
    else
      redirect_to dashboard_path
    end
  end
end
