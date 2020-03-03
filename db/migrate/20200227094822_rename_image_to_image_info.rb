class RenameImageToImageInfo < ActiveRecord::Migration[6.0]
	def change
		rename_table :images, :image_infos
  end
end
