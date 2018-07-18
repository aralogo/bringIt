require 'test_helper'

class ContractOriginsControllerTest < ActionController::TestCase
  setup do
    @contract_origin = contract_origins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_origins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_origin" do
    assert_difference('ContractOrigin.count') do
      post :create, contract_origin: { comment: @contract_origin.comment, isSigned_Driver: @contract_origin.isSigned_Driver, isSigned_Sender: @contract_origin.isSigned_Sender, matchID_id: @contract_origin.matchID_id, origin_date: @contract_origin.origin_date }
    end

    assert_redirected_to contract_origin_path(assigns(:contract_origin))
  end

  test "should show contract_origin" do
    get :show, id: @contract_origin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_origin
    assert_response :success
  end

  test "should update contract_origin" do
    patch :update, id: @contract_origin, contract_origin: { comment: @contract_origin.comment, isSigned_Driver: @contract_origin.isSigned_Driver, isSigned_Sender: @contract_origin.isSigned_Sender, matchID_id: @contract_origin.matchID_id, origin_date: @contract_origin.origin_date }
    assert_redirected_to contract_origin_path(assigns(:contract_origin))
  end

  test "should destroy contract_origin" do
    assert_difference('ContractOrigin.count', -1) do
      delete :destroy, id: @contract_origin
    end

    assert_redirected_to contract_origins_path
  end
end
