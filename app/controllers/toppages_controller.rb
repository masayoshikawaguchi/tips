class ToppagesController < ApplicationController
  def index
    @categories = Category.all
    @microposts = Micropost.all.order('created_at DESC').page(params[:page])
    @likes = Like.where(micropost_id: params[:micropost_id])
  end
end
