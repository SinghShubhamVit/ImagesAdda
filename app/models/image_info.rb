class ImageInfo < ApplicationRecord
	belongs_to :user
	belongs_to :sub_category
	has_many :likes
	has_many :comments
		# belongs_to :tag
	has_one_attached :image

	def thumbnail input
	 return self.image[input].variant(resize: '300*300').processed
	end

end
