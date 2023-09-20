class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: :index
end

def render_not_found(status=:not_found)
  render plain: "#{status.to_s.titleize} :(", status: status 
end

private

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
end
