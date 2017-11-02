class CartsController < ApplicationController

  def show
    @cart_items = current_cart.cart_items
    @payment = Payment.new
    @cart = Cart.find(params[:id])

    @store = @cart.stores.group(:store_id)
    @hash = Gmaps4rails.build_markers(@store) do |store, marker|
      marker.lat store.latitude
      marker.lng store.longitude
      marker.json({name: store.name})
      marker.infowindow store.en_name
    end
  end

end
