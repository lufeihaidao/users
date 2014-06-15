class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :name, :string, default: "二狗蛋儿"
    add_column :users, :phone, :integer
    add_column :users, :qq, :integer
    add_column :users, :birthday, :date
  end
end
