require 'rails_helper'

RSpec.describe YelpFacade do
  describe 'class methods' do
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
  end
  describe 'error messages' do
    it 'will return an error if location not found', :vcr do
      response = YelpFacade.location_search("apple")
      expect(response).to be_a(Hash)
      expect(response[:error]).to have_key(:code)
      expect(response[:error][:code]).to eq("LOCATION_NOT_FOUND")
      expect(response[:error]).to have_key(:description)
      expect(response[:error][:description]).to eq("Could not execute search, try specifying a more exact location.")
    end
  end
end
