class Order < ApplicationRecord
  belongs_to :listing, optional: true
  belongs_to :buyer, class_name: "User"
  belongs_to :farmer, class_name: "User"
  has_one :shipping_address
  accepts_nested_attributes_for :shipping_address
  after_create :send_order_confirmation

  class ShippingAddress < ApplicationRecord
    belongs_to :order
  end

  private

  def send_order_confirmation
    OrderMailer.order_confirmation(self).deliver_now
  end

end
