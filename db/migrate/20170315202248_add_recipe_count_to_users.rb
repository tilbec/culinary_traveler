class AddRecipeCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :recipes_count, :integer
  end
end
