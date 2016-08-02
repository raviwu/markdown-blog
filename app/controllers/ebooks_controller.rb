class EbooksController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :prepare_ebook, except: [:index, :new, :create]
  before_action :require_ebook_owner, except: [:index, :new, :create, :show]

  def index
    @ebooks = Ebook.published.page params[:page]
  end

  def show
  end

  def new
    @ebook = Ebook.new
  end

  def create
  end

  def edit
    @attachment = Attachment.new
    @image = Image.new
  end

  def update
  end

  def destroy
    if @ebook.destroy
      flash[:success] = "Deleted the ebook!"
      redirect_to posts_path
    else
      render :show
    end
  end

  def create_image

  end

  def destroy_image
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

  def prepare_ebook
    @ebook = Ebook.find_by_slug(params[:ebook_id] || params[:id])
  end

  def require_ebook_owner
    require_owner(@ebook)
  end

  def attachment_params
    params.require(:attachment).permit(:asset)
  end
end
