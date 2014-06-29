

class CommentsController < ApplicationController
  def create
    @user = User.find_by_id(session[:user_id])
    @politician = Politician.find_by_id(params[:politician_id])
    commie = Comment.create(comment_params)
    @politician.comments << commie
    @user.comments << commie

    redirect_to politician_path(@politician)
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    politician = @comment.politician
    @comment.destroy

    redirect_to politician_path(politician)
  end

  def upvote
    @user = User.find_by_id(session[:user_id])
    respond_to do |format|
      @comment = Comment.find(params[:comment_id])
      @comment.liked_by @user
      votes_up = @comment.votes_for.up.count
      votes_down = @comment.votes_for.down.count
      format.json { render json: {vote_up: votes_up,vote_down: votes_down}}
    end

  end

  def downvote
    @user = User.find_by_id(session[:user_id])
    respond_to do |format|
      @comment = Comment.find(params[:comment_id])
      @comment.downvote_from @user
      votes_up = @comment.votes_for.up.count
      votes_down = @comment.votes_for.down.count
      format.json { render json: {vote_up: votes_up,vote_down: votes_down}}
    end

  end


  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
