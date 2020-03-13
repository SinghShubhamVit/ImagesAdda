# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:firstname, :lastname, :email, :country, :password, :phone)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:firstname, :lastname, :country, :email,
               :password, :current_password, :phone)
    end
  end
end
