class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :user, null: false, index: true
      t.string :title
      t.text :content
      t.datetime :top_touched_at, null: false, default: Date.new(1970, 1, 1)
      t.timestamps
    end
  end
end
