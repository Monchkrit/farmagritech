class ShippingAddress < ApplicationRecord
  belongs_to :order
	validates :street, :city, :state, :zip, :county, presence: true
end
