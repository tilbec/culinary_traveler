class Follow < ApplicationRecord
  # Direct associations

  belongs_to :city

  belongs_to :user

  # Indirect associations

  # Validations

end
