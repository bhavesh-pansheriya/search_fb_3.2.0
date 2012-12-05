class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      set_flash_message :notice, :success, :kind => "Facebook" # OR flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def failure
    set_flash_message :alert, :failure, :kind => failed_strategy.name.to_s.humanize, :reason => failure_message
    redirect_to root_path
  end

  protected

  def failed_strategy
    env["omniauth.error.strategy"]
  end

  def failure_message
    exception = env["omniauth.error"]
    error   = exception.error_reason if exception.respond_to?(:error_reason)
    error ||= exception.error        if exception.respond_to?(:error)
    error ||= env["omniauth.error.type"].to_s
    error.to_s.humanize if error
  end
  
end
