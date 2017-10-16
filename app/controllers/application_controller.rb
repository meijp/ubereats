class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_params, if: :devise_controller?

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :lastname, :firstname, :tel, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |store_params|
      store_params.permit(:name, :email, :tel, :address, :genre, :image, :mindelitime, :maxdelitime, :opentime, :closetime, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |store_params|
      store_params.permit(:email, :password, :remember_me)
    end
  end
end
