class AddAgritechToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :unitid, :string
    add_column :listings, :warranty_length, :integer
    add_column :listings, :fatsupportcost1yr, :decimal
    add_column :listings, :fatsupportcost2yr, :decimal
    add_column :listings, :fatsupportcost3yr, :decimal
    add_column :listings, :cpu, :string
    add_column :listings, :core_count, :integer
    add_column :listings, :ram, :integer
    add_column :listings, :memory_type, :string
    add_column :listings, :hdgigs, :integer
    add_column :listings, :hdtype, :string
    add_column :listings, :opticaldrive, :string
    add_column :listings, :video, :string
    add_column :listings, :videoint, :string
  end
end
