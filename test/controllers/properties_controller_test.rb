require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { address: @property.address, area: @property.area, city: @property.city, description: @property.description, image1_url: @property.image1_url, image2_url: @property.image2_url, image3_url: @property.image3_url, price: @property.price, title: @property.title, type_of_property_id: @property.type_of_property_id, type_of_transaction_id: @property.type_of_transaction_id } }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { address: @property.address, area: @property.area, city: @property.city, description: @property.description, image1_url: @property.image1_url, image2_url: @property.image2_url, image3_url: @property.image3_url, price: @property.price, title: @property.title, type_of_property_id: @property.type_of_property_id, type_of_transaction_id: @property.type_of_transaction_id } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end
end
