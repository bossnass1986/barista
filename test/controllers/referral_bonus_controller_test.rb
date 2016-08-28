require 'test_helper'

class ReferralBonusControllerTest < ActionController::TestCase
  setup do
    referral_bonus = referral_bonus(:one)
  end

  test "should get show" do
    get :show
    assert_response :success
    assert_not_nil assigns(:referral_bonus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referral_bonu" do
    assert_difference('ReferralBonu.count') do
      post :create, referral_bonus: { amount: referral_bonus.amount, name: referral_bonus.name }
    end

    assert_redirected_to referral_bonu_path(assigns(:referral_bonus))
  end

  test "should show referral_bonu" do
    get :show, id: referral_bonus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: referral_bonus
    assert_response :success
  end

  test "should update referral_bonu" do
    patch :update, id: referral_bonus, referral_bonus: { amount: referral_bonus.amount, name: referral_bonus.name }
    assert_redirected_to referral_bonu_path(assigns(:referral_bonus))
  end

  test "should destroy referral_bonu" do
    assert_difference('ReferralBonu.count', -1) do
      delete :destroy, id: referral_bonus
    end

    assert_redirected_to referral_bonus_path
  end
end
