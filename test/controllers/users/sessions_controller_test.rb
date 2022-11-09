require "test_helper"

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get guest_sign_in" do
    get users_sessions_guest_sign_in_url
    assert_response :success
  end
end
