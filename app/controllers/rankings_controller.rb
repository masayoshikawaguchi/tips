class RankingsController < ApplicationController
  def like
    @rank = Micropost.find(Like.group(:micropost_id).order('count(likes.micropost_id) desc').limit(5).pluck(:micropost_id))
  end
end
