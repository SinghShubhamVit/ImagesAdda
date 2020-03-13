# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :image_info
  belongs_to :cart
end
