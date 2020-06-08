class CropTypesController < ApplicationController
  before_action :set_crop_type, only: [:show, :update, :destroy]

  # GET /crop_types
  def index
    @crop_types = CropType.all

    render json: @crop_types
  end

  # GET /crop_types/1
  def show
    render json: @crop_type
  end

  # POST /crop_types
  def create
    @crop_type = CropType.new(crop_type_params)

    if @crop_type.save
      render json: @crop_type, status: :created, location: @crop_type
    else
      render json: @crop_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crop_types/1
  def update
    if @crop_type.update(crop_type_params)
      render json: @crop_type
    else
      render json: @crop_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crop_types/1
  def destroy
    @crop_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crop_type
      @crop_type = CropType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def crop_type_params
      params.require(:crop_type).permit(:name, :description, :scientificName)
    end
end
