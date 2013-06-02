class ChangeColumnTypeToString < ActiveRecord::Migration
  def change
    rename_column(:storage_requests, :due_date, :submit_state)
  end
end
