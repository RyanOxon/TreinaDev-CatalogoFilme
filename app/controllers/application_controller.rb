class ApplicationController < ActionController::Base

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[ role ])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[ role ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[ role ])
  end
  
end
