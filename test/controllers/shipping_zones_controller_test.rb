require 'test_helper'

class ShippingZonesControllerTest < ActionController::TestCase
  setup do
    @shipping_zone = shipping_zones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_zone" do
    assert_difference('ShippingZone.count') do
      post :create, shipping_zone: { name: @shipping_zone.name }
    end

    assert_redirected_to shipping_zone_path(assigns(:shipping_zone))
  end

  test "should show shipping_zone" do
    get :show, id: @shipping_zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_zone
    assert_response :success
  end

  test "should update shipping_zone" do
    patch :update, id: @shipping_zone, shipping_zone: { name: @shipping_zone.name }
    assert_redirected_to shipping_zone_path(assigns(:shipping_zone))
  end

  test "should destroy shipping_zone" do
    assert_difference('ShippingZone.count', -1) do
      delete :destroy, id: @shipping_zone
    end

    assert_redirected_to shipping_zones_path
  end
end
