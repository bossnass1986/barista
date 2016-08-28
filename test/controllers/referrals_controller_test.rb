require 'test_helper'

class ReferralsControllerTest < ActionController::TestCase
  setup do
    @referral = referrals(:one)
  end

  test "should get terms" do
    get :terms
    assert_response :success
    assert_not_nil assigns(:referrals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referral" do
    assert_difference('Referral.count') do
      post :create, referral: { applied: @referral.applied, clicked_at: @referral.clicked_at, email: @referral.email, name: @referral.name, purchased_at: @referral.purchased_at, referral_program_id: @referral.referral_program_id, referral_type_id: @referral.referral_type_id, referral_user_id: @referral.referral_user_id, referring_user_id: @referral.referring_user_id, registered_at: @referral.registered_at, sent_at: @referral.sent_at }
    end

    assert_redirected_to referral_path(assigns(:referral))
  end

  test "should terms referral" do
    get :terms, id: @referral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referral
    assert_response :success
  end

  test "should update referral" do
    patch :update, id: @referral, referral: { applied: @referral.applied, clicked_at: @referral.clicked_at, email: @referral.email, name: @referral.name, purchased_at: @referral.purchased_at, referral_program_id: @referral.referral_program_id, referral_type_id: @referral.referral_type_id, referral_user_id: @referral.referral_user_id, referring_user_id: @referral.referring_user_id, registered_at: @referral.registered_at, sent_at: @referral.sent_at }
    assert_redirected_to referral_path(assigns(:referral))
  end

  test "should destroy referral" do
    assert_difference('Referral.count', -1) do
      delete :destroy, id: @referral
    end

    assert_redirected_to referrals_path
  end
end
