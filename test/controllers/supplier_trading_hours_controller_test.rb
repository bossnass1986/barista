require 'test_helper'

class SupplierTradingHoursControllerTest < ActionController::TestCase
  setup do
    trading_hour = supplier_trading_hours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trading_hours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trading_hour" do
    assert_difference('TradingHour.count') do
      post :create, trading_hour: {close_time: trading_hour.close_time, open_time: trading_hour.open_time, merchant_id: trading_hour.supplier_id, weekday: trading_hour.weekday}
    end

    assert_redirected_to supplier_trading_hour_path(assigns(:trading_hour))
  end

  test "should show trading_hour" do
    get :show, id: trading_hour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: trading_hour
    assert_response :success
  end

  test "should update trading_hour" do
    patch :update, id: trading_hour, trading_hour: {close_time: trading_hour.close_time, open_time: trading_hour.open_time, merchant_id: trading_hour.supplier_id, weekday: trading_hour.weekday}
    assert_redirected_to supplier_trading_hour_path(assigns(:trading_hour))
  end

  test "should destroy trading_hour" do
    assert_difference('TradingHour.count', -1) do
      delete :destroy, id: trading_hour
    end

    assert_redirected_to supplier_trading_hours_path
  end
end
