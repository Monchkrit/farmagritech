class CreateAccountings < ActiveRecord::Migration[5.2]
  def change
    create_table :accountings do |t|
      t.integer :garden
      t.string :job
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :farmer_id
      t.integer :gardener_id

      t.timestamps
    end
  end
end
