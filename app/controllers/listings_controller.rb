class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:farmer, :new, :edit, :create, :update]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def agritech
    @time = Time.zone.now
    @listings = Listing.agritech.search(params[:search]).order("market_date ASC")
  end

  def vegetables
    @time = Time.zone.now
    @listings = Listing.vegetable.search(params[:search]).order("market_date ASC")
  end

  def fruits
    @time = Time.zone.now
    @listings = Listing.fruit.search(params[:search]).order("market_date ASC")
  end

  def herbs
    @time = Time.zone.now
    @listings = Listing.herb.search(params[:search]).order("market_date ASC")
  end

  def flowers
    @time = Time.zone.now
    @listings = Listing.flower.search(params[:search]).order("market_date ASC")
  end

  def indoor_plants
    @time = Time.zone.now
    @listings = Listing.indoor_plant.search(params[:search]).order("market_date ASC")
  end

  def outdoor_plants
    @time = Time.zone.now
    @listings = Listing.outdoor_plant.search(params[:search]).order("market_date ASC")
  end

  def trees
    @time = Time.zone.now
    @listings = Listing.tree.search(params[:search]).order("market_date ASC")
  end

  def farmer
    @time = Time.zone.now
    @garden = Garden.where(:user_id => current_user)
    @listings = Listing.where(:user_id => current_user).order("market_date ASC")
  end

  # GET /listings
  # GET /listings.json
  def index
    @time = Time.zone.now
    @listings = Listing.search(params[:search]).order("market_date ASC")
    @fat = @listings.where(:product_type => 'FAT PC')
    @veg = @listings.where(:product_type => 'Vegetable')
    @flow = @listings.where(:product_type => 'Flowers')
    @fruit = @listings.where(:product_type => 'Fruit')
    @herb = @listings.where(:product_type => 'Herb')
    @houseplant = @listings.where(:product_type => 'House Plant')
    @outdoorplant = @listings.where(:product_type => 'Outdoor Plant')
    @tree = @listings.where(:product_type => 'Tree')
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find_by_id(params[:id])
    @fat = @listing.product_type
    @lister = User.find_by_id(@listing.user_id)
  end

  # GET /listings/new
  def new
    @admin = current_user.admin
    @gardner = gardener?
    @listing = Listing.new
    @cube = Soilcube.find_by_id(params[:cube])
  end

  # GET /listings/1/edit
  def edit
    @admin = current_user.admin
    @listings = Listing.all
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  helper_method :gardener?


  def gardener?
    @gardens = Garden.where(:user_id => current_user)
      if @gardens.empty?
        redirect_to (new_garden_path)
      else
        return true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:search, :name, :description, :product_type, :price, :market_date, :maxorder, :picture, :zipcode, :user_id, :street, :city, :state, :zipcode, :telephone, :weight, :cube, :latitude, :longtitude, :warranty_length, :fatsupportcost1yr, :fatsupportcost2yr, :fatsupportcost3yr, :cpu, :core_count, :ram, :memory_type, :hdgigs, :hdtype, :opticaldrive, :video, :videoint, :update_date)
    end

end
