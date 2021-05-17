class BookingsController < ApplicationController
  def index
    #Retrieve the user id
    # Assign all bookings of the user to @bookings
    
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to product_booking()
    else 
      render :new
    end
  end

  def show
    @booking = Booking.find()
  end


  private

  def booking_params
    params.require(:booking).permit(:product_id, :user_id, :start_date, :end_date)
  end
end
