class PostsController < ApplicationController

  def index
  end
  
  def show
    @day = params[:id]
  end

  def new
    @post = Post.new
  end
end
