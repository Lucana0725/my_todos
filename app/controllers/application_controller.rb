class ApplicationController < ActionController::Base
  def move_to_user_signin
    unless admin_signed_in?
      redirect_to new_user_session_path
    end
  end
end
