class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_list, only: [:show, :destroy]
  def index
   # @tools = Tool.all

   #temp
    if params[:search].present?
      tmp_tools = Tool.where("description ILIKE ?", "%#{params[:search]}%")
    else
      tmp_tools = Tool.all
      #@tools = Tool.all.order('tools.price ASC')
    end
    if params[:order].present?
      if params[:order] == "asc"
        @tools = tmp_tools.order('tools.price ASC')
      else
        @tools = tmp_tools.order('tools.price DESC')
      end
    else
      @tools = tmp_tools
    end
  end

  def show
    @review = Review.new
    @booking = Booking.new
  end

  def new
    @tool = Tool.new
    @tool = tool.find(params[:recipe_id])
    @review = Review.new(review_params)
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
