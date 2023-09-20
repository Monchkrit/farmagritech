class Phmuszipcode < ApplicationRecord

require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Phmuszipcode.create! row.to_hash
    end
  end
end
