# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    todos_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # 退会済みユーザーがログインしようとした場合は新規登録画面へ遷移させるアクション
  def user_state
    # まずはメアドからアカウントを取得する(find_by)
    @user = User.find_by(email: params[:user][:email])
    
    # メアドからアカウントを取得できなければ、このメソッドを終了
    return if !@user

    # アカウントが存在し、且つそのアカウントの退会フラグがtrueの場合
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted == true
      redirect_to new_user_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
