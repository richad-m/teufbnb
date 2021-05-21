class BookingsController < ApplicationController
  def index
    #Retrieve the user id
    @bookings = policy_scope(Booking)
    # @bookings = current_user.bookings
    # Assign all bookings of the user to @bookings
    @my_bookings = @bookings.where(user_id: current_user.id)
    @bookings_ok = @my_bookings
    @products = Product.where(user_id: current_user.id)
    @bookings_to_approve = current_user.bookings.where(status: "pending")
    @my_pending_bookings = @my_bookings.where(status: "pending")
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.user = current_user
    @booking.product = @product
    @booking.status = "pending"
    authorize @booking
    if @booking.start_date.nil? || @booking.end_date.nil? || @booking.start_date > @booking.end_date
      redirect_to product_path(@booking.product_id)
    else
      if @booking.save!
        redirect_to bookings_path
      else
        render :new
      end
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "validated"
    @booking.save
    redirect_to bookings_path
    authorize @booking
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.status = "denied"
    @booking.save
    redirect_to bookings_path
    authorize @booking
  end

  # def show
  #   @booking = Booking.find()
  # end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
