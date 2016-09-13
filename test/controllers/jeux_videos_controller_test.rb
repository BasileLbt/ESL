require 'test_helper'

class JeuxVideosControllerTest < ActionController::TestCase
  setup do
    @jeux_video = jeux_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jeux_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jeux_video" do
    assert_difference('JeuxVideo.count') do
      post :create, jeux_video: {  }
    end

    assert_redirected_to jeux_video_path(assigns(:jeux_video))
  end

  test "should show jeux_video" do
    get :show, id: @jeux_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jeux_video
    assert_response :success
  end

  test "should update jeux_video" do
    patch :update, id: @jeux_video, jeux_video: {  }
    assert_redirected_to jeux_video_path(assigns(:jeux_video))
  end

  test "should destroy jeux_video" do
    assert_difference('JeuxVideo.count', -1) do
      delete :destroy, id: @jeux_video
    end

    assert_redirected_to jeux_videos_path
  end
end
