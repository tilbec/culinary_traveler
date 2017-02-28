class Comment < ApplicationRecord
  # Direct associations

  belongs_to :recipe,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
