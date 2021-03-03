module SessionsHelper
  def current_user
    if session[:minogive1234].present?
      @_user1234 ||= User.find_by(id: session[:minogive1234])
    else
      nil
    end
  end
  def session_required 
    redirect_to sign_in_users_path, notice: "請先登入會員" if not current_user
  end
end
