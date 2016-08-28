require 'test_helper'

class ReferralProgramsControllerTest < ActionController::TestCase
  setup do
    @referral_program = referral_programs(:one)
  end

  test "should get show" do
    get :show
    assert_response :success
    assert_not_nil assigns(:referral_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referral_program" do
    assert_difference('ReferralProgram.count') do
      post :create, referral_program: { active: @referral_program.active, description: @referral_program.description, name: @referral_program.name, referral_bonus_id: @referral_program.referral_bonus_id }
    end

    assert_redirected_to referral_program_path(assigns(:referral_program))
  end

  test "should show referral_program" do
    get :show, id: @referral_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referral_program
    assert_response :success
  end

  test "should update referral_program" do
    patch :update, id: @referral_program, referral_program: { active: @referral_program.active, description: @referral_program.description, name: @referral_program.name, referral_bonus_id: @referral_program.referral_bonus_id }
    assert_redirected_to referral_program_path(assigns(:referral_program))
  end

  test "should destroy referral_program" do
    assert_difference('ReferralProgram.count', -1) do
      delete :destroy, id: @referral_program
    end

    assert_redirected_to referral_programs_path
  end
end
