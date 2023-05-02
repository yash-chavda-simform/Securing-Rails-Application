class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end

  private
  def already_login
    if current_user
      redirect_to root_path, flash:{ info: "Already loggedin" }
    end
  end

  def require_login
    unless current_user
      redirect_to login_users_path, flash:{ danger: "You need to login first" }
    end
  end
end
