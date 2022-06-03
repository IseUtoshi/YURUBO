class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.includes(:user)
  end
  
  def show
    @date = params[:id]
    @posts = Post.includes(:user)
  end

  def new
    @date = params[:date]
    @post = Post.new
    @games = Game.where(user_id: "1").or(Game.where(user_id: current_user.id))
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @date = "#{params[:post]["start_time(1i)"]}-#{params[:post]["start_time(2i)"]}-#{params[:post]["start_time(3i)"]}"
      redirect_to new_post_path(date: @date)
    end
  end

  private

  def post_params
    params.require(:post).permit(:start_time, :end_time, :chat_id, :publish_id, game_ids: []).merge(user_id: current_user.id)
  end

end
