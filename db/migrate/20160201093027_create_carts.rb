class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :mac

      t.timestamps
    end
  end
end
