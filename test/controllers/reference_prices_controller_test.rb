require 'test_helper'

class ReferencePricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reference_price = reference_prices(:one)
  end

  test "should get index" do
    get reference_prices_url, as: :json
    assert_response :success
  end

  test "should create reference_price" do
    assert_difference('ReferencePrice.count') do
      post reference_prices_url, params: { reference_price: { date_of_price: @reference_price.date_of_price, presentation: @reference_price.presentation, unitMeasure: @reference_price.unitMeasure, unitPrice: @reference_price.unitPrice } }, as: :json
    end

    assert_response 201
  end

  test "should show reference_price" do
    get reference_price_url(@reference_price), as: :json
    assert_response :success
  end

  test "should update reference_price" do
    patch reference_price_url(@reference_price), params: { reference_price: { date_of_price: @reference_price.date_of_price, presentation: @reference_price.presentation, unitMeasure: @reference_price.unitMeasure, unitPrice: @reference_price.unitPrice } }, as: :json
    assert_response 200
  end

  test "should destroy reference_price" do
    assert_difference('ReferencePrice.count', -1) do
      delete reference_price_url(@reference_price), as: :json
    end

    assert_response 204
  end
end
