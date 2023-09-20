class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :street
      t.string :city
      t.string :zipcode
      t.string :state
      t.integer :orders
      t.integer :buyer_id
      t.integer :farmer_id
      t.integer :listing_id
      t.boolean :verified
            
      t.timestamps
    end
  end
end
