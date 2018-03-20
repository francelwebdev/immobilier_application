require 'test_helper'

class Dashboard::PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_properties_index_url
    assert_response :success
  end

end
