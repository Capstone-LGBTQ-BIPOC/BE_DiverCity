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
    expect(business_1.name).to eq("Denver Sweet")
    expect(business_1.address).to eq({:city=>"Denver", :street_address=>"776 Lincoln St", :state=>"CO", :zipcode=>"80203"})
    expect(business_1.image).to eq("https://s3-media2.fl.yelpcdn.com/bphoto/XiVNKdYZlepDO007CKzfBg/o.jpg")
    expect(business_1.id).to eq("aLTZUOZi4a9m3v6-wH9H7A")
    expect(business_1.sub_category).to eq(["Gay Bars", "Cocktail Bars"])
  end
end
