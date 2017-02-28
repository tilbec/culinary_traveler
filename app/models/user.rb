class User < ApplicationRecord
  # Direct associations

  has_many   :follows,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :recipes,
             :dependent => :destroy

  # Indirect associations

  has_many   :commented_recipes,
             :through => :comments,
             :source => :recipe

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
