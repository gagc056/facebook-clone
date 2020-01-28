class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :user
      t.string :references
      t.references :post, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
