class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :user_id
      t.integer :city_id
      t.integer :country_id

      t.timestamps

    end
  end
end
