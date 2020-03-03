class SubCategory < ApplicationRecord
	belongs_to :category
	has_many :images_infos, dependent: :destroy
	
end
