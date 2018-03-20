class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @microposts = Micropost.all.order('created_at DESC').page(params[:page])
    @likes = Like.where(micropost_id: params[:micropost_id])
  end

  def new
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = '雑学を投稿しました'
      redirect_to root_url
    else
      flash.now[:danger] = '雑学の投稿に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = '雑学を削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content, :category_id, :user_id)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
end
