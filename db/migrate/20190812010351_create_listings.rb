class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.integer :product_type
      t.decimal :price
      t.datetime :market_date
      t.string :picture
      t.string :zipcode
      t.integer :user_id
      t.integer :weight
      t.string :product_type
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :telephone
      t.integer :maxorder
      t.boolean :verified
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :soilcube_id
      
      t.timestamps
    end
  end
end
