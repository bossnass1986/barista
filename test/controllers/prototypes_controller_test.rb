require 'test_helper'

class PrototypesControllerTest < ActionController::TestCase
  setup do
    @prototype = prototypes(:one)
  end

  test "should get terms" do
    get :terms
    assert_response :success
    assert_not_nil assigns(:prototypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prototype" do
    assert_difference('Prototype.count') do
      post :create, prototype: { active: @prototype.active, name: @prototype.name }
    end

    assert_redirected_to prototype_path(assigns(:prototype))
  end

  test "should terms prototype" do
    get :terms, id: @prototype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prototype
    assert_response :success
  end

  test "should update prototype" do
    patch :update, id: @prototype, prototype: { active: @prototype.active, name: @prototype.name }
    assert_redirected_to prototype_path(assigns(:prototype))
  end

  test "should destroy prototype" do
    assert_difference('Prototype.count', -1) do
      delete :destroy, id: @prototype
    end

    assert_redirected_to prototypes_path
  end
end
