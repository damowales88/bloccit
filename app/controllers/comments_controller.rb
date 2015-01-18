class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post.  Please try again."
      render :create
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Uh oh!  Something went wrong.  Try again."
      render [@topic, @post]
    end
  end
end