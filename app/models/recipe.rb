class Recipe < ApplicationRecord
  # Direct associations

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
  validates :user_id, :presence => true
  validates :name, :presence => true
  validates :city, :presence => true
  validates :image, :presence => true

  mount_uploader :image, ImageUploader

end
