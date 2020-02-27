class SubCategory < ApplicationRecord
	belongs_to :category
	has_many :images, dependent: :destroy
	
end
