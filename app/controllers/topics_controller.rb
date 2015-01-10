class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 5)
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 5)
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved!  Nice job!"
    else
      flash[:error] = "Uh oh!  Something went wrong.  Try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      redirect_to @topic
    else
      flash[:error] = "Fuck!  We couldn't save it.  Try again, please."
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

end
