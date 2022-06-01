class PostsController < ApplicationController

  def index
  end
  
  def show
    @day = params[:id]
  end

  def new
    @post = Post.new
    @games = Game.where(user_id: "1").or(Game.where(user_id: current_user.id))
  end

  def create
  end
end
