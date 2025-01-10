class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if @comment = Comment.create(comment_params)
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comment = @prototype.comments
      render "prototype/show", status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id] ,user_id: current_user.id)
  end
end
