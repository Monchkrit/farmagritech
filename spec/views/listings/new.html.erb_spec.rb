require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :name => "MyString",
      :description => "MyString",
      :product_type => "MyString",
      :price => "9.99"
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[name]"

      assert_select "input[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[product_type]"

      assert_select "input[name=?]", "listing[price]"
    end
  end
end
