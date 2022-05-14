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

  
end
