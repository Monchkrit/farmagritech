class CreateSoils < ActiveRecord::Migration[5.2]
  def change
    create_table :soils do |t|
      
      t.decimal :om_r
      t.integer :awc_r
      t.integer :wsatiated_r
      t.decimal :kwfact
      t.integer :ph1to1h2o_r
      t.string :compname
      t.integer :slope_r
      t.string :runoff
      t.integer :tfact
      t.string :elev_r
      t.string :geomdesc
      t.integer :ffd_r
      t.integer :nirrcapcl
      t.string :nirrcapscl
      t.integer :irrcapcl
      t.string :irrcapscl
      t.integer :mukey
      t.string :musym
      t.string :muname
      t.string :drainagecl
      t.decimal :aws025wta

      t.timestamps
    end
  end
end
