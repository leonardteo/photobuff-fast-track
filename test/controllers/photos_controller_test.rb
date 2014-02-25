require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  
  def create_photo
    Photo.create({
      title: "Test Photo",
      description: "Test Description",
      user_id: users(:one).id,
      photo: File.open("#{Rails.root}/test/fixtures/photos/photo1.jpg")
      })
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  test "should get new" do
    login_user(users(:one))
    get :new
    assert_response :success
  end

  test "should create photo" do
    login_user(users(:one))
    assert_difference('Photo.count') do
      post :create, photo: { description: "Test", title: "Test", user_id: users(:one).id, photo: fixture_file_upload("photos/photo1.jpg") }
    end
    assert_redirected_to photo_path(assigns(:photo))
  end

  test "should show photo" do
    photo = create_photo
    get :show, id: photo.id
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @photo
  #   assert_response :success
  # end

  # test "should update photo" do
  #   patch :update, id: @photo, photo: { description: @photo.description, image: @photo.image, thumbnail: @photo.thumbnail, title: @photo.title }
  #   assert_redirected_to photo_path(assigns(:photo))
  # end

  # test "should destroy photo" do
  #   assert_difference('Photo.count', -1) do
  #     delete :destroy, id: @photo
  #   end

  #   assert_redirected_to photos_path
  # end
end
