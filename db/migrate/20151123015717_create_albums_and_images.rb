class CreateAlbumsAndImages < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.string :desc
      t.integer :cover
    end
    create_table :images do |t|
      t.string :item
      t.string :desc
    end
  end
end
