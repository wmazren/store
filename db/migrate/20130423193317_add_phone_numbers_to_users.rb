class AddPhoneNumbersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone1, :string
    add_column :users, :phone2, :string
    add_column :users, :phone3, :string
    add_column :users, :fax, :string
    add_column :users, :mobile, :string
  end
end
