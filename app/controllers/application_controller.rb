class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  def render_unauthorized(text)
    render_status_code(text, 401)
  end

  def render_not_found(text)
    render_status_code(text, 404)
  end

  def render_status_code(text, code)
    render(text: text, status: code, layout: 'application') && return
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end 
end
