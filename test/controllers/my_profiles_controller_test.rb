require 'test_helper'

class MyProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get my_profiles_edit_url
    assert_response :success
  end

end
