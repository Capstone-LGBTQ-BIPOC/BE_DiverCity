require 'rails_helper'

RSpec.describe YelpFacade do
  it 'has a response', :vcr do
    response = YelpFacade.location_search("denver")
    expect(response).to be_a(Array)
    expect(response.count).to eq(20)
    response.each do |business|
      expect(business).to be_a(List)
      expect(business.name).to be_a(String)
      expect(business.address).to be_a(String)
      expect(business.sub_category).to be_a(Array)
      expect(business.id).to be_a(String)
      expect(business.image).to be_a(String)
    end
  end

  it "checks poro attributes", :vcr do
    response = YelpFacade.location_search("denver")
    business_1 = response[0]
    binding.pry
    expect(business_1.name).to eq("Denver Biscuit Co.")
    expect(business_1.address).to eq("3237 E Colfax Ave")
    expect(business_1.image).to eq("https://s3-media1.fl.yelpcdn.com/bphoto/bxPN9shgJEtwvT3Hrf_pCg/o.jpg")
    expect(business_1.id).to eq("gagUrh3806qc5hZ14F0Odw")
    expect(business_1.sub_category).to eq([{:alias=>"sandwiches", :title=>"Sandwiches"}, {:alias=>"breakfast_brunch", :title=>"Breakfast & Brunch"}])
  end
end
