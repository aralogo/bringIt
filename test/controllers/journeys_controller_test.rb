require 'test_helper'

class JourneysControllerTest < ActionController::TestCase
  setup do
    @journey = journeys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journey" do
    assert_difference('Journey.count') do
      post :create, journey: { destinyTime: @journey.destinyTime, destiny_id: @journey.destiny_id, driverID_id: @journey.driverID_id, intermediate1_id: @journey.intermediate1_id, intermediate2_id: @journey.intermediate2_id, intermediate3_id: @journey.intermediate3_id, originTime: @journey.originTime, origin_id: @journey.origin_id, price12: @journey.price12, price23: @journey.price23, priceTotal: @journey.priceTotal }
    end

    assert_redirected_to journey_path(assigns(:journey))
  end

  test "should show journey" do
    get :show, id: @journey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journey
    assert_response :success
  end

  test "should update journey" do
    patch :update, id: @journey, journey: { destinyTime: @journey.destinyTime, destiny_id: @journey.destiny_id, driverID_id: @journey.driverID_id, intermediate1_id: @journey.intermediate1_id, intermediate2_id: @journey.intermediate2_id, intermediate3_id: @journey.intermediate3_id, originTime: @journey.originTime, origin_id: @journey.origin_id, price12: @journey.price12, price23: @journey.price23, priceTotal: @journey.priceTotal }
    assert_redirected_to journey_path(assigns(:journey))
  end

  test "should destroy journey" do
    assert_difference('Journey.count', -1) do
      delete :destroy, id: @journey
    end

    assert_redirected_to journeys_path
  end
end
