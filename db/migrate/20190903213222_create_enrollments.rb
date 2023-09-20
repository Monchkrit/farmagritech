class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :garden_id
      t.timestamps
    end
    add_index :enrollments, [:user_id, :garden_id]
    add_index :enrollments, :garden_id
  end
end
