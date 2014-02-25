require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

  test "should view profile page" do
    login_user(users(:one))
    get :show
    assert_response :success
  end

  test "should redirect if not logged in" do
    get :show
    assert_response 302
  end

  test "should update profile" do
    user = users(:one)
    login_user user
    patch :update, :user => {
      first_name: "Changed"
    }
    assert_response 302
    user.reload
    assert_equal("Changed", user.first_name)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:profiles)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create profile" do
  #   assert_difference('Profile.count') do
  #     post :create, profile: {  }
  #   end

  #   assert_redirected_to profile_path(assigns(:profile))
  # end

  # test "should show profile" do
  #   get :show, id: @profile
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @profile
  #   assert_response :success
  # end

  # test "should update profile" do
  #   patch :update, id: @profile, profile: {  }
  #   assert_redirected_to profile_path(assigns(:profile))
  # end

  # test "should destroy profile" do
  #   assert_difference('Profile.count', -1) do
  #     delete :destroy, id: @profile
  #   end

  #   assert_redirected_to profiles_path
  # end
end
