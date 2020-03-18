# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :image_info
  belongs_to :user
  validates :content, length: { maximum: 100, minimum: 5, message: 'must be available.' }
end
