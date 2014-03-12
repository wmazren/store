class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
