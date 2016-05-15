class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  helper_method :current_user
  helper_method :admin

  def current_user
    return nil unless session[:user_id]
    User.find(session[:user_id])
  end

  def admin
    return nil unless session[:user_id]
    return current_user.admin
  end

  rescue_from CanCan::AccessDenied do
    flash[:warning] = t :not_authorized
    redirect_to root_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end