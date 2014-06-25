class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id

        redirect_to edit_user_path(@user)
      else
        flash[:error] = "Sign in failed"
        redirect_to new_session_path
      end
  end
end
