class AddReferenceUserToImageInfo < ActiveRecord::Migration[6.0]
  def change
    add_reference :image_infos, :sub_category, foreign_key: true
    add_reference :image_infos, :user, foreign_key: true
  end
end
