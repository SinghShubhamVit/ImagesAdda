# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.boolean 'status', default: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
