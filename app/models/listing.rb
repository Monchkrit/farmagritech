class Listing < ApplicationRecord
  scope :agritech, -> { where(product_type: 'FAT PC') }
  scope :tool, -> { where(product_type: 'Tool')}
  scope :supply, -> { where(product_type: 'Supply')}
  scope :vegetable, -> { where(product_type: 'Vegetable') }
  scope :herb, -> { where(product_type: 'Herb') }
  scope :fruit, -> { where(product_type: 'Fruit') }
  scope :flower, -> { where(product_type: 'Flowers') }
  scope :indoor_plant, -> { where(product_type: 'House Plant') }
  scope :outdoor_plant, -> { where(product_type: 'Outdoor Plant') }
  scope :tree, -> { where(product_type: 'Tree') }

  mount_uploader :picture, ImageUploader
  has_many :pictures
  has_many :orders
  before_validation :set_address
  geocoded_by :address
  after_validation :geocode
  # before_save :add_fee

  validates :name, :description, :product_type, :weight, :market_date, :price, :picture, :street, :city, :state, :zipcode, :telephone, :maxorder, presence: true

  def address
    [street, city, state, zipcode].join(', ')
  end

  def self.search(search)
    if search
      listing = Listing.find_by(city: search)
      if listing
        self.where(city: search)
      else
        Listing.all
      end
    else
      Listing.all
    end
  end

  def self.list_cube(cubeid)
    listcube = Soilcube.find_by(id: cubeid)
  end

  def price_in_btc
    exchange_rate = BtcExchangeRateService.new.fetch_rate
    puts "Exchange rate: #{exchange_rate}" # Debugging line
    (self.price / exchange_rate).round(8) * 100000000
  end

  def sup_in_btc
    exchange_rate = BtcExchangeRateService.new.fetch_rate
    puts "Exchange rate: #{exchange_rate}" # Debugging line
    (self.fatsupportcost1yr / exchange_rate).round(8) * 100000000
  end

  def month_sup_in_btc
    (sup_in_btc / 12).round(2)
  end

  private

  def add_fee
    self.price = self.price + (self.price * 0.069 + 0.30)
  end

  def set_address
    self.address = address
  end

end
