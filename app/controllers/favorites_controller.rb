class FavoritesController < ApplicationController
  def create
    @blog_favorite = Favorite.new(user_id: current_user.id, blog_id: params[:blog_id])
    @blog_favorite.save
    redirect_to blogs_path
  end

  def destroy
    @blog_favorite = Favorite.find_by(user_id: current_user.id, blog_id: params[:blog_id])
    @blog_favorite.destroy
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = current_user.blogs.find(params[:id])
  end
end
