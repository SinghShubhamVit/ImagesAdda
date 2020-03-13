# frozen_string_literal: true

class ImageInfo < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :line_items, dependent: :destroy
  # belongs_to :tag
  has_one_attached :image

  validates :image, presence: true
  validates :sub_category, presence: true
end
