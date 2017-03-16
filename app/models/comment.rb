class Comment < ApplicationRecord
  # Direct associations

  belongs_to :recipe,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations
  validates :user_id, :presence => true
  validates :recipe_id, :presence => true
  validates :comment, :presence => true
end
