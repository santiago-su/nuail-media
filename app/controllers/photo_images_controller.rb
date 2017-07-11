class PhotoImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    photo_image = PhotoImage.new(photo_id: @photo.id)
    photo_image.update image_params

    if photo_image.save
      redirect_to :back, notice: "Your image was created"
    else
      redirect_to :back, notice: "Something went wrong"
    end
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @photo.save
    redirect_to :back
  end

  private

  def image_params
    params.require(:photo_image).permit(:file_url, :photo_id)
  end
end
