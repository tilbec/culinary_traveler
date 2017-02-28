class Recipe < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :city

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
