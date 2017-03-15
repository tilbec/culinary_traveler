class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :country_id
      t.string :image
      t.text :description

      t.timestamps

    end
  end
end
