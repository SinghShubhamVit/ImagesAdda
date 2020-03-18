# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_image_info(image_info)
    current_item = line_items.find_by(image_info_id: image_info.id)
    current_item = line_items.build(image_info_id: image_info.id) unless current_item.present?
    current_item
  end

  def total_price
    line_items.to_a.sum(&:price)
  end
end
