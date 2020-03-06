class ImageInfo < ApplicationRecord
	belongs_to :user
	belongs_to :sub_category
	has_many :likes, dependent: :destroy
	has_many :liking_users, :through => :likes, :source => :user
	has_many :comments
		# belongs_to :tag
	has_one_attached :image

	def thumbnail input
	 return self.image[input].variant(resize: '600*300!').processed
	end

end
