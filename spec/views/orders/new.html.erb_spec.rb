require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :street => "MyString",
      :city => "MyString",
      :zipcode => "MyString",
      :state => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[street]"

      assert_select "input[name=?]", "order[city]"

      assert_select "input[name=?]", "order[zipcode]"

      assert_select "input[name=?]", "order[state]"
    end
  end
end
