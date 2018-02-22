class PostsController < ApplicationController
  before_action(:set_post, only: [:show, :edit, :update, :destroy])

  def index
    @posts = Post.where(user_id: current_user.id).order(:date).page(params[:page]).per(15)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: "Your post was created successfully"
    else
      render :new, notice: "There was an error in creating the post, please try again"
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Your post was updated successfully"
    else
      render :edit, notice: "There was an error updating your post, please try again"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Your post was deleted successfully"
  end

  private

    def post_params
      params.require(:post).permit(:date, :rationale, :status, :overtime_request)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
