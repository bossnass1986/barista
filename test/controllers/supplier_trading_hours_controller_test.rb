require 'test_helper'

class SupplierTradingHoursControllerTest < ActionController::TestCase
  setup do
    @supplier_trading_hour = supplier_trading_hours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplier_trading_hours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier_trading_hour" do
    assert_difference('SupplierTradingHour.count') do
      post :create, supplier_trading_hour: { close_time: @supplier_trading_hour.close_time, open_time: @supplier_trading_hour.open_time, supplier_id: @supplier_trading_hour.supplier_id, weekday: @supplier_trading_hour.weekday }
    end

    assert_redirected_to supplier_trading_hour_path(assigns(:supplier_trading_hour))
  end

  test "should show supplier_trading_hour" do
    get :show, id: @supplier_trading_hour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier_trading_hour
    assert_response :success
  end

  test "should update supplier_trading_hour" do
    patch :update, id: @supplier_trading_hour, supplier_trading_hour: { close_time: @supplier_trading_hour.close_time, open_time: @supplier_trading_hour.open_time, supplier_id: @supplier_trading_hour.supplier_id, weekday: @supplier_trading_hour.weekday }
    assert_redirected_to supplier_trading_hour_path(assigns(:supplier_trading_hour))
  end

  test "should destroy supplier_trading_hour" do
    assert_difference('SupplierTradingHour.count', -1) do
      delete :destroy, id: @supplier_trading_hour
    end

    assert_redirected_to supplier_trading_hours_path
  end
end
