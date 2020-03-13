# frozen_string_literal: true

class RemoveColumnFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :image_id
    add_reference :comments, :image_info, index: true
  end
end
