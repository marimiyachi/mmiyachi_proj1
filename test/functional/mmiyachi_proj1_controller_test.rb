require 'test_helper'

class MmiyachiProj1ControllerTest < ActionController::TestCase
  test "should get sites" do
    get :sites
    assert_response :success
  end

end
