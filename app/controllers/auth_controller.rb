class AuthController < ApplicationController
  def login
    if user_signed_in?
      redirect_to root_path
    end
  end

  def dologin
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{@user.first_name}!"
      redirect_to root_path
    else
      flash[:error] = "No user found with that email/password."
      render :login
    end
  end

  def logout
    session[:user] = nil
    flash[:success] = "Logged out"
    redirect_to login_path
  end
end
