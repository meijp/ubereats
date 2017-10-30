class Product < ActiveRecord::Base
  belongs_to :store
  has_many :cart_items

  validates :store_id, presence: true

  mount_uploader :image, ImageUploader

  # default_scope { where(active: true) }
end
