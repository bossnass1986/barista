require 'test_helper'

class PhoneTypesControllerTest < ActionController::TestCase
  setup do
    @phone_type = phone_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phone_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phone_type" do
    assert_difference('PhoneType.count') do
      post :create, phone_type: { name: @phone_type.name }
    end

    assert_redirected_to phone_type_path(assigns(:phone_type))
  end

  test "should show phone_type" do
    get :show, id: @phone_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phone_type
    assert_response :success
  end

  test "should update phone_type" do
    patch :update, id: @phone_type, phone_type: { name: @phone_type.name }
    assert_redirected_to phone_type_path(assigns(:phone_type))
  end

  test "should destroy phone_type" do
    assert_difference('PhoneType.count', -1) do
      delete :destroy, id: @phone_type
    end

    assert_redirected_to phone_types_path
  end
end
