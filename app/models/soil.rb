class Soil < ApplicationRecord
  belongs_to :garden, optional: true

  require 'csv'

  CAP = {
    "Few Limitations" => 1,
    "Moderation Limitations" => 2,
    "Severe Limitations" => 3,
    "Very Severe Limitations" => 4,
    "Impractical to Remove Limitations" => 5,
    "Unsuitable for Cultivation" => 7,
    "Precluded and Restricted" => 8
  }

  SUBCAP = {
    'Erosion Limited': 'e',
    'Wetness Limited': 'w',
    'Shallow, Doughy or Stony Limited': 's',
    'Climate Limited': 'c'
  }

  def nicap_humanized_rating
    CAP.invert[self.nirrcapcl]
  end

  def nisubcap_humanized_rating
    SUBCAP.invert[self.nirrcapscl]
  end

  def icap_humanized_rating
    CAP.invert[self.irrcapcl]
  end

  def isubcap_humanized_rating
    SUBCAP.invert[self.irrcapscl]
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Soil.create! row.to_hash
    end
  end
end
