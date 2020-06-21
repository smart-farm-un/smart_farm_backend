class CropsController < ApplicationController
  before_action :set_crop, only: [:show, :update, :destroy]

  # GET /crops
  def index
    @crops = Crop.all

    render json: @crops
  end

  # GET /crops/1
  def show
    render json: @crop
  end

  # POST /crops
  def create
    @crop = Crop.new(crop_params)
    @crop.user_id = current_user.id

    if @crop.save
      render json: @crop, status: :created, location: @crop
    else
      render json: @crop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crops/1
  def update
    if @crop.update(crop_params)
      render json: @crop
    else
      render json: @crop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crops/1
  def destroy
    @crop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crop
      @crop = Crop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def crop_params
      params.require(:crop).permit(:crop_type, :sowing_date, :harvesting_planned_date, :actual_harvesting_date, :sowing_area, :terrain_id, :user_id)
    end
end
