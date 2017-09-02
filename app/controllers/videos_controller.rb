class VideosController < ApplicationController
  before_action :authenticate_user!, except: :detail

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to videos_path, notice: "Your video was created"
    else
      redirect_to new_video_path, notice: "Something went wrong"
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def detail
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to videos_path, notice: "El video ha sido actualizado"
    else
      render "edit"
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path, notice: "El video ha sido eliminado"
  end

  private

  def video_params
    params.require(:video).permit(:name, :description, :embed_url, :participants, :featured)
  end

end
