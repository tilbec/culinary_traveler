class Country < ApplicationRecord
  # Direct associations

  has_many   :cities,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
