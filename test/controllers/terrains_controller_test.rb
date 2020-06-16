require 'test_helper'

class TerrainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @terrain = terrains(:one)
  end

  test "should get index" do
    get terrains_url, as: :json
    assert_response :success
  end

  test "should create terrain" do
    assert_difference('Terrain.count') do
      post terrains_url, params: { terrain: { area: @terrain.area, close_town: @terrain.close_town, latitude: @terrain.latitude, longitude: @terrain.longitude, name: @terrain.name, source_energy: @terrain.source_energy, source_water: @terrain.source_water, state_path: @terrain.state_path } }, as: :json
    end

    assert_response 201
  end

  test "should show terrain" do
    get terrain_url(@terrain), as: :json
    assert_response :success
  end

  test "should update terrain" do
    patch terrain_url(@terrain), params: { terrain: { area: @terrain.area, close_town: @terrain.close_town, latitude: @terrain.latitude, longitude: @terrain.longitude, name: @terrain.name, source_energy: @terrain.source_energy, source_water: @terrain.source_water, state_path: @terrain.state_path } }, as: :json
    assert_response 200
  end

  test "should destroy terrain" do
    assert_difference('Terrain.count', -1) do
      delete terrain_url(@terrain), as: :json
    end

    assert_response 204
  end
end
