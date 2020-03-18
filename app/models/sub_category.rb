# frozen_string_literal: true

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :image_infos, dependent: :destroy

  validates :category, presence: true
  validates :image_info, presence: true
end
