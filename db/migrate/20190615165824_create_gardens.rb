class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :length
      t.integer :width
      t.float :latitude
      t.float :longitude
      t.string :picture
      t.integer :user_id
      t.string :musym
      t.integer :column_order
      t.bigint :column_order, index: {unique: true}
      t.integer :row_order
      t.bigint :row_order, index: {unique: true}
      t.timestamps
    end
  end
end
