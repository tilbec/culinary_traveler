class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :country

  has_many   :comments,
             :dependent => :destroy

  belongs_to :city

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_many   :commenters,
             :through => :comments,
             :source => :user

  # Validations

end
