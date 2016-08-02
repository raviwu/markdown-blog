class EbooksController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :prepare_ebook, except: [:index, :new, :create]
  before_action :require_ebook_owner, except: [:index, :new, :create, :show]

  def index
    @ebooks = Ebook.published.page params[:page]
  end

  def new
    @ebook = Ebook.new
  end

  def create
    @ebook = Ebook.new
    @ebook.assign_attributes(ebook_params)
    @ebook.user = current_user

    if @ebook.save
      flash[:success] = "Updated the ebook!"
      redirect_to ebooks_path(@ebook)
    else
      render :edit
    end
  end

  def edit
    @attachment = Attachment.new
    @image = Image.new
  end

  def update
    @ebook.assign_attributes(ebook_params)

    if @ebook.save
      flash[:success] = "Updated the ebook!"
      redirect_to ebooks_path(@ebook)
    else
      render :edit
    end
  end

  def destroy
    if @ebook.destroy
      flash[:success] = "Deleted the ebook!"
    end
    redirect_to ebooks_path
  end

  def create_image
    @image = Image.new(image_params)
    @image.entry = @ebook
    if @image.save
      # make sure there is
      Image.where(entry: @ebook)[0..-2]&.map(&:destroy)
      flash[:success] = "Update Cover Image!"
    end
    redirect_to :back
  end

  def destroy_image
    @image = Image.find_by_id params[:id]
    if @image.destroy
      flash[:success] = "Deleted the image!"
    end
    redirect_to :back
  end

  def create_attachment
    @attachment = Attachment.new(attachment_params)
    @attachment.entry = @ebook
    if @attachment.save
      flash[:success] = "Added new attachment."
    else
      flash[:danger] = "Opps, something wrong with your upload."
    end
    redirect_to :back
  end

  def destroy_attachment
    @attachment = Attachment.find_by_id params[:id]
    if @attachment.destroy
      flash[:success] = "Deleted the attachment!"
    end
    redirect_to :back
  end

  private

  def prepare_ebook
    @ebook = Ebook.find_by_slug(params[:ebook_id] || params[:id])
  end

  def require_ebook_owner
    require_owner(@ebook)
  end

  def attachment_params
    params.require(:attachment).permit(:asset)
  end

  def image_params
    params.require(:image).permit(:asset)
  end

  def ebook_params
    params.require(:ebook).permit(:introduction, :references, :author_name, :published_at, :title, :slug)
  end
end
