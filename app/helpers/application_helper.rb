module ApplicationHelper
  def current_user
    @current_user || User.find(session[:user_id])
  end

  def navbar_admin
    'navbar-admin' if current_user.admin?
  end
end
