class UsersController < ApplicationController
  def new
    redirect_to root_url if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created."
      redirect_to @user
    else
      flash.now[:danger] = "Cannot create user."
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end
  private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
