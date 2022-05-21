require 'rails_helper'

RSpec.describe "responds to a get show request" do

  it "searches restaurants", :vcr do
    id = "w-eA1Vac8szhi3LQ44Ub6A"
    keys = [:id, :type, :attributes]
    attr_keys = [:name, :category, :location, :hours, :phone_number, :url, :coordinates, :image, :sub_category]

    get "/api/v1/businesses/#{id}"
    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(result[:data].count).to eq(3)
    expect(result[:data][:attributes].count).to eq(9)
    expect(result[:data].keys).to eq(keys)
    expect(result[:data][:attributes].keys).to eq(attr_keys)
  end
end
