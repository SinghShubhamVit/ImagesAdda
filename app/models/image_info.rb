class Image < ApplicationRecord
	belongs_to :user
	belongs_to :sub_category
	has_many :likes
	has_many :comments
	belongs_to :tag
	

	has_many_attached :images

end
