# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :image_infos
end
