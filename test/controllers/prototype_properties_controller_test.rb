require 'test_helper'

class PrototypePropertiesControllerTest < ActionController::TestCase
  setup do
    @prototype_property = prototype_properties(:one)
  end

  test "should get terms" do
    get :terms
    assert_response :success
    assert_not_nil assigns(:prototype_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prototype_property" do
    assert_difference('PrototypeProperty.count') do
      post :create, prototype_property: { property_id: @prototype_property.property_id, prototype_id: @prototype_property.prototype_id }
    end

    assert_redirected_to prototype_property_path(assigns(:prototype_property))
  end

  test "should terms prototype_property" do
    get :terms, id: @prototype_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prototype_property
    assert_response :success
  end

  test "should update prototype_property" do
    patch :update, id: @prototype_property, prototype_property: { property_id: @prototype_property.property_id, prototype_id: @prototype_property.prototype_id }
    assert_redirected_to prototype_property_path(assigns(:prototype_property))
  end

  test "should destroy prototype_property" do
    assert_difference('PrototypeProperty.count', -1) do
      delete :destroy, id: @prototype_property
    end

    assert_redirected_to prototype_properties_path
  end
end
