class EditorialsController < ApplicationController
  before_action :authenticate_user!

  def index
    @editorials = Editorial.all
  end

  def new
    @editorial = Editorial.new
  end

  def create
    @editorial = Editorial.new(editorial_params)

    if @editorial.save
      redirect_to editorials_path, notice: "Your editorial was created"
    else
      redirect_to new_editorial_path, notice: "Something went wrong"
    end
  end

  def show
    @editorial = Editorial.find(params[:id])
  end

  def edit
    @editorial = Editorial.find(params[:id])
  end

  def update
    @editorial = Editorial.find(params[:id])
    if @editorial.update(editorial_params)
      redirect_to editorials_path, notice: "El proyecto de editorial ha sido actualizado"
    else
      render "edit"
    end
  end

  def destroy
    @editorial = Editorial.find(params[:id])
    @editorial.destroy
    redirect_to editorials_path, notice: "El proyecto de editorial ha sido eliminado"
  end

  private

  def editorial_params
    params.require(:editorial).permit(:name, :description, :participants, :featured)
  end

end
