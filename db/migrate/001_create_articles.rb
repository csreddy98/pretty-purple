class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false, limit: 40
      t.text :content, null: false
      t.string :author, null: false
      t.string :category
      t.date :published_at, null: false

      t.timestamps
    end
  end
end
