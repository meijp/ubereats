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

  #   def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   if @cart_item.product.store_id == current_cart.stores[0].id
  #     old_cart_items = current_cart.cart_items
  #     old_cart_items << @cart_item
  #     if current_cart.update(cart_items: old_cart_items)
  #       redirect_to cart_path(current_cart)
  #     else
  #       #render :new, ...
  #       #@cartのsaveが失敗した場合の処理
  #     end
  #   else
  #     current_cart.store_ids = []
  #     current_cart.store_ids << @cart_item.product.store_id
  #     #session[:cart_id] = current_cart.id
  #     @cart_item = current_cart.cart_items.new(cart_item_params)
  #     if @cart_item.save
  #       redirect_to cart_path(current_cart)
  #     else
  #       #render :new, ...
  #       #@cartのsaveが失敗した場合の処理
  #     end
  #   end
  # end


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
