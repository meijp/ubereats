class AddColumnToStores < ActiveRecord::Migration
  def change
    add_column :stores, :name, :string
    add_column :stores, :tel, :integer
    add_column :stores, :address, :text
    add_column :stores, :genre, :text
    add_column :stores, :image, :string
    add_column :stores, :mindelitime, :integer
    add_column :stores, :maxdelitime, :integer
    add_column :stores, :opentime, :time
    add_column :stores, :closetime, :time
  end
end
