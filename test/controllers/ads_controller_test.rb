require 'test_helper'

class AdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ad = ads(:one)
  end

  test "should get index" do
    get ads_url
    assert_response :success
  end

  test "should get new" do
    get new_ad_url
    assert_response :success
  end

  test "should create ad" do
    assert_difference('Ad.count') do
      post ads_url, params: { ad: { address: @ad.address, area: @ad.area, city: @ad.city, description: @ad.description, image1_url: @ad.image1_url, image2_url: @ad.image2_url, image3_url: @ad.image3_url, price: @ad.price, title: @ad.title, type_of_property_id: @ad.type_of_property_id } }
    end

    assert_redirected_to ad_url(Ad.last)
  end

  test "should show ad" do
    get ad_url(@ad)
    assert_response :success
  end

  test "should get edit" do
    get edit_ad_url(@ad)
    assert_response :success
  end

  test "should update ad" do
    patch ad_url(@ad), params: { ad: { address: @ad.address, area: @ad.area, city: @ad.city, description: @ad.description, image1_url: @ad.image1_url, image2_url: @ad.image2_url, image3_url: @ad.image3_url, price: @ad.price, title: @ad.title, type_of_property_id: @ad.type_of_property_id } }
    assert_redirected_to ad_url(@ad)
  end

  test "should destroy ad" do
    assert_difference('Ad.count', -1) do
      delete ad_url(@ad)
    end

    assert_redirected_to ads_url
  end
end
