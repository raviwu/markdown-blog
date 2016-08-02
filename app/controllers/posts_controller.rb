class PostsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :prepare_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.published.page params[:page]
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:success] = "Created a new post!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    require_owner(@post)
  end

  def update
    require_owner(@post)
    @post.assign_attributes(post_params)

    if @post.save
      flash[:success] = "Updated the post!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    require_owner(@post)
    if @post.destroy
      flash[:success] = "Deleted the post!"
      redirect_to posts_path
    else
      render :show
    end
  end

  def post_params
    params.require(:post).permit(:body, :author_name, :published_at, :title, :slug)
  end

  def prepare_post
    @post = Post.find_by_slug params[:id]
  end
end
