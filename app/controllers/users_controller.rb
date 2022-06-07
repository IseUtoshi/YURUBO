class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

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

end
