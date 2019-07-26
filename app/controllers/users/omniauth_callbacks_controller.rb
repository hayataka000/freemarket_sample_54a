# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # callback for facebook
  def facebook
    callback_for(:facebook)
  end

  # callback for twitter
  def twitter
    callback_for(:twitter)
  end

  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def callback_for(provider)
    provider = provider.to_s
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session[:nickname] = @user.nickname
      session[:email] = @user.email
      session[:password] = @user.password
      session[:provider] = @user.provider
      session[:uid] = @user.uid
      redirect_to new_user_registration_sns_path
    end
  end
end
