# frozen_string_literal: true

class SubsController < ApplicationController
  def index
    @sub_cat = SubCategory.where(category_id: params[:cat])
    @sub_category = SubCategory.where(category_id: params[:category])
  end
end
