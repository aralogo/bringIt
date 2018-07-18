require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, match: { acceptTime: @match.acceptTime, destinyTime: @match.destinyTime, destiny_id: @match.destiny_id, journeyID_id: @match.journeyID_id, originTime: @match.originTime, origin_id: @match.origin_id, packageID_id: @match.packageID_id, price: @match.price }
    end

    assert_redirected_to match_path(assigns(:match))
  end

  test "should show match" do
    get :show, id: @match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match
    assert_response :success
  end

  test "should update match" do
    patch :update, id: @match, match: { acceptTime: @match.acceptTime, destinyTime: @match.destinyTime, destiny_id: @match.destiny_id, journeyID_id: @match.journeyID_id, originTime: @match.originTime, origin_id: @match.origin_id, packageID_id: @match.packageID_id, price: @match.price }
    assert_redirected_to match_path(assigns(:match))
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, id: @match
    end

    assert_redirected_to matches_path
  end
end
