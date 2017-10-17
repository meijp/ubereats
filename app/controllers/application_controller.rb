class ApplicationController < ActionController::Base
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

  private
  # ログイン後のリダイレクト先
      # def after_sign_in_path_for(resource)
      #   case resource
      #   when User
      #     root_path
      #   when Stores
      #      store_storetops_path(@stores)
      #   end
      # end

  def after_sign_in_path_for(resource)
    store_storetops_path(resource) #your path
  end

end
