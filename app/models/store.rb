class Store < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :payments
  has_many :carts

  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode
end
