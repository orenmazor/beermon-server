class SessionsController < ApplicationController
  skip_before_filter :authenticate

  def new
    redirect_to '/auth/g'
  end

  def create
    if auth = request.env['omniauth.auth']
      user = User.find_or_initialize_by_email(auth['info']['email'])
      user.uid = auth['uid']
      user.save

      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to 'auth/failure'
    end
  end

  def failure
    render :text => "None shall pass!"
  end
end
