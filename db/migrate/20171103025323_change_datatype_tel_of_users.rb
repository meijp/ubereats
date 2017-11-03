class ChangeDatatypeTelOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :tel, :string
  end
end
