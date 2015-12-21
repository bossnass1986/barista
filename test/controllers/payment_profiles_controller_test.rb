require 'test_helper'

class PaymentProfilesControllerTest < ActionController::TestCase
  setup do
    @payment_profile = payment_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_profile" do
    assert_difference('PaymentProfile.count') do
      post :create, payment_profile: { active: @payment_profile.active, address_id: @payment_profile.address_id, card_name: @payment_profile.card_name, cc_type: @payment_profile.cc_type, default: @payment_profile.default, first_name: @payment_profile.first_name, last_digits: @payment_profile.last_digits, last_name: @payment_profile.last_name, month: @payment_profile.month, payment_cim_id: @payment_profile.payment_cim_id, user_id: @payment_profile.user_id, year: @payment_profile.year }
    end

    assert_redirected_to payment_profile_path(assigns(:payment_profile))
  end

  test "should show payment_profile" do
    get :show, id: @payment_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_profile
    assert_response :success
  end

  test "should update payment_profile" do
    patch :update, id: @payment_profile, payment_profile: { active: @payment_profile.active, address_id: @payment_profile.address_id, card_name: @payment_profile.card_name, cc_type: @payment_profile.cc_type, default: @payment_profile.default, first_name: @payment_profile.first_name, last_digits: @payment_profile.last_digits, last_name: @payment_profile.last_name, month: @payment_profile.month, payment_cim_id: @payment_profile.payment_cim_id, user_id: @payment_profile.user_id, year: @payment_profile.year }
    assert_redirected_to payment_profile_path(assigns(:payment_profile))
  end

  test "should destroy payment_profile" do
    assert_difference('PaymentProfile.count', -1) do
      delete :destroy, id: @payment_profile
    end

    assert_redirected_to payment_profiles_path
  end
end
