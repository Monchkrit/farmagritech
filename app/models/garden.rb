class Garden < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :user
  has_one :photo
  has_many :rows, :dependent => :destroy
  has_many :prisms
  has_many :soilcubes
  has_many :planttypes, through: :prisms
  has_many :listings
  has_many :enrollments
  has_many :jobs
  has_one :soil
  
  geocoded_by :address
  after_validation :geocode
  after_commit :populate_garden!

  validates :street, :city, :state, :zipcode, :length, :width, presence: true
  validates :length, numericality: {less_than_or_equal_to: 8,
    message: "%{value} is not a valid number of beds" }
  validates :width, numericality: {less_than_or_equal_to: 30,
    message: "%{value} is not a valid bed length" }

  def irrigate(garden_id)
    cubes = Soilcube.where(:garden_id => garden_id)
    cubes.each do |c|
      c.irr_time = DateTime.now
      c.save!
    end
  end

  def self.get_cubes(garden_id)
    get_cubes = Soilcube.where(:garden_id => garden_id).order('row_id, prism_id ASC')
  end

  def self.get_prisms(garden_id)
    get_prisms = Prism.where(:garden_id => garden_id)
  end

  def self.get_rows(garden_id)
    get_rows = Row.where(:garden_id => garden_id)
  end

  def self.get_soil(musym)
    get_soil = Soil.distinct.where(:musym => musym)
  end

  def address
    [street, city, state, zipcode].join(', ')
  end

  def self.get_garden(user_id)
    get_garden = Garden.where(:user_id => user_id)
    garden = Garden.find_by_id(get_garden)
  end

  private

  def populate_garden!
    # row 0
    
    if self.rows.count == 0
      (0..length-1).each do |i|
        Row.create(row_num: i, garden_id: id)
      end
    else
      puts "Exceeded the number of rows"
    end
  end
end
