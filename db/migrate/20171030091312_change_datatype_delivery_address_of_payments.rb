class ChangeDatatypeDeliveryAddressOfPayments < ActiveRecord::Migration
  def change
    change_column :payments, :delivery_address, :text
  end
end
