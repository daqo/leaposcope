require 'test_helper'

class PlaybacksControllerTest < ActionController::TestCase
  setup do
    @playback = playbacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playback" do
    assert_difference('Playback.count') do
      post :create, playback: { name: @playback.name }
    end

    assert_redirected_to playback_path(assigns(:playback))
  end

  test "should show playback" do
    get :show, id: @playback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playback
    assert_response :success
  end

  test "should update playback" do
    patch :update, id: @playback, playback: { name: @playback.name }
    assert_redirected_to playback_path(assigns(:playback))
  end

  test "should destroy playback" do
    assert_difference('Playback.count', -1) do
      delete :destroy, id: @playback
    end

    assert_redirected_to playbacks_path
  end
end
