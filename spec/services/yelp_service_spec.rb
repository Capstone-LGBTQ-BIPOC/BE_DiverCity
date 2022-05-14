require 'rails_helper'

RSpec.describe YelpService do
  it 'has a response', :vcr do
    response = YelpService.conn
    expect(response).to be_a(Faraday::Connection)
    #binding.pry
  end

  it 'gets a reponse with data in the right format', :vcr do
    response = YelpService.yelp_search("denver")
    expect(response).to be_a(Hash)
    #binding.pry
    expect(response.count).to eq(3)
    expect(response).to have_key(:businesses)
    expect(response).to have_key(:total)
    expect(response).to have_key(:region)

  end

  it 'gets a reponse with data with the keys needed', :vcr do
    response = YelpService.yelp_search("denver")

    expect(response[:businesses].count).to eq(20)
    expect(response[:businesses][0]).to have_key(:location)
    expect(response[:businesses][0]).to have_key(:categories)
    expect(response[:businesses][0]).to have_key(:phone)
    expect(response[:businesses][0]).to have_key(:name)
    expect(response[:businesses][0]).to have_key(:image_url)
    expect(response[:businesses][0]).to have_key(:url)
    expect(response[:businesses][0]).to have_key(:name)
  end

  it 'search by category does the voodoo it needs to', :vcr do
    response = YelpService.search_by_category("denver", "music")
    binding.pry
    expect(response[:businesses].count).to eq(20)
    expect(response[:businesses][0]).to have_key(:location)
    expect(response[:businesses][0]).to have_key(:categories)
    expect(response[:businesses][0]).to have_key(:phone)
    expect(response[:businesses][0]).to have_key(:name)
    expect(response[:businesses][0]).to have_key(:image_url)
    expect(response[:businesses][0]).to have_key(:url)
    expect(response[:businesses][0]).to have_key(:name)
  end
end
