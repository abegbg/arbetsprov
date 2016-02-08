class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :orderrows, :order
  	add_index :orderrows, :product
  	
  end
end
