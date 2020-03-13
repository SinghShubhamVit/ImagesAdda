# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :cat_type
      t.text :description

      t.timestamps
    end
  end
end
