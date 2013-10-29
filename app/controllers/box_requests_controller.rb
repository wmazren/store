class BoxRequestsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def new
    @box_request = BoxRequest.new
  end

  def create
    @box_request = BoxRequest.new(params[:box_request])

    if @box_request.save
      flash[:notice] = "Box requested successfully"
      redirect_to dashboards_path
    else
      render 'new'
    end
  end

  def update
    @box_request = BoxRequest.find(params[:id])
    if @box_request.update_attributes(params[:box_request])
      flash[:notice] = "Successfully updated box request."
      redirect_to dashboards_path
    else
      render :action => 'edit'
    end
  end
end
