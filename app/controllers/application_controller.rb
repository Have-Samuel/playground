class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  # layout :layout_by_resource

  private

  def layout_by_resource
    devise_controller? ? 'session' : 'application'
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      user_path(resource)
    else
      super
    end
  end

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, key: %i[
                                        name
                                        email
                                        password
                                        password_confirmation
                                      ])
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end
end
