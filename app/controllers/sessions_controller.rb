class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Logged in successfully."
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:warning] = "Cannot login."
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    flash[:success] = "Logged out."
    redirect_to root_url
  end
end
