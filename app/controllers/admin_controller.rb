class AdminController < ApplicationController
  def index
  end

  def posts
    @posts = Post.all.includes(:user, :comments) # make sure only hit DB 3 times MAX
  end

  def comments
  end

  def users
  end

  def show_post
    @post = Post.includes(:user, :comments).find(params[:id])
  end
end
