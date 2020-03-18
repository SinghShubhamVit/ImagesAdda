# frozen_string_literal: true

require 'test_helper'

class SubsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get subs_index_url
    assert_response :success
  end
end
