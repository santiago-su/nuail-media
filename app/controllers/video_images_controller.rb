class VideoImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @video = Video.find(params[:video_id])
    video_image = VideoImage.new(video_id: @video.id)
    video_image.update image_params

    if video_image.save
      redirect_to :back, notice: "Your image was created"
    else
      redirect_to :back, notice: "Something went wrong"
    end
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @video.save
    redirect_to :back
  end

  private

  def image_params
    params.require(:video_image).permit(:file_url, :video_id)
  end
end
