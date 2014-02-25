require 'test_helper'

class AuthControllerTest < ActionController::TestCase

  test "should get login" do
    get :login
    assert_response 200
  end

  test "should login" do
    post :dologin, :email => users(:one).email, :password => "password" 
    # assert_response 302
    assert_redirected_to root_path
    assert_equal(users(:one).id, session[:user_id])
  end

end
