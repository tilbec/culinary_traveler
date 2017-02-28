class AddCityCountToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :cities_count, :integer
  end
end
