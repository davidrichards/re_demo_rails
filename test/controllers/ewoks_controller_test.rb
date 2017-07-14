require 'test_helper'

class EwoksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ewoks_index_url
    assert_response :success
  end

end
