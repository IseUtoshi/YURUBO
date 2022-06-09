class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]
  before_action :auto_delete, only: :index

  def index
    redirect_to user_path(current_user.id)
  end

  def create
    @game = Game.new(game_params)
    if @game.save(context: :game_save)
      redirect_to request.referer
    else
      @user = User.find(current_user.id)
      @posts = Post.order("start_time ASC").where(user_id: current_user.id)
      @games = Game.all
      render "users/show"
    end
  end
  
  def destroy
    game = Game.find(params[:id])
    if game.user_id == current_user.id 
      game.destroy
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  private

  def game_params
    params.require(:game).permit(:title).merge(user_id: current_user.id)
  end

  def auto_delete
    posts = Post.where("end_time < ?", Date.today)
    posts.each do |post|
      post.destroy
    end
  end
  
end
