class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 10)
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    
    authorize @post
    if @post.save
      @post.create_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post.  Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated!"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Uh oh!  That didn't work!  Try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    title = @post.title

    authorize @post
    if @post.destroy
      redirect_to topics_path, notice: "Post \"#{title}\" was deleted!"
    else
      flash[:error] = "Uh oh!  Something went wrong.  Try again."
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :postimage)
  end

end
