class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.phone_number = params[:user][:phone_number]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      redirect_to root_url
      flash[:notice] = "You have created your account!"
    else
      render :new
      flash[:notice] = "We could not create your account"
    end
  end



  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user= User.find(params[:id])
    @user.destroy
    redirect_to "/restaurants"
    flash[:notice] = "Account deleted"
  end

end
