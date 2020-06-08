require 'test_helper'

class CropTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crop_type = crop_types(:one)
  end

  test "should get index" do
    get crop_types_url, as: :json
    assert_response :success
  end

  test "should create crop_type" do
    assert_difference('CropType.count') do
      post crop_types_url, params: { crop_type: { description: @crop_type.description, name: @crop_type.name, scientificName: @crop_type.scientificName } }, as: :json
    end

    assert_response 201
  end

  test "should show crop_type" do
    get crop_type_url(@crop_type), as: :json
    assert_response :success
  end

  test "should update crop_type" do
    patch crop_type_url(@crop_type), params: { crop_type: { description: @crop_type.description, name: @crop_type.name, scientificName: @crop_type.scientificName } }, as: :json
    assert_response 200
  end

  test "should destroy crop_type" do
    assert_difference('CropType.count', -1) do
      delete crop_type_url(@crop_type), as: :json
    end

    assert_response 204
  end
end
