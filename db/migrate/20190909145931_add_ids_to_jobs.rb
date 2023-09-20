class AddIdsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :gardener_id, :integer
    add_column :jobs, :farmer_id, :integer
    add_column :jobs, :verified, :boolean
    remove_column :jobs, :gardener
  end
end
