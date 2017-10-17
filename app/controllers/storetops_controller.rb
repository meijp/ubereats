class StoretopsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :storetop_params

  def index
    @stores = Store.all
    @store = Store.find(params[:store_id])
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  private
    def storetop_params
      params.require(:storetop).permit(:name, :genre, :mindelitime, :maxdelitime, :image)
    end

end
