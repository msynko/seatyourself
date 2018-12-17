class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
      else
      render :new, alert: "Username or password incorrect."
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_sessions_url, notice: "Logged out!"
  end

end
