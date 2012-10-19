class ApplicationController < ActionController::Base
  before_filter :authenticate

  def authenticate
    return if current_user
    return if Rails.env.development?
    authenticate_or_request_with_http_basic do |name, password|
      name == '05f8a4e34b57482ad021cfb0' && password == 'd84c1dfb42c2abcf0c90180e'
    end
  end

  def requires_admin
    return if current_user && current_user.admin?
    head :unauthorized
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end
end
