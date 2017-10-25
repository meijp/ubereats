class AddTotalToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :subtotal, :integer
    add_column :carts, :shipping, :integer
    add_column :carts, :total, :integer
  end
end
