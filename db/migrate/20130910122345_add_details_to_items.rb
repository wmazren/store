class AddDetailsToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_date, :date
    add_column :items, :item_type, :string
  end
end
