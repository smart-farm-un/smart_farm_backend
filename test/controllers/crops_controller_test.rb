require 'test_helper'

class CropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crop = crops(:one)
  end

  test "should get index" do
    get crops_url, as: :json
    assert_response :success
  end

  test "should create crop" do
    assert_difference('Crop.count') do
      post crops_url, params: { crop: { actual_harvesting_date: @crop.actual_harvesting_date, crop_type: @crop.crop_type, harvesting_planned_date: @crop.harvesting_planned_date, sowing_area: @crop.sowing_area, sowing_date: @crop.sowing_date, terrain_id: @crop.terrain_id, user_id: @crop.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show crop" do
    get crop_url(@crop), as: :json
    assert_response :success
  end

  test "should update crop" do
    patch crop_url(@crop), params: { crop: { actual_harvesting_date: @crop.actual_harvesting_date, crop_type: @crop.crop_type, harvesting_planned_date: @crop.harvesting_planned_date, sowing_area: @crop.sowing_area, sowing_date: @crop.sowing_date, terrain_id: @crop.terrain_id, user_id: @crop.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy crop" do
    assert_difference('Crop.count', -1) do
      delete crop_url(@crop), as: :json
    end

    assert_response 204
  end
end
