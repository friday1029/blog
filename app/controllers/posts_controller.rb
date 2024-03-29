class PostsController < ApplicationController
  def index
    @posts = Post.published.default_order
  end

  def show
    @post = Post.published.find(params[:id])
    @relative_posts = Post.published.sample 3
  end
end
