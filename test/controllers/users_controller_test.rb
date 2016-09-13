require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include Devise::TestHelpers
	
  test "should get session" do
    get :session
    assert_response :success
  end

end
