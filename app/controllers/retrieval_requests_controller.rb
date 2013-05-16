class RetrievalRequestsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
      # @storage_requests = StorageRequest.all
      @items = Item.where(:user_id => current_user.id)
      # @package = Pacakge.all
  end

  def new
    @retrieval_request = RetrievalRequest.new
  end

  def create
    @storage_request = StorageRequest.new(params[:storage_request])
    if @storage_request.save
      redirect_to @storage_request, notice: "Successfully created storage request."
    else
      render :new
      #flash[:alert] = "Each storage request must have at least one package."
    end
  end

  def continue
    @retrieval_request = RetrievalRequest.new(params[])
    if @storage_request.save
      redirect_to @storage_request, notice: "Successfully created storage request."
    else
      render :new
      #flash[:alert] = "Each storage request must have at least one package."
    end
  end


end
