class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :payments

  before_save :update_subtotal
  # after_save :total

  def subtotal
    cart_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    subtotal + shipping
  end

private
  def update_subtotal
    self[:subtotal] = subtotal
  end
end
