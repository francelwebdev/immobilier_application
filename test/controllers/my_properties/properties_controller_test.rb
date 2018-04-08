require 'test_helper'

class MyProperties::PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_properties_properties_index_url
    assert_response :success
  end

end
