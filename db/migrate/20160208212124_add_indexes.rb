class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :orderrows, :order_id
  	add_index :orderrows, :product_id

  end
end
