class ImportsController < ApplicationController
  def create
    @import = Import.new(import_params)
    if @import.save
      redirect_to contacts_path
    else
      flash[:error]="#{@import.name} has not been imported"
    end
  end

  private

  def import_params
    params.require(:import).permit(:name, :attachment)
  end
end