class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]
  before_action :auto_delete, only: [:index, :show]

  def index
    @posts = Post.includes([:user, user: :follower, user: :followee])
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
      flash[:notice] = "空のデータがあるか、時間指定が不正です"
      redirect_to new_post_path(date: @date)
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id 
      post.destroy
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @games = Game.where(user_id: "1").or(Game.where(user_id: current_user.id))
  end

  private

  def post_params
    params.require(:post).permit(:start_time, :end_time, :chat_id, :publish_id, game_ids: []).merge(user_id: current_user.id)
  end

  def auto_delete
    posts = Post.where("end_time < ?", Date.today)
    posts.each do |post|
      post.destroy
    end
  end

end
