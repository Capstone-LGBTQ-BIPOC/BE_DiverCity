require 'rails_helper'

RSpec.describe "responds to a get index request", :vcr do

  it "gets todays and yesterdays horoscope and moon" do
    location = "Denver"
    category = "Sandwhich"
    keys = [:id, :type, :attributes]
    attr_keys = [:name, :sub_category, :address, :image]

    get "/api/v1/businesses?location=#{location}&category=#{category}"
    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(result[:data].count).to eq(20)
    result[:data].each do |object|
      expect(object.keys.count).to eq(3)
      expect(object.keys).to eq(keys)
      expect(object[:attributes].keys).to eq(attr_keys)
    end
  end
end
