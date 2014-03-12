class BoxesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(params[:box])

    if @box.save
      flash[:notice] = "Boxes added successfully"
      redirect_to dashboards_path
    else
      render 'new'
    end
  end
end
