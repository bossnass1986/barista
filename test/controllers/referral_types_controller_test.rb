require 'test_helper'

class ReferralTypesControllerTest < ActionController::TestCase
  setup do
    @referral_type = referral_types(:one)
  end

  test "should get terms" do
    get :terms
    assert_response :success
    assert_not_nil assigns(:referral_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referral_type" do
    assert_difference('ReferralType.count') do
      post :create, referral_type: { name: @referral_type.name }
    end

    assert_redirected_to referral_type_path(assigns(:referral_type))
  end

  test "should terms referral_type" do
    get :terms, id: @referral_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referral_type
    assert_response :success
  end

  test "should update referral_type" do
    patch :update, id: @referral_type, referral_type: { name: @referral_type.name }
    assert_redirected_to referral_type_path(assigns(:referral_type))
  end

  test "should destroy referral_type" do
    assert_difference('ReferralType.count', -1) do
      delete :destroy, id: @referral_type
    end

    assert_redirected_to referral_types_path
  end
end
