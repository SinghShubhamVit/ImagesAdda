class Comment < ApplicationRecord
    belongs_to :image_info
    belongs_to :user, dependent: :destroy
end
