class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :content_id
      t.string :content_type
      t.text :body

      t.timestamps
    end
  end
end
