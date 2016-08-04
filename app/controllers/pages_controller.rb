class PagesController < ApplicationController
  before_action :require_user, except: [:show]
  before_action :prepare_page, except: [:new, :create]
  before_action :require_page_owner, except: [:new, :create, :show]

  def show
    if !current_user && @page.is_draft
      flash[:danger] = "Access Denied"
      redirect_to :back
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.user = current_user

    if @page.save
      flash[:success] = "Created a new page!"
      redirect_to page_path(@page)
    else
      render :new
    end
  end

  def edit
    @image = Image.new
  end

  def update
    @page.assign_attributes(page_params)

    if @page.save
      flash[:success] = "Updated the page!"
      redirect_to page_path(@page)
    else
      render :edit
    end
  end

  def destroy
    if @page.destroy
      flash[:success] = "Deleted the page!"
      redirect_to root_path
    else
      render :show
    end
  end

  def create_image
    if params[:image].present?
      @image = Image.new(image_params)
      @image.entry = @page
      flash[:success] = "Created new Image!" if @image.save
    else
      flash[:danger] = "Please provide Image to upload."
    end
    redirect_to edit_page_path(@page)
  end

  def destroy_image
    @image = Image.find_by_id params[:id]
    if @image.present? && @image.destroy
      flash[:success] = "Deleted the Image!"
    end
    redirect_to edit_page_path(@page)
  end

  private

  def page_params
    params.require(:page).permit(:body, :position, :author_name, :published_at, :is_draft, :title, :slug)
  end

  def prepare_page
    @page = Page.find_by_slug(params[:page_id] || params[:id])
  end

  def image_params
    params.require(:image).permit(:asset)
  end

  def require_page_owner
    require_owner(@page)
  end
end
