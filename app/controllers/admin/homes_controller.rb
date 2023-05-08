class Admin::HomesController < ApplicationController
  before_action :move_to_user_signin  # 管理者未ログイン時はユーザーログインページへ遷移させる

  def top
    @users = User.all
  end
end
