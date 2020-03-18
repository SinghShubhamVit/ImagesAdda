# frozen_string_literal: true

class DropTag < ActiveRecord::Migration[6.0]
  def change
    drop_table :tags
  end
end
