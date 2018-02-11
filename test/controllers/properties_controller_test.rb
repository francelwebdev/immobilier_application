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
      post properties_url, params: { property: { ad_type_id: @property.ad_type_id, address: @property.address, area: @property.area, city: @property.city, description: @property.description, image1: @property.image1, image2: @property.image2, image3: @property.image3, latitude: @property.latitude, longitude: @property.longitude, price: @property.price, property_type_id: @property.property_type_id, title: @property.title } }
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
    patch property_url(@property), params: { property: { ad_type_id: @property.ad_type_id, address: @property.address, area: @property.area, city: @property.city, description: @property.description, image1: @property.image1, image2: @property.image2, image3: @property.image3, latitude: @property.latitude, longitude: @property.longitude, price: @property.price, property_type_id: @property.property_type_id, title: @property.title } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end
end
