class Follow < ApplicationRecord
  # Direct associations

  belongs_to :city

  belongs_to :user

  # Indirect associations

  # Validations
  validates :city_id, :presence => true
  validates :user_id, :presence => true
  
end
