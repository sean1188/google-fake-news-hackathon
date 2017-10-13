require 'test_helper'

class CheckersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checkers_index_url
    assert_response :success
  end

  test "should get show" do
    get checkers_show_url
    assert_response :success
  end

end
