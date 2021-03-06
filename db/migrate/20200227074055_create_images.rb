class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :image_name
      t.string :img_type
      t.text :description
      t.integer :price
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
