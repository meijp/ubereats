class Product < ActiveRecord::Base
  belongs_to :store
  validates :store_id, presence: true

  mount_uploader :image, ImageUploader
end
