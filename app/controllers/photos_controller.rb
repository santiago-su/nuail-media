class PhotosController < ApplicationController
  before_action :authenticate_user!, except: :detail

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to photos_path, notice: "Your photo was created"
    else
      redirect_to new_photo_path, notice: "Something went wrong"
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def detail
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photos_path, notice: "El proyecto de fotografía ha sido actualizado"
    else
      render "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice: "El proyecto de fotografía ha sido eliminado"
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :description, :participants, :featured)
  end

end
