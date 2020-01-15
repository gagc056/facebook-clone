class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :User, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
