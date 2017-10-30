class ChangeDatatypeDeliveryAddressDataOfPayments < ActiveRecord::Migration
  def change
    change_column :payments, :delivery_address, :string
  end
end
