class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :follows, :followers, :search]
  before_action :auto_delete, only: :show

  def show
    @user = User.find(params[:id])
    @posts = Post.order("start_time ASC").where(user_id: params[:id])
    @game = Game.new
    @games = Game.all
  end

  def follows
    user = User.find(current_user.id)
    @users = user.follow_user
  end

  def followers
    user = User.find(current_user.id)
    @users = user.follower_user
  end

  def search
    if params[:keyword] != ""
      @users = User.search(params[:keyword])
    else
      @users = User.where.not(id: current_user.id)
    end
  end

  private

  def auto_delete
    posts = Post.where("end_time < ?", Date.today)
    posts.each do |post|
      post.destroy
    end
  end
  
end
