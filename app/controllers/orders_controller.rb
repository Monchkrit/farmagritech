class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # Handle the pages for users to see what they bought and farmers to see what they sold.

  def charge
    @session_id = flash[:session_id]
  end

  def sales
    @time = Time.zone.now
    @orders = Order.all.where(:farmer_id => current_user.id).order("created_at DESC")
    puts "Order details: #{@orders.count}" # This will printto the server console
  end

  def purchases
    @time = Time.zone.now
    @orders = Order.where(:buyer => current_user).order("created_at DESC")
    puts "Order details: #{@orders.count}" # This will printto the server console
  end

  def show
    @listing = Listing.find_by_id(@order.listing_id)
    @listprice = (@listing.price * 100).to_i

    # Stripe.api_key = 'sk_test_dNYsGhVfYYmw1N1DmxNLeZdC00x6Ef4Eay'

    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: @listing.name,
    #     description: @listing.description,
    #     amount: @listprice,
    #     currency: 'usd',
    #     quantity: 1,
    #   }],
    #   success_url: 'https://www.plantformsoftware.com/purchases',
    #   cancel_url:  'https://www.plantformsoftware.com/cancel',
    # )

    # flash[:session_id] = session.id
  end

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find_by_id(params[:listing_id])
    @session_id = flash[:session_id]
    @farmer = User.find_by_id(@listing.user_id)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @listing = Listing.find_by_id(params[:listing_id])
    @farmer = @listing.user_id

    @order.listing_id = @listing.id
    @order.buyer_id = current_user.id
    @order.farmer_id = @farmer

    if @listing.maxorder > 0
    Listing.decrement_counter(:maxorder, @listing)
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to controller: 'orders', action: 'show', id: @order }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @order.update_columns(verified: true)
        format.html { redirect_to sales_path, notice: 'Order was successfully updated.' }
        format.json { head :no_content }

        # format.html {render action: 'edit' }
        # format.json { render json: @order.errors, status: :unprocessable_entity }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def dec_maxorders
      @order.decrement_maxorder
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:street, :city, :zipcode, :state, :listing_id, :verified)
    end
end
