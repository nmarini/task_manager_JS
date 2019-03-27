class SessionController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session_login(user)
    else 
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session_login(user)
      else
        render controller: 'users', action: 'new'
    end 
  end 

  def destroy
    session.delete :user_id
    redirect_to root_path
  end 

  private 

  def session_login(user)
    session[:user_id] = user.id
    redirect_to root_path
  end 
end
