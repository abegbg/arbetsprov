class AddSuperuserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :superuser, :integer, default: 0
  end
end
