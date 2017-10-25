class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products
  has_many :users
  # before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    cart_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private
  # def set_order_status
  #   self.cart_status_id = 1
  # end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
