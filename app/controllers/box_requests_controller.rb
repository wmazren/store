class BoxRequestsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
        @box_request = BoxRequest.find(params[:id])
        respond_to do |format|
          format.html
          format.pdf do
              pdf = BoxRequestAdminPdf.new(@box_request, view_context)
              send_data pdf.render, filename: "box_request_#{@box_request.user.full_name}.pdf",
                                    type: "application/pdf",
                                    disposition: "inline"
          end
        end
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
      flash[:error] = "Insufficient stocks for boxes. Please check inventory!"
    end
  end

  def destroy
    @box_request = BoxRequest.find(params[:id])
    @box_request .destroy
    flash[:notice] = "Successfully deleted Box Request."
    redirect_to dashboards_path
  end
end
