class PostsController < ApplicationController
  def index
    @posts = Post.order(:id)
  end

  def show
    @post = Post.find(params[:id])
    @relative_posts = Post.all.sample 3
  end
end
