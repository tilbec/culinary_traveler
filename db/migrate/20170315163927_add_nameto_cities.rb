class AddNametoCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :name
    remove_column :countries, :description
  end
end
