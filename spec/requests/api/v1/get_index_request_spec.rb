require 'rails_helper'

RSpec.describe "responds to a get index request" do
  describe "class methods" do
    it "searches restaurants", :vcr do
      location = "denver"
      category = "music"
      keys = [:id, :type, :attributes]
      attr_keys = [:name, :sub_category, :address, :image]

      get "/api/v1/businesses?location=#{location}&category=#{category}"
      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(result[:data].count).to eq(15)
      result[:data].each do |object|
        expect(object.keys.count).to eq(3)
        expect(object.keys).to eq(keys)
        expect(object[:attributes].keys).to eq(attr_keys)
      end
    end
  end

  describe 'error message' do
    it "will return an error if location cannot be found", :vcr do
      location = "apple"
      category = "music"
      keys = [:id, :type, :attributes]
      attr_keys = [:name, :sub_category, :address, :image]

      get "/api/v1/businesses?location=#{location}&category=#{category}"
      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(result[:error]).to be_a(Hash)
      expect(result[:error]).to have_key(:code)
      expect(result[:error][:code]).to eq("LOCATION_NOT_FOUND")
      expect(result[:error]).to have_key(:description)
      expect(result[:error][:description]).to eq("Could not execute search, try specifying a more exact location.")
    end
  end
end
