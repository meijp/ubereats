class CartItemsController < ApplicationController
  def new
  end

  def create
    @cart = current_cart
    @cart_item = @cart.cart_items.new(cart_item_params)
    @cart.save
    session[:cart_id] = @cart.id
    redirect_to cart_path(@cart)
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items
    redirect_to cart_path(@cart)
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = @cart.cart_items
    redirect_to cart_path(@cart)
  end

private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id, :store_id)
  end

end
