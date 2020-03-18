# frozen_string_literal: true

class ImageInfo < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item

  belongs_to :user
  belongs_to :sub_category
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :line_items, dependent: :destroy
  has_one_attached :image

  validates :image, presence: true
  validates :sub_category, presence: true

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Book is already in line item')
      throw :abort
    end
  end
end
