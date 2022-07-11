class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :title
      t.string :photo
      t.text :bio
      t.bigint :posts_counter, default:0

      t.timestamps
    end
  end
end
