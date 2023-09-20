require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :name => "Name",
        :description => "Description",
        :product_type => "Product Type",
        :price => "9.99"
      ),
      Listing.create!(
        :name => "Name",
        :description => "Description",
        :product_type => "Product Type",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Product Type".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
