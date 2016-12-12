class ImportsController < ApplicationController

  def index
    @import = Import.all
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    if @import.save
      redirect_to import_path(@import)
    else
      flash[:error]="#{@import.name} has not been imported"
    end
  end

  def show
    @import = Import.find(params[:id])
  end

  private

  def import_params
    params.require(:import).permit(:name, :attachment)
  end
end