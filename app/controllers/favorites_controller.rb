class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.create!(post_id: post.id)

    if favorite
      flash[:notice] = "Added to favorites"
    else
      flash[:alert] = "Failed to favorite"
    end

    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
  
    if favorite.destroy
      flash[:notice] = "Post unfavorited."
    else
      flash[:alert] = "Unfavoriting failed."
    end
      redirect_to [post.topic, post]
  end

  private
    def favorites_params
      params.permit(:post_id)
    end
end
