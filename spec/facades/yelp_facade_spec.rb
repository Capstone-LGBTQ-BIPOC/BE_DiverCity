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
    #binding.pry
    business_1 = response[0]
    expect(business_1.name).to eq("Milk")
    expect(business_1.address).to eq({:city=>"Denver", :street_address=>"1037 Broadway", :state=>"CO", :zipcode=>"80203"})
    expect(business_1.image).to eq("https://s3-media3.fl.yelpcdn.com/bphoto/ipBWWTBDzxcfuj_6YoO1ow/o.jpg")
    expect(business_1.id).to eq("w-eA1Vac8szhi3LQ44Ub6A")
    expect(business_1.sub_category).to eq(["Lounges", "Dance Clubs"])
  end
end
