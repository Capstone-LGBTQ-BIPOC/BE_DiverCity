require 'rails_helper'

RSpec.describe YelpService do
  it 'has a response', :vcr do
    response = YelpService.conn
    expect(response).to be_a(Faraday::Connection)
    #binding.pry
  end

  it 'gets a reponse with data I need', :vcr do
    response = YelpService.yelp_search("denver")
    expect(response).to be_a(Hash)
    #binding.pry
    expect(response.count).to eq(3)
    expect(response).to have_key(:businesses)
    expect(response).to have_key(:total)
    expect(response).to have_key(:region)
    expect(response[:businesses]).to have_key(:location)
    expect(response[:businesses]).to have_key(:total)
    expect(response[:businesses]).to have_key(:phone)
    expect(response[:businesses]).to have_key(:name)
    expect(response[:businesses]).to have_key(:image_url)
    expect(response[:businesses]).to have_key(:url)
    expect(response[:businesses]).to have_key(:name)
  end
end
