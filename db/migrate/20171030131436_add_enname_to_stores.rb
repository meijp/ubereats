class AddEnnameToStores < ActiveRecord::Migration
  def change
    add_column :stores, :en_name, :string
    add_column :stores, :latitude, :float
    add_column :stores, :longitude, :float
  end
end
