class AddDetailsToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :po_num, :string
    add_column :boxes, :date_received, :date
    add_column :boxes, :invoice_num, :string
    add_column :boxes, :supplier_name, :string
  end
end
