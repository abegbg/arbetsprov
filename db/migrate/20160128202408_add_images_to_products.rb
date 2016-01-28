class AddImagesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image, :string
		change_column :products, :description,  :text
  end
end
