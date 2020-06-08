class ReferencePricesController < ApplicationController
  before_action :set_reference_price, only: [:show, :update, :destroy]

  # GET /reference_prices
  def index
    @reference_prices = ReferencePrice.all

    render json: @reference_prices
  end

  # GET /reference_prices/1
  def show
    render json: @reference_price
  end

  # POST /reference_prices
  def create
    @reference_price = ReferencePrice.new(reference_price_params)

    if @reference_price.save
      render json: @reference_price, status: :created, location: @reference_price
    else
      render json: @reference_price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reference_prices/1
  def update
    if @reference_price.update(reference_price_params)
      render json: @reference_price
    else
      render json: @reference_price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reference_prices/1
  def destroy
    @reference_price.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference_price
      @reference_price = ReferencePrice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reference_price_params
      params.require(:reference_price).permit(:unitPrice, :presentation, :unitMeasure, :date_of_price)
    end
end
