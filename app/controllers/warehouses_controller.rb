class WarehousesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
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
