# frozen_string_literal: true

class ChangeCart < ActiveRecord::Migration[6.0]
  def change
    change_column :carts, :status, :boolean, default: false
  end
end
