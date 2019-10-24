class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  def current_user
    User.find_by( id: session[:id]) if session[:id]
  end
  helper_method :current_user

  private
    def require_login 
      redirect_to sessions_new_path unless session[:id]
    end
end
