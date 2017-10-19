class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string      :name
      t.integer     :price
      t.text        :detail
      t.string      :image
      t.text        :category
      t.integer     :stock
      t.integer     :store_id
      t.timestamps null: false
    end
  end
end
