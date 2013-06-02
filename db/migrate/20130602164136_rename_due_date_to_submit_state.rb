class RenameDueDateToSubmitState < ActiveRecord::Migration
  def self.up
    change_table :storage_requests do |t|
      t.change :due_date, :string
    end
  end
  def self.down
    change_table :storage_requests do |t|
      t.change :due_date, :date
    end
  end
end
