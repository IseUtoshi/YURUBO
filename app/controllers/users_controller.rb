class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :follows, :followers, :search]

  def show
    @user = User.find(params[:id])
    @game = Game.new
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
    @users = User.search(params[:keyword])
  end

end
