class AddNamesToEnrollments < ActiveRecord::Migration[5.2]
  def change
    add_column :enrollments, :first_name, :string
    add_column :enrollments, :last_name, :string
  end
end
