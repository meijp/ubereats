class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer     :user_id
      t.integer     :store_id
      t.integer     :cart_id
      t.integer     :shipping
      t.integer     :amount
      t.integer     :delivery_address
      t.timestamps null: false
    end
  end
end
