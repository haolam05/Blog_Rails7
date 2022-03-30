require "test_helper"

class UsrsControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get usrs_profile_url
    assert_response :success
  end
end
