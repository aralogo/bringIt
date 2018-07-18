class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :DOB, :date
    add_column :users, :phone, :integer
    add_column :users, :isDriver, :boolean
    add_column :users, :autoAccept, :boolean
    add_column :users, :driverlicense, :string
  end
end
