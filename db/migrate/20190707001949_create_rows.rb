class CreateRows < ActiveRecord::Migration[5.2]
  def change
    create_table :rows do |t|
      t.integer :garden_id
      t.integer :row_num

      t.timestamps
    end
  end
end
