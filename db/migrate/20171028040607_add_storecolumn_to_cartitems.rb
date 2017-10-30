class AddStorecolumnToCartitems < ActiveRecord::Migration
  def change
    add_column :cart_items, :store_id, :integer

  end
end
