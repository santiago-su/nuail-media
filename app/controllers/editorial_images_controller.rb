class EditorialImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @editorial = Editorial.find(params[:editorial_id])
    editorial_image = EditorialImage.new(editorial_id: @editorial.id)
    editorial_image.update image_params

    if editorial_image.save
      redirect_to :back, notice: "Your image was created"
    else
      redirect_to :back, notice: "Something went wrong"
    end
  end

  def destroy
    Cloudinary::Uploader.destroy(params[:id])
    editorial_image = EditorialImage.find(params[:editorial_id])
    editorial_image.destroy
    redirect_to :back
  end

  private

  def image_params
    params.require(:editorial_image).permit(:file_url, :editorial_id)
  end
end
