class AddLatLngtoCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :lat, :string
    add_column :cities, :lng, :string
  end
end
