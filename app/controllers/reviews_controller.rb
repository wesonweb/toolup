class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @tool = @booking.tool
    @review = Review.new
  end

  def create
    # @user = current_user
    @booking = Booking.find(params[:booking_id])
    @tool = @booking.tool
    @review = Review.new(review_params)
    # @review.user = current_user
    @review.booking = @booking

    if @review.save
      redirect_to tool_path(@tool)
    else
      render 'tools/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to tool_path(@tool)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
