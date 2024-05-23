class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :profile_yet_to_be_registered, if: :user_signed_in?

  protected

  def profile_yet_to_be_registered
    if current_user.standard? && current_user.user_profile.nil?
      unless url_for(only_path: true) == destroy_user_session_path || url_for(only_path: true) == new_user_profile_path || url_for(only_path: true) == user_profiles_path
        redirect_to new_user_profile_path, notice: 'Para finalizar seu cadastro, preencha os dados abaixo.'
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[ role ])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[ role ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[ role ])
  end
  
end
