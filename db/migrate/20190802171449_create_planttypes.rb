class CreatePlanttypes < ActiveRecord::Migration[5.2]
  def change
    create_table :planttypes do |t|
      t.string :botname
      t.string :comname
      t.string :variety
      t.string :growtype
      t.string :method
      t.string :wks_blf
      t.string :sowdepth
      t.string :space
      t.string :life
      t.string :light
      t.string :comt1
      t.string :comt2
      t.integer :garden_id
      t.integer :prism_id
      t.integer :row_id

      t.timestamps
    end
  end
end
