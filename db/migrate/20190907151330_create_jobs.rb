class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :garden_id
      t.string :gardener
      t.integer :user_id
      t.datetime :start_time
      t.datetime :finish_time
      t.boolean :status

      t.timestamps
    end
  end
end
