class CommentsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to post_path(@post), notice: "Comment added successfully."
    else
      redirect_to post_path(@post), alert: "Failed to add comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
