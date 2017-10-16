class StoretopsController < ApplicationController
  before_action :authenticate_user!
  before_action :storetop_params

  def index
    @store = Store.find(params[:id])
  end

  private
    def storetop_params
      params.require(:name).permit(:name, :genre, :mindelitime, :maxdelitime, :image)
    end

end
