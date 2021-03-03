class RegistrationsController < ApplicationController
  layout "pages"
  before_action :session_required, only: [:edit, :update]
  def new 
    @user = User.new
  end

  def create
    @user = User.new(clean_params)
    if @user.save
      session[:minogive1234] = @user.id
      redirect_to boards_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(clean_params)
      redirect_to edit_users_path, notice: "更新成功"
    else
      #
    end
  end

  private
  def clean_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
