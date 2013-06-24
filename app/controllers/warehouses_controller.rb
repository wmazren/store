class WarehousesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
          pdf = WarehousePdf.new(@warehouse, view_context)
          send_data pdf.render, filename: "warehouse_#{@warehouse.name}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
      end
    end
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(params[:warehouse])
    if @warehouse.save
      flash[:notice] = "Warehouse created"
      redirect_to dashboards_path
    else
      format.html { render action: "new" }
    end
  end
end
