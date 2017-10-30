class AddDefaultToCarts < ActiveRecord::Migration
  def change
    change_column_default :carts, :shipping, 380
  end
end
