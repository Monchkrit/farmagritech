class Planttype < ApplicationRecord
  require 'csv'
  belongs_to :prism, optional: true
  delegate :method, to: :prism, prefix: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Planttype.create! row.to_hash
    end
  end
end
