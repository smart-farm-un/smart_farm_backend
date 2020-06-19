class TerrainsController < ApplicationController
  before_action :set_terrain, only: [:show, :update, :destroy]

  # GET /terrains
  def index
    @terrains = Terrain.all

    render json: @terrains
  end

  # GET /terrains/1
  def show
    render json: @terrain
  end

  # POST /terrains
  def create
    puts "current user"
    puts current_user.id
    @terrain = Terrain.new(terrain_params)
    @terrain.user_id = current_user.id 

    if @terrain.save
      render json: @terrain, status: :created, location: @terrain
    else
      render json: @terrain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /terrains/1
  def update
    if @terrain.update(terrain_params)
      render json: @terrain
    else
      render json: @terrain.errors, status: :unprocessable_entity
    end
  end

  # DELETE /terrains/1
  def destroy
    @terrain.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terrain
      @terrain = Terrain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def terrain_params
      params.require(:terrain).permit(:name, :area, :source_energy, :source_water, :state_path, :close_town, :latitude, :longitude)
    end
end
