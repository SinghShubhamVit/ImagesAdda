class SubCategory < ApplicationRecord
	belongs_to :category
	has_many :image_infos, dependent: :destroy
	
end
