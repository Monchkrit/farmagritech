class Soilcube < ApplicationRecord
  belongs_to :garden
  belongs_to :row
  belongs_to :prism
  before_save :plant_soilcubes!

  def time
    Time.new
  end

  def self.pickCubes(prism, n)
    pickCubes = Soilcube.where(:prism_id => prism).limit n
  end

private

  def plant_soilcubes!
    ptid = Planttype.where(:comname => self.crop_name)
    ptid.each do |pt|
      self.planttype_id = pt.id
    end
  end
end
