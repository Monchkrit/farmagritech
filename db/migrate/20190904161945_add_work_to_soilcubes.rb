class AddWorkToSoilcubes < ActiveRecord::Migration[5.2]
  def change
    add_column :soilcubes, :cult_date, :datetime
    add_column :soilcubes, :feed_date, :datetime
    add_column :soilcubes, :feed_type, :string
    add_column :soilcubes, :weed_date, :datetime
    add_column :soilcubes, :harvest_date, :datetime
    add_column :soilcubes, :harvest_type, :string
  end
end
