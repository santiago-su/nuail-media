class DesignImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @design = Design.find(params[:design_id])
    design_image = DesignImage.new(design_id: @design.id)
    design_image.update image_params

    if design_image.save
      redirect_to :back, notice: "Your image was created"
    else
      redirect_to :back, notice: "Something went wrong"
    end
  end

  def destroy
    Cloudinary::Uploader.destroy(params[:id])
    design_image = DesignImage.find(params[:design_id])
    design_image.destroy
    redirect_to :back
  end

  private

  def image_params
    params.require(:design_image).permit(:file_url, :design_id)
  end
end
