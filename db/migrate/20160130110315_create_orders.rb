class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :adress
      t.string :co
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :d_adress
      t.string :d_co
      t.string :d_city
      t.string :d_country
      t.string :d_zipcode
      t.string :email
      t.string :mobile
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
