class CreatePhmuszipcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :phmuszipcodes do |t|
      t.string :zipcode
      t.string :zone
      t.string :trange
      t.string :zonetitle

      t.timestamps
    end
  end
end
