class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    # Customize the sign-in redirect path
    root_path
  end

  def after_sign_out_path_for(resource)
    # Customize the sign-out redirect path
    new_user_session_path
  end
end
