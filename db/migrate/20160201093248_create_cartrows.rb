class CreateCartrows < ActiveRecord::Migration
  def change
    create_table :cartrows do |t|
      t.references :cart, index: true
      t.references :product, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
