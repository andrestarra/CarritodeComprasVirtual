require 'test_helper'

class InicioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inicio_index_url
    assert_response :success
  end

  test "should get show" do
    get inicio_show_url
    assert_response :success
  end

end
