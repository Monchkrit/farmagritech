class AddTypeDescriptionToGardens < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :gardtype, :string
    add_column :gardens, :description, :string
    add_column :gardens, :title, :string
  end
end
