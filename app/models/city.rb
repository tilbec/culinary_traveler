class City < ApplicationRecord
  # Direct associations

  belongs_to :country,
             :counter_cache => true

  has_many   :follows,
             :dependent => :destroy

  has_many   :recipes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
