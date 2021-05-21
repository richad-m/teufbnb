class ProductsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show ]

 def index
  @products = policy_scope(Product)
  flash[:notice]="Succesfully booked" if params[:booking]
  @products = Product.where(category: params[:q]) if params[:q]
  sql_query = "title ILIKE :query OR description ILIKE :query"
  @products = Product.where(sql_query, query: "%#{params[:query]}%") if params[:query].present?
  # @products = Product.where("title ILIKE ?", "%#{params[:query]}%") if params[:query].present?
  # raise
  @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { product: product })
      }
  end

 end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    authorize @product
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    authorize @product
    redirect_to products_path

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    authorize @product
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :city, :category, photos: [])
  end
end
