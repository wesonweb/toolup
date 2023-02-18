class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_list, only: %i[show destroy]
  def index
    # @tools = Tool.all

    # temp
    if params[:search].present?
      sql_query = "name ILIKE :search OR description ILIKE :search"
      tmp_tools = Tool.where(sql_query, search: "%#{params[:search]}%")

    #tmp_tools = Tool.search_by_name_and_description(params[:search])
    else
      tmp_tools = Tool.all
      # @tools = Tool.all.order('tools.price ASC')
    end
    if params[:order].present? && current_user.present?
      if params[:order] == "asc"
        @tools = tmp_tools.order('tools.price ASC')
      elsif params[:order] == "desc"
        @tools = tmp_tools.order('tools.price DESC')
      else
        @tools = tmp_tools.near(Geocoder.coordinates(current_user.postcode))
      end
    else
      @tools = tmp_tools
    end

  end

  def show
    @booking = Booking.new
    @review = Review.new
    @markers = {
      lat: @tool.latitude,
      lng: @tool.longitude
    }
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
