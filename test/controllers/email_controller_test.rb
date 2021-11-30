require "test_helper"

class EmailControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get email_edit_url
    assert_response :success
  end
end
