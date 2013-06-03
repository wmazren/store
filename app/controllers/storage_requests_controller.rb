class StorageRequestsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    #@storage_requests = StorageRequest.all
  end

  def show
    @storage_request = StorageRequest.find(params[:id])
  end

  def new
    @storage_request = StorageRequest.new
  end

  def create
    @storage_request = StorageRequest.new(params[:storage_request])

    if params[:draft] == "Save as Draft"
      @storage_request.drafted
    end

    if @storage_request.save
      redirect_to @storage_request, notice: "Successfully created storage request."
    else
      render :new
      #flash[:alert] = "Each storage request must have at least one package."
    end
  end

  def edit
    @storage_request = StorageRequest.find(params[:id])
  end

  def update
    @storage_request = StorageRequest.find(params[:id])

    if params[:draft] == "Submit"
      @storage_request.submited
    end

    if @storage_request.update_attributes(params[:storage_request])
      redirect_to dashboards_path, notice: "Successfully updated storage request."
    else
      render :edit
    end
  end

  def destroy
    @storage_request = StorageRequest.find(params[:id])
    @storage_request.destroy
    redirect_to storage_requests_url, notice: "Successfully destroyed storage request."
  end
end
