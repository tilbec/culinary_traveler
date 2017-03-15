class AddCommentCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :comments_count, :integer
  end
end
