class Product < ActiveRecord::Base
  belongs_to :store
  validates :store_id, presence: true

  mount_uploader :image, ImageUploader

  has_many :cart_items
  # default_scope { where(active: true) }
end
