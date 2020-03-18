# frozen_string_literal: true

class RenameImageNameInImageInfo < ActiveRecord::Migration[6.0]
  def change
    rename_column :image_infos, :image_name, :name
  end
end
