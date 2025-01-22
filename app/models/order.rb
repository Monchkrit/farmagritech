class Order < ApplicationRecord
  belongs_to :listing, optional: true
  belongs_to :buyer, class_name: "User"
  belongs_to :farmer, class_name: "User"
  after_create :send_order_confirmation

  private

  def send_order_confirmation
    OrderMailer.order_confirmation(self).deliver_now
  end

end
