class ToolsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @tools = Tool.all
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_list
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :price, :postcode, :description)
  end
end
