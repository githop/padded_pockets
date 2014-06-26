class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    puts "These are your parameters: #{params_user}"
    if @user.update_attributes(params_user)
      redirect_to root_path
    else
      flash[:error] = "Something went wrong updating your profile"
      redirect_to edit_user_path(@user)
    end
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
    params.require(:user).permit(:username, :email, :password, :bio, :party)
  end
end
