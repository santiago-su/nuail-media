class DesignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)

    if @design.save
      redirect_to designs_path, notice: "Your design was created"
    else
      redirect_to new_design_path, notice: "Something went wrong"
    end
  end

  def show
    @design = Design.find(params[:id])
  end

  def edit
    @design = Design.find(params[:id])
  end

  def update
    @design = Design.find(params[:id])
    if @design.update(design_params)
      redirect_to designs_path, notice: "El proyecto de diseño ha sido actualizado"
    else
      render "edit"
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    redirect_to designs_path, notice: "El proyecto de diseño ha sido eliminado"
  end

  private

  def design_params
    params.require(:design).permit(:name, :description, :participants, :featured)
  end

end
