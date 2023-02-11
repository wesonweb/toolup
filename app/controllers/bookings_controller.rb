require 'date'
class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_tool, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tool = @tools
    @booking.date = Date.new
    if @booking.save
      redirect_to  tool_bookings_path(@tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to booking_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_date, :end_date, :status, :user_id, :tool_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_tool
    @tool = Tool.find(params[:tool_id])
  end
end
