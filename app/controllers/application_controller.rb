class ApplicationController < ActionController::Base

  # 管理者未ログイン時、ユーザー未ログイン時の遷移先をユーザーログインページへ設定
  def move_to_user_signin
    unless admin_signed_in? || user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end
