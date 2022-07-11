class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :text
      t.bigint :comments_counter, default: 0
      t.bigint :likes_counter, default: 0

      t.timestamps
    end
  end
end
