class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.references :order, null: true, foreign_key: true

      t.timestamps
    end
  end
end
