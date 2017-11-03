class StoretopsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :storetop_params

  def index
    @stores = Store.all
    @store = Store.find(params[:store_id]) #クリックしたグループのid取得
    # @products = Product.all
    @products = Product.where(store_id: @store) #クリックしたグループのidを持つレコードを取得
  end

  def show
    # @store = Store.find(params[:id])
    # @product = Product.find(params[:id])
  end

  def new
    @store = Store.new
  end

  private
    def storetop_params
      params.require(:storetop).permit(:name, :en_name, :genre, :mindelitime, :maxdelitime, :image)
    end

end
