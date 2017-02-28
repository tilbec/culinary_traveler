class City < ApplicationRecord
  # Direct associations

  has_many   :follows,
             :dependent => :destroy

  has_many   :recipes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
