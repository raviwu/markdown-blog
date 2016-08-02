class PostsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :prepare_post, except: [:index, :new, :create]
  before_action :require_post_owner, except: [:index, :new, :create, :show]

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
    require_owner(@post)
    @image = Image.new
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

  def create_image
    @image = Image.new(image_params)
    @image.entry = @post
    if @image.save
      flash[:success] = "Created new Image!"
    end
    redirect_to edit_post_path(@post)
  end

  def destroy_image
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
