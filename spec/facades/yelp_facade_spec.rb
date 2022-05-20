require 'rails_helper'

RSpec.describe YelpFacade do
  it 'has a response', :vcr do
    response = YelpFacade.location_search("denver")
    expect(response).to be_a(Array)
    expect(response.count).to eq(20)
    response.each do |business|
      expect(business).to be_a(Business)
      expect(business.name).to be_a(String)
      expect(business.address).to be_a(Hash)
      expect(business.sub_category).to be_a(Array)
      expect(business.id).to be_a(String)
      expect(business.image).to be_a(String)
    end
  end

  it "checks poro attributes", :vcr do
    response = YelpFacade.find_category("denver", "music")
    business_1 = response[0]
    expect(business_1.name).to eq("Milk")
    expect(business_1.address).to eq({:city=>"Denver", :street_address=>"1037 Broadway", :state=>"CO", :zipcode=>"80203"})
    expect(business_1.image).to eq("https://s3-media3.fl.yelpcdn.com/bphoto/ipBWWTBDzxcfuj_6YoO1ow/o.jpg")
    expect(business_1.id).to eq("w-eA1Vac8szhi3LQ44Ub6A")
    expect(business_1.sub_category).to eq(["Lounges", "Dance Clubs"])
  end

  it "checks the merchant poro", :vcr do
    id = "w-eA1Vac8szhi3LQ44Ub6A"
    response = YelpFacade.find_business(id)
    expect(response.name).to eq("Milk")
    expect(response.category).to eq("Lounges")
    expect(response.sub_category).to eq("Dance Clubs")
    expect(response.image).to eq("https://s3-media3.fl.yelpcdn.com/bphoto/ipBWWTBDzxcfuj_6YoO1ow/o.jpg")
    expect(response.location).to eq("1037 Broadway, Denver, CO 80203")
    expect(response.hours).to eq([["Tuesday", {:open=>"2100", :close=>"0200"}, 1],
   ["Wednesday", {:open=>"2100", :close=>"0200"}, 2],
   ["Thursday", {:open=>"2100", :close=>"0200"}, 3],
   ["Friday", {:open=>"2100", :close=>"0200"}, 4],
   ["Saturday", {:open=>"2100", :close=>"0200"}, 5]])
    expect(response.phone).to eq("(720) 329-7154")
    expect(response.url).to eq("https://www.yelp.com/biz/milk-denver?adjust_creative=us0-GXhQzuMv9uLzOEXxpw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=us0-GXhQzuMv9uLzOEXxpw")
  end
end
