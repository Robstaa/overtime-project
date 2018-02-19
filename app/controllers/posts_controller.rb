class PostsController < ApplicationController
  before_action(:set_post, only: [:show, :edit, :update])

  def index
    @posts = Post.all
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
      #flash[:success] = "You created a new post"
      redirect_to @post, notice: "Your post was created successfully"
    else
      render :new
      #flash[:error] = "There was an error in creating your post, please try again"
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Your post was updated successfully"
    else
      render :edit, notice: "There was an error updating your post, please try again"
    end
  end

  private

    def post_params
      params.require(:post).permit(:date, :rationale)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
