require 'rails_helper'

RSpec.describe "porostuff" do
  it "returns a list of businesses with right att", :vcr do
    response = YelpFacade.find_category("denver", "music")
    business_1 = response[0]
    expect(business_1.name).to eq("Milk")
    expect(business_1.address).to eq({:city=>"Denver", :street_address=>"1037 Broadway", :state=>"CO", :zipcode=>"80203"})
    expect(business_1.image).to eq("https://s3-media3.fl.yelpcdn.com/bphoto/ipBWWTBDzxcfuj_6YoO1ow/o.jpg")
    expect(business_1.id).to eq("w-eA1Vac8szhi3LQ44Ub6A")
    expect(business_1.sub_category).to eq(["Lounges", "Dance Clubs"])
  end

  it 'can rerturn 1 business with the correct att', :vcr do
    id = "w-eA1Vac8szhi3LQ44Ub6A"
    response = YelpFacade.find_business(id)

    expect(response.name).to eq("Milk")
    expect(response.category).to eq("Lounges")
    expect(response.sub_category).to eq("Dance Clubs")
    expect(response.image).to eq("https://s3-media3.fl.yelpcdn.com/bphoto/ipBWWTBDzxcfuj_6YoO1ow/o.jpg")
    expect(response.location).to eq("1037 Broadway, Denver, CO 80203")
    expect(response.hours).to eq({"Tuesday"=>{:open=>"2100", :close=>"0200"},
    "Wednesday"=>{:open=>"2100", :close=>"0200"},
    "Thursday"=>{:open=>"2100", :close=>"0200"},
    "Friday"=>{:open=>"2100", :close=>"0200"},
    "Saturday"=>{:open=>"2100", :close=>"0200"}})
    expect(response.phone_number).to eq("(720) 329-7154")
    expect(response.coordinates).to eq("39.7328, -104.98765")
  end

end
