class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    post = Post.find(favorite_params[:post_id])
    favorite = current_user.favorites.create!(favorite_params)

    if favorite
      flash[:notice] = "Added to favorites"
    else
      flash[:alert] = "Failed to favorite"
    end

    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(favorite_params[:post_id])
    favorite = Favorite.where(user_id: current_user.id, post_id: post.id).first
    # favorite = current_user.favorites.find(favorite_params[:post_id])
  
    if favorite.destroy
      flash[:notice] = "Post unfavorited."
    else
      flash[:alert] = "Unfavoriting failed."
    end
      redirect_to [post.topic, post]
  end

  private
    def favorite_params
      # params.fetch(:favorite, {}).permit(:post_id)
      params.permit(:post_id)
    end
end
