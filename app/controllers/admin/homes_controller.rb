class Admin::HomesController < ApplicationController
before_action :move_to_user_signin

  def top
    @users = User.all
  end
end
