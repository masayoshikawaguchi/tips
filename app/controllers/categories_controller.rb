class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category =Category.find(params[:id])
    @microposts = @category.microposts.order('created_at DESC').page(params[:page])
    @likes = Like.where(micropost_id: params[:micropost_id])
  end
end
