require 'rails_helper'

RSpec.describe YelpService do
  it 'has a response', :vcr do
    response = YelpService.conn
    expect(response).to be_a(Faraday::Connection)
    #binding.pry
  end

  it 'gets a reponse with data I need', :vcr do
    time = Time.new(2022, 4, 25, 15, 5, 5)
    category = entertainment
    response = YelpService.yelp_search(category, time, "denver")
    expect(response).to be_a(Hash)
    expect(response.count).to eq(3)
    expect(response).to have_key(:businesses)
    expect(response).to have_key(:region)
    expect(response).to have_key(:total)
  end
end
