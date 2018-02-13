class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(give_post_params)
    @post.save
    redirect_to @post
  end

  private

  def give_post_params
    params.require(:post).permit(:date, :rationale)
  end
end
