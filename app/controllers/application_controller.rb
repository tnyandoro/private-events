class ApplicationController < ActionController::Base
  def logged_in?
    !session[:user_id].nil?
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_sign_in
    return unless @user.nil?

    flash.alert = 'Please log in'
    redirect_to new_user_path
  end
end
