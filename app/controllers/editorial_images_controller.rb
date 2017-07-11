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
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @editorial.save
    redirect_to :back
  end

  private

  def image_params
    params.require(:editorial_image).permit(:file_url, :editorial_id)
  end
end
