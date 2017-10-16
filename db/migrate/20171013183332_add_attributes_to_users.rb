class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :phone, :string
    add_column :users, :time_zone, :string
  end
end
