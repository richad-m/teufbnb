class BookingsController < ApplicationController
  def index
    #Retrieve the user id
    @bookings = policy_scope(Booking)
    @bookings = current_user.bookings
    # Assign all bookings of the user to @bookings

  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.user = current_user
    @booking.product = @product
    if @booking.save!
      redirect_to product_path(@booking.product)
      # redirect_to bookings_path
    else
      render :new
    end
  end


  # def show
  #   @booking = Booking.find()
  # end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
