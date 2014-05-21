require 'test_helper'

class TracksControllerTest < ActionController::TestCase
  test "should get tracker_index" do
    get :tracker_index
    assert_response :success
  end

  test "should get tracked_index" do
    get :tracked_index
    assert_response :success
  end

end
