FactoryBot.define do
  factory :shipping_address do
    street { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    county { "MyString" }
  end

  factory :product do
    name { "MyString" }
    picture { "MyString" }
    unitid { "MyString" }
    warranty_length { 1 }
    fatsupportcost1yr { "9.99" }
    fatsupportcost2yr { "9.99" }
    fatsupportcost3yr { "9.99" }
    price { "9.99" }
    product_type { "MyString" }
    cpu { "MyString" }
    core_count { 1 }
    ram { 1 }
    memory_type { "MyString" }
    hdgigs { 1 }
    hdtype { "MyString" }
    opticaldrive { "MyString" }
    video { "MyString" }
    videoint { "MyString" }
  end

  factory :accounting do
    garden { "" }
    job { "" }
    start_time { "" }
    finish_time { "" }
    farmer_id { "" }
    gardener_id { 1 }
  end

  factory :job do
    name { "MyString" }
    garden_id { 1 }
    user_id { 1 }
    start_time { "2019-09-07 08:13:30" }
    finish_time { "2019-09-07 08:13:30" }
    status { false }
  end

  factory :enrollment do

  end

  factory :prodtype do
    type { "" }
  end

  factory :producttype do
    Vegetable { "MyString" }
    Herb { "MyString" }
    Fruit { "MyString" }
    Flowers { "MyString" }
    Domestic_House_Plant { "MyString" }
  end

  factory :listing do
    name { "MyString" }
    description { "MyText" }
    product_type { 1 }
    price { "9.99" }
    market_date { "2023-08-11 18:10:02" }
    picture { "MyString" }
    zipcode { "MyString" }
    user_id { 1 }
    garden_id { 1 }
    planttype_id { 1 }
    weight { 1 }
  end

  factory :order do
    street { "MyString" }
    city { "MyString" }
    zipcode { "MyString" }
    state { "MyString" }
  end

  factory :listing do
    name { "MyString" }
    description { "MyString" }
    product_type { "MyString" }
    market_date { "2023-08-08 07:45:51" }
    price { "9.99" }
  end

  factory :soilcube do

  end

  factory :planttype do
    botname { "MyString" }
    comname { "MyString" }
    variety { "MyString" }
    growtype { "MyString" }
    method { "MyString" }
    wks_blf { "MyString" }
    sowdepth { "MyString" }
    space { "MyString" }
    life { "MyString" }
    light { "MyString" }
    comt1 { "MyString" }
    comt2 { "MyString" }
    garden_id { 1 }
    prism_id { 1 }
    row_id { 1 }
  end

  factory :soil do

  end

  factory :chorizon do

  end

  factory :component do

  end

  factory :phmuszipcode do
    zipcode { 1 }
    zone { "MyString" }
    trange { "MyString" }
    zonetitle { "MyString" }
  end

  factory :phm_us_zipcode do
    zipcode { 1 }
    zone { "MyString" }
    trange { "MyString" }
    zonetitle { "MyString" }
  end

  factory :prism do

  end


  factory :user do
    sequence :email do |n|
      "person#{n}@Example.com"
    end
    first_name { "John" }
    last_name { "Doe" }
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :garden do
    street { "nooneHome" }
    city { "Greenfield" }
    state { "CA" }
    zip { "93927" }
    length { "7" }
    width { "6" }
    association :user
  end
end
