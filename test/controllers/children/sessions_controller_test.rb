require "test_helper"

class Children::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get children_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get children_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get children_sessions_destroy_url
    assert_response :success
  end
end
