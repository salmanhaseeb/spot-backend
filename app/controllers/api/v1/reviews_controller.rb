class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: %i[update destroy]
  skip_before_action :verify_authenticity_token

  # POST /api/v1/spots/:spot_id/reviews
  def create
    @review = Review.new(review_params)
    if @review.save
      render :create, status: :created
    else
      render json: {message: @review.errors}, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/spots/:spot_id/reviews/:id
  # PATCH /api/v1/spots/:spot_id/reviews/:id
  def update
    if @review.update(review_params)
      render :update, status: :created
    else
      render json: {message: @review.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/spots/:spot_id/reviews/:id
  def destroy
    if @review.destroy
      render :destroy
    else
      render json: { message: @review.errors }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.permit(:spot_id, :reviewer_name, :comment, :star)
  end
end
