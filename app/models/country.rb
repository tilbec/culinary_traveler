class Country < ApplicationRecord
  # Direct associations

  has_many   :cities,
             :dependent => :destroy

  # Indirect associations

  # Validations
  validates :name, :presence => true

end
