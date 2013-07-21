class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :package_id
      t.integer :user_id

      t.timestamps
    end

    add_index :items, :package_id
    add_index :items, :user_id
  end
end
