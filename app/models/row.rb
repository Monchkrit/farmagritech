class Row < ApplicationRecord
  belongs_to :garden
  has_many :prisms, :dependent => :destroy
  has_many :soilcubes
  accepts_nested_attributes_for :soilcubes
  after_save :populate_prisms!

  def irrtime(row_id)
    irrtime = Time.zone.now
    irrtime = Soilcube.where(:row_id => row_id).last.irr_time
  end

  def irrigate(row_id)
    cubes = Soilcube.where(:row_id => row_id)
    cubes.each do |cube|
      cube.irr_time = DateTime.now
      cube.save!
    end
  end

  def cultdate(row_id)
    culttime = Time.zone.now
    culttime = Soilcube.where(:row_id => row_id).last.cult_date
  end

  def cultivate(row_id)
    cubes = Soilcube.where(:row_id => row_id)
    cubes.each do |cube|
      cube.cult_date = DateTime.now
      cube.save!
    end
  end

  def feeddate(row_id)
    feeddate = Time.zone.now
    feeddate = Soilcube.where(:row_id => row_id).last.feed_date
  end

  def feed(row_id)
    cubes = Soilcube.where(:row_id => row_id)
    cubes.each do |cube|
      cube.feed_date = DateTime.now
      cube.save!
    end
  end

  def weeddate(row_id)
    weeddate = Time.zone.now
    weeddate = Soilcube.where(:row_id => row_id).last.weed_date
  end

  def weed(row_id)
    cubes = Soilcube.where(:row_id => row_id)
    cubes.each do |cube|
      cube.weed_date = DateTime.now
      cube.save!
    end
  end

  def harvestdate(row_id)
    harvest = Time.now
    harvest = Soilcube.where(:row_id => row_id).last.harvest_date
  end

  def harvest(row_id)
    cubes = Soilcube.where(:row_id => row_id)
    cubes.each do |cube|
      cube.harvest_date = DateTime.now
      cube.save!
    end
  end


  private

  def populate_prisms!
    # row 0
    (0..garden.width-1).each do |i|
        Prism.create(:row_id => self.id, :row_num => self.row_num, :col_num => i, :garden_id => self.garden_id)
    end
  end
end
