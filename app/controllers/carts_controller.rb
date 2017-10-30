class CartsController < ApplicationController

  def show
    @cart_items = current_cart.cart_items
    @payment = Payment.new
    @cart = Cart.find(params[:id])
    # @stores = Store.all
  end

end
