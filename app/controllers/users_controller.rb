class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @game = Game.new
  end

end
