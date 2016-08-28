require 'test_helper'

class MerchantTypesControllerTest < ActionController::TestCase
  setup do
    @merchant_type = merchant_types(:one)
  end

  test "should get terms" do
    get :terms
    assert_response :success
    assert_not_nil assigns(:merchant_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_type" do
    assert_difference('MerchantType.count') do
      post :create, merchant_type: {active: @merchant_type.active, name: @merchant_type.name}
    end

    assert_redirected_to merchant_type_path(assigns(:merchant_type))
  end

  test "should terms merchant_type" do
    get :terms, id: @merchant_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant_type
    assert_response :success
  end

  test "should update merchant_type" do
    patch :update, id: @merchant_type, merchant_type: {active: @merchant_type.active, name: @merchant_type.name}
    assert_redirected_to merchant_type_path(assigns(:merchant_type))
  end

  test "should destroy merchant_type" do
    assert_difference('MerchantType.count', -1) do
      delete :destroy, id: @merchant_type
    end

    assert_redirected_to merchant_types_path
  end
end
