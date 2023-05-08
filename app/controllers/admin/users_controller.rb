class Admin::UsersController < ApplicationController
  before_action :move_to_user_signin  # 管理者未ログイン時はユーザーログインページへ遷移させる

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(admin_user_params)
    redirect_to admin_user_path(@user.id)
  end


  private
  def admin_user_params
    params.require(:user).permit(:is_deleted)  # 退会フラグの変更のみ受け付ける
  end
end
