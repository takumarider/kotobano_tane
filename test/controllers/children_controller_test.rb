require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get children_dashboard_url
    assert_response :success
  end
end
