class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    @user = current_user
    @cart = current_cart
    @cart_item = current_cart.cart_items
    num = 0
    @cart_item.each do |cart_item|
      if num == 0
        @cart_store = cart_item.store.id
      end
    end
  end

  def create
    Payment.create(payment_params)
  end

  def purchase
    Payment.create(payment_params)
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: params[:amount], card: params['payjp-token'])

    session[:cart_id] = nil
    flash[:notice] = "支払いが完了しました。"
    redirect_to root_path
  end

  private
  def payment_params
    params.permit(:cart_id, :user_id, :store_id, :delivery_address, :shipping, :amount)
  end

end
