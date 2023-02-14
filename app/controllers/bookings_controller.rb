require 'date'
class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  # before_action :set_tool, only: %i[new create]

  def index
    @bookings = Booking.all
    # @tools = Tool.all
    # @tool = Tool.find(params[:tool_id])
  end

  # def new
  #   @booking = Booking.new
  # end

  def show
    @tools = Tool.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end

  def create
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.tool = @tool
    @booking.date = Date.today
    if @booking.save!
      redirect_to  booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end
end
