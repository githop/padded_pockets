class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    User.find_by_id(session[:user_id]).comments << @comment
  end


  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
