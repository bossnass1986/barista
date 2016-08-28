require 'test_helper'

class StatesControllerTest < ActionController::TestCase
  setup do
    @state = states(:one)
  end

  test "should get terms" do
    get :terms
    assert_response :success
    assert_not_nil assigns(:states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create state" do
    assert_difference('State.count') do
      post :create, state: { abbreviation: @state.abbreviation, country_id: @state.country_id, described_as: @state.described_as, name: @state.name, shipping_zone_id: @state.shipping_zone_id }
    end

    assert_redirected_to state_path(assigns(:state))
  end

  test "should terms state" do
    get :terms, id: @state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @state
    assert_response :success
  end

  test "should update state" do
    patch :update, id: @state, state: { abbreviation: @state.abbreviation, country_id: @state.country_id, described_as: @state.described_as, name: @state.name, shipping_zone_id: @state.shipping_zone_id }
    assert_redirected_to state_path(assigns(:state))
  end

  test "should destroy state" do
    assert_difference('State.count', -1) do
      delete :destroy, id: @state
    end

    assert_redirected_to states_path
  end
end
