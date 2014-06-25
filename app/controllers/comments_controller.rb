class CommentsController < ApplicationController
  def create
    @user = User.find_by_id(session[:user_id])
    @politician = Politician.find_by_id(params[:politician_id])
    commie = Comment.create(comment_params)
    @politician.comments << commie
    @user.comments << commie

    redirect_to politician_path(@politician)
  end


  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
