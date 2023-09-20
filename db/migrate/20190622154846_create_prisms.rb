class CreatePrisms < ActiveRecord::Migration[5.2]
  def change
    create_table :prisms do |t|
      t.integer :row_id
      t.integer :garden_id
      t.integer :col_num
      t.integer :row_num
      t.decimal :aws025wta
      t.integer :irrcapcl
      t.datetime :sow_time
      t.datetime :irr_time    
      t.integer :seedcount
      t.integer :planttype_id
      t.integer :column_order
      t.integer :row_order
      t.bigint :row_order, index: {unique: true}
      t.bigint :column_order, index: {unique: true}
      t.timestamps
    end
  end
end
