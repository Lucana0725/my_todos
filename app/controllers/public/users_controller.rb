class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  # idでユーザーを取得
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)  # user_paramsを使用してユーザー情報をアップデート
    redirect_to user_path(@user)
  end

  def unsubscribe
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)  # is_deletedをtrueに切り替え
    reset_session  # ログインセッションを終了
    redirect_to root_path
  end



  private

  def user_params
    params.require(:user).permit(:nickname)  # :nicknameの変更を受け付ける
  end
end
