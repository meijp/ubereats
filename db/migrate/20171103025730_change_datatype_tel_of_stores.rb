class ChangeDatatypeTelOfStores < ActiveRecord::Migration
  def change
    change_column :stores, :tel, :string
  end
end
