class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index ]
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
     @reviews = Review.joins(:booking).where(['bookings.tool_id= ?',params[:id]])

    @markers = {
      lat: @tool.latitude,
      lng: @tool.longitude
    }
  end

  def new
    @tool = Tool.new
<<<<<<< HEAD

=======
>>>>>>> 4e172df09346c10643cedcb02e9bece1ce9c3bf2
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    @tool.image_url = "https://itslondon.s3.amazonaws.com/p/alt/xxl/MAK453SET52_2.jpg"

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
    params.require(:tool).permit(:name, :price, :address, :description, :image_url)
  end
end
