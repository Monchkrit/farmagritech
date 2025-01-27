class AddCountyToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :county, :string
  end
end
