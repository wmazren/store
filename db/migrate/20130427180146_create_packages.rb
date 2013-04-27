class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :reference_id

      t.timestamps
    end
  end
end
