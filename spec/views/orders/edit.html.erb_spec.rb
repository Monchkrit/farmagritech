require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :street => "MyString",
      :city => "MyString",
      :zipcode => "MyString",
      :state => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[street]"

      assert_select "input[name=?]", "order[city]"

      assert_select "input[name=?]", "order[zipcode]"

      assert_select "input[name=?]", "order[state]"
    end
  end
end
