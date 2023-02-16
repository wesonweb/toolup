class ReviewsController < ApplicationController

  def new
    @tool = tool.find(params[:recipe_id])
    @review = Review.new(review_params)
  end

  def create
    @user = User.find params[:id]
    @booking = Booking.find(params[:id])
    @tool = Tool.find(params[:tool_id])
    @review = Review.new(review_params)
    @review.tool = @tool
    @review.user = current_user
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
