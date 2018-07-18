require 'test_helper'

class LocationLogsControllerTest < ActionController::TestCase
  setup do
    @location_log = location_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_log" do
    assert_difference('LocationLog.count') do
      post :create, location_log: { latitude: @location_log.latitude, longitude: @location_log.longitude, position_time: @location_log.position_time }
    end

    assert_redirected_to location_log_path(assigns(:location_log))
  end

  test "should show location_log" do
    get :show, id: @location_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_log
    assert_response :success
  end

  test "should update location_log" do
    patch :update, id: @location_log, location_log: { latitude: @location_log.latitude, longitude: @location_log.longitude, position_time: @location_log.position_time }
    assert_redirected_to location_log_path(assigns(:location_log))
  end

  test "should destroy location_log" do
    assert_difference('LocationLog.count', -1) do
      delete :destroy, id: @location_log
    end

    assert_redirected_to location_logs_path
  end
end
