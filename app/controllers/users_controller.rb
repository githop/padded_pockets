class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:error] = "there was an issue creating your account."
        redirect_to new_user_path
      end
  end


  private
  def params_user
    params.require(:user).permit(:username, :email, :password)
  end
end
