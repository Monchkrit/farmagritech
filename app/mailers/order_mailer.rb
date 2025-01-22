class OrderMailer < ApplicationMailer
  default from: 'fatorder@farm-agritech.com'

  def order_confirmation(order)
    @order = order
    @url = 'https://www.farm-agritech.com/sales'
    mail(to: 'dbuckman@farm-agritech.com', subject: 'Order Confirmation')
  end
end
