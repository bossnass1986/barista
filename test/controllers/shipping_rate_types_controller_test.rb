require 'test_helper'

class ShippingRateTypesControllerTest < ActionController::TestCase
  setup do
    @shipping_rate_type = shipping_rate_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_rate_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_rate_type" do
    assert_difference('ShippingRateType.count') do
      post :create, shipping_rate_type: { name: @shipping_rate_type.name }
    end

    assert_redirected_to shipping_rate_type_path(assigns(:shipping_rate_type))
  end

  test "should show shipping_rate_type" do
    get :show, id: @shipping_rate_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_rate_type
    assert_response :success
  end

  test "should update shipping_rate_type" do
    patch :update, id: @shipping_rate_type, shipping_rate_type: { name: @shipping_rate_type.name }
    assert_redirected_to shipping_rate_type_path(assigns(:shipping_rate_type))
  end

  test "should destroy shipping_rate_type" do
    assert_difference('ShippingRateType.count', -1) do
      delete :destroy, id: @shipping_rate_type
    end

    assert_redirected_to shipping_rate_types_path
  end
end
