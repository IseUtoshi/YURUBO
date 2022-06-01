class GamesController < ApplicationController
  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      render "users/show"
    end
  end

  private
  def game_params
    params.require(:game).permit(:title).merge(user_id: current_user.id)
  end
end
