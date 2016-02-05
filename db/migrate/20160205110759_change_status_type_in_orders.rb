class ChangeStatusTypeInOrders < ActiveRecord::Migration
  def up
		change_column :orders, :status,  :string, :default => "Ny"
  end

  def down
		change_column :orders, :status,  :integer, :default => 0
  end
end
