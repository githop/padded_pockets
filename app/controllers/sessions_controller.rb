class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id

        redirect_to root_path
      else
        flash[:error] = "Sign in failed"
        redirect_to new_session_path
      end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
