require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :name => "MyString",
      :description => "MyString",
      :product_type => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[name]"

      assert_select "input[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[product_type]"

      assert_select "input[name=?]", "listing[price]"
    end
  end
end
