class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :gallery_id
      t.string :title
      t.text :caption
      t.string :image

      t.timestamps
    end
  end
end
