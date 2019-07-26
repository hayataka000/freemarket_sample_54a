class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_key_id] && password == Rails.application.credentials[:basic_key_pass]
    end
  end

  protected
  
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:email, :password, :password_confirmation, :nickname, :last_name, :first_name, :last_name_furigana, :first_name_furigana, :birthday)}
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :nickname, :last_name, :first_name, :last_name_furigana, :first_name_furigana, :birthday, :phone_number])
  end
  # def items
  # end

  # def show
  # end
end
