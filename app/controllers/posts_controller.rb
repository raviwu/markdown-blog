class PostsController < ApplicationController
  before_action :require_user, except: [:index, :show, :search]
  before_action :prepare_post, except: [:index, :new, :create, :search]
  before_action :require_post_owner, except: [:index, :new, :create, :show, :search]

  def search
    @posts =
      if current_user
        Post.search(params[:search_query]).page params[:page]
      else
        Post.search(params[:search_query]).select(&:is_public?).page params[:page]
      end
    @highlights = params[:search_query]&.strip&.split
  end

  def index
    @posts =
      if current_user
        Post.all.order('created_at DESC').page params[:page]
      else
        Post.published.page params[:page]
      end
  end

  def new
    @post = Post.new
  end

  def show
    if !current_user && @post.is_draft
      flash[:danger] = "Access Denied"
      redirect_to :back
    end
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
    @image = Image.new
  end

  def update
    @post.assign_attributes(post_params)

    if @post.save
      flash[:success] = "Updated the post!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Deleted the post!"
      redirect_to posts_path
    else
      render :show
    end
  end

  def create_image
    if params[:image].present?
      @image = Image.new(image_params)
      @image.entry = @post
      flash[:success] = "Created new Image!" if @image.save
    else
      flash[:danger] = "Please provide Image to upload."
    end
    redirect_to edit_post_path(@post)
  end

  def destroy_images
    @image = Image.find_by_id params[:id]
    if @image.destroy
      flash[:success] = "Deleted the Image!"
    end
    redirect_to edit_post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:body, :author_name, :published_at, :is_draft, :title, :slug)
  end

  def prepare_post
    @post = Post.find_by_slug(params[:post_id] || params[:id])
  end

  def require_post_owner
    require_owner(@post)
  end

  def image_params
    params.require(:image).permit(:asset)
  end
end
