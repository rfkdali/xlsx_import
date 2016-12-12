class ImportsController < ApplicationController

  def index
    @imports = Import.all

    @contacts = Contact.all
    @invalid_contacts = ListContact.where(validated: false)
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    if @import.save
      XlsxParser.new(@import).call

      redirect_to imports_path, notice: "The import #{@import.name} has been uploaded."
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