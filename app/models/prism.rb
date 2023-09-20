class Prism < ApplicationRecord

  include RankedModel
  ranks :column_order
  belongs_to :row
  belongs_to :garden
  has_many :planttypes
  has_many :soilcubes, :dependent => :destroy
  after_save :populate_soilcubes!

  def populate_soilcubes!
    (0..3).each do |cube|
        Soilcube.create(:garden_id => self.garden_id, :row_id => self.row_id, :row_num => self.row_num, :col_num => self.col_num, :prism_id => self.id)
    end
  end
end