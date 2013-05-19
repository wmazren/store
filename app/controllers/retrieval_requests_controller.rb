    class RetrievalRequestsController < ApplicationController
      before_filter :authenticate_user!
      load_and_authorize_resource

      def index
      end

      def show
        @retrieval_request = RetrievalRequest.find(params[:id])
      end

      def create
        @retrieval_request = RetrievalRequest.new(:user_id => params[:user_id], :package_id => params[:package_id], :status => params[:status])
        if @retrieval_request.save
          redirect_to retrieval_requests_path, notice: "Successfully created retrieval request."
        else
          render :new
        end
      end

      def edit
        @retrieval_request = RetrievalRequest.find(params[:id])
        @retrieval_requests = RetrievalRequest.all
      end

      def update
        @retrieval_request = RetrievalRequest.find(params[:id])
        if @retrieval_request.update_attributes(params[:retrieval_request])
          redirect_to dashboards_path, notice: "Successfully updated retrieval request."
        else
          render :edit
        end
      end
    end
