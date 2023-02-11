class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @tool = Tool.find(params[:tool_id])
    @review.tool = @tool
    @review.user = current_user
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
