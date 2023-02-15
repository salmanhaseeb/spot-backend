class Api::V1::SpotsController < ApplicationController
  before_action :set_spot, only: %i[update destroy show]
  skip_before_action :verify_authenticity_token

  # GET /api/v1/spots
  def index
    @spots = Spot.all.order(price: params[:sort_by_price].present? ? params[:sort_by_price] : :desc )
  end

  # GET /api/v1/spots/:id
  def show; end

  # POST /api/v1/spots
  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      render :create, status: :created
    else
      render json: {message: @spot.errors}, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/spots/:id
  # PATCH /api/v1/spots/:id
  def update
    if @spot.update(spot_params)
      render :update, status: :created
    else
      render json: {message: @spot.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/spots/:id
  def destroy
    if @spot.destroy
      render :destroy
    else
      render json: { message: @spot.errors }
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.permit(:title, :description, :price, images_attributes: [ :id, :file, :primary, :_destroy ])
  end
end
