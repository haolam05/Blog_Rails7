class AdminController < ApplicationController
  def index
  end

  def posts
    @posts = Post.all.includes(:user) # make sure only hit DB 3 times MAX
  end

  def comments
  end

  def users
  end

  def show_post
    @post = Post.includes(:user).find(params[:id])
    @comments = Comment.includes(:user, :rich_text_body).where(post_id: @post.id)
  end
end
