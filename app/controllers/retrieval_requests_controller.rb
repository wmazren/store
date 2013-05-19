    class RetrievalRequestsController < ApplicationController
      before_filter :authenticate_user!
      load_and_authorize_resource

      def index
          # @items = Item.where(:user_id => current_user.id)
          @items = Item.all
      end

      def new
        @retrieval_request = RetrievalRequest.new
        @retrieval_request.user_id = params[:user_id]
      end

      def create
        @retrieval_request = RetrievalRequest.new(:user_id => params[:user_id], :package_id => params[:package_id])
        if @retrieval_request.save
          redirect_to retrieval_requests_path, notice: "Successfully created retrieval request."
        else
          render :new
        end
      end
    end
