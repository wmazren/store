class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @storage_requests = StorageRequest.where(:user_id => current_user.id, :status => 'draft')
  end
end
