class PostsController < ApplicationController
  def index
  	@post = Post.all
  end

  def show
  	@post = Post.find(param[:id])
  end

  def new
  end

  def edit
  end
end
