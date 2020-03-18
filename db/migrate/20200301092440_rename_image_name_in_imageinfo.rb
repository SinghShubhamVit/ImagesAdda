# frozen_string_literal: true

class RenameImageNameInImageinfo < ActiveRecord::Migration[6.0]
  def change
    rename_column :image_infos, :name, :img_name
  end
end
