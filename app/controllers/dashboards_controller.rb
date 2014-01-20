class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    # User
    @storage_requests_open= StorageRequest.where(['user_id = ? AND  state <> ?', current_user.id, 'closed'])
    @retrieval_requests_open = RetrievalRequest.where(['user_id = ? AND  state <> ?', current_user.id, 'closed'])
    @box_requests_open = BoxRequest.where(['user_id = ? AND  state <> ?', current_user.id, 'closed'])
    @packages = Package.where(['user_id = ?', current_user.id])
    @storage_requests_draft = StorageRequest.where(:user_id => current_user.id, :submit_state => 'draft')

    #Admin
    @storage_requests_open_admin= StorageRequest.where(['submit_state <> ? AND state <> ?', 'draft', 'closed'])
    @storage_requests_new_admin= StorageRequest.where(['submit_state <> ? AND state = ?', 'draft', 'new'])
    # @storage_requests_in_progress_admin= StorageRequest.where(['submit_state <> ? AND state = ?', 'draft', 'in progress'])
    @storage_requests_in_progress_admin= StorageRequest.where(['submit_state <> ? AND state <> ? AND state <> ?', 'draft', 'new', 'closed'])

    @retrieval_requests_open_admin = RetrievalRequest.where(['state <> ?', 'closed'])
    @retrieval_requests_new_admin= RetrievalRequest.where(['state = ?', 'new'])
    @retrieval_requests_in_progress_admin= RetrievalRequest.where(['state = ?', 'in_progress'])

    @box_requests_open_admin = BoxRequest.where(['state <> ?', 'closed'])
  end
end
