class CreateSoilcubes < ActiveRecord::Migration[5.2]
  def change
    create_table :soilcubes do |t|
      t.integer :garden_id
      t.integer :row_id
      t.integer :prism_id
      t.integer :col_num
      t.integer :row_num
      t.string :crop_name
      t.decimal :aws025wta
      t.integer :irrcapcl
      t.datetime :sow_time
      t.datetime :irr_time
      t.integer :seedcount
      t.integer :planttype_id

      t.timestamps
    end
  end
end
