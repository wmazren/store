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
end
