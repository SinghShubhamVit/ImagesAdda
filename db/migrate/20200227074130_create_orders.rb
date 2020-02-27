class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :image_price
      t.string :total_items
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
