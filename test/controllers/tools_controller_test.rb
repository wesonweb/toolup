require "test_helper"

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tools_index_url
    assert_response :success
  end

  test "should get show" do
    get tools_show_url
    assert_response :success
  end

  test "should get new" do
    get tools_new_url
    assert_response :success
  end

  test "should get create" do
    get tools_create_url
    assert_response :success
  end

  test "should get update" do
    get tools_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tools_destroy_url
    assert_response :success
  end
end
