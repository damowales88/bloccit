class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite

    if favorite.save
      flash[:notice] = "Favorited!"
      redirect_to [@post.topic, @post]
    else
      flash[:notice] = "There was a problem.  Try again."
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find(params[:id])
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Deleted!  Right on!"
      redirect_to [@post.topic, @post]
    else
      flash[:notice] = "There was a problem.  Try again."
      redirect_to @post
    end
  end
end
