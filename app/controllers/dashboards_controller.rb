class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    # User
    @storage_requests_open= StorageRequest.where(['user_id = ? AND  state <> ?', current_user.id, 'closed'])
    @retrieval_requests_open = RetrievalRequest.where(['user_id = ? AND  state <> ?', current_user.id, 'closed'])
    @packages = Package.where(['user_id = ?', current_user.id])
    @storage_requests_draft = StorageRequest.where(:user_id => current_user.id, :state => 'draft')

    #Admin
    @storage_requests_open_admin= StorageRequest.where(['state <> ?', 'draft'])
    @retrieval_requests_open_admin = RetrievalRequest.where(['state <> ?', 'virgin'])
  end
end
