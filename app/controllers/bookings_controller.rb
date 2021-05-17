class BookingsController < ApplicationController
  # def index
  #   #Retrieve the user id
  #   # Assign all bookings of the user to @bookings
    
  # end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.user_id = current_user.id
    @booking.product_id = @product.id
    if @booking.save
      redirect_to product_path(@booking.product_id)
    else 
      render :new
    end
  end

  # def show
  #   @booking = Booking.find()
  # end


  private

  def booking_params
    params.require(:booking).permit(:product_id, :user_id, :start_date, :end_date)
  end
end
