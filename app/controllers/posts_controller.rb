class PostsController < ApplicationController

  def index
  end
  
  def show
    @day = params[:id]
  end

  def new
    @day = params[:date]
    @post = Post.new
    @games = Game.where(user_id: "1").or(Game.where(user_id: current_user.id))
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @day = "#{params[:post]["start_time(1i)"]}-#{params[:post]["start_time(2i)"]}-#{params[:post]["start_time(3i)"]}"
      redirect_to new_post_path(date: @day)
    end
  end

  private

  def post_params
    params.require(:post).permit(:start_time, :end_time, :chat_id, :publish_id, game_ids: []).merge(user_id: current_user.id)
  end

end
