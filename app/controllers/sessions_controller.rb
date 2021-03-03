class SessionsController < ApplicationController
  layout "pages"
  def new
    @user = User.new
  end

  def create
    u = User.login(params[:user])
    if u
      #發號碼牌
      session[:minogive1234] = u.id
      redirect_to boards_path, notice: "已登入"
    else
      redirect_to sign_in_users_path, notice: "登入失敗"
    end
  end

  def destroy
   session[:minogive1234] = nil
   redirect_to boards_path, notice: "已登出"
  end
end
