class AddSentQuantityToOrderrows < ActiveRecord::Migration
  def change
    add_column :orderrows, :sent_quantity, :integer, :default => 0
  end
end
