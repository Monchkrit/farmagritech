require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :street => "Street",
        :city => "City",
        :zipcode => "Zipcode",
        :state => "State"
      ),
      Order.create!(
        :street => "Street",
        :city => "City",
        :zipcode => "Zipcode",
        :state => "State"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
