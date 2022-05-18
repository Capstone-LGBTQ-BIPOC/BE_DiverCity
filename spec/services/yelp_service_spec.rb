require 'rails_helper'

RSpec.describe YelpService do
  it 'has a response', :vcr do
    response = YelpService.conn
    expect(response).to be_a(Faraday::Connection)
  end

  it 'gets a reponse with data in the right format', :vcr do
    response = YelpService.yelp_search("denver")
    expect(response).to be_a(Hash)
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

  it 'search by category & lgbt, does the voodoo it needs to', :vcr do
    response = YelpService.search_lgbt_owned("denver", "music")
    expect(response[:businesses].count).to eq(8)
    expect(response[:businesses][0]).to have_key(:location)
    expect(response[:businesses][0]).to have_key(:categories)
    expect(response[:businesses][0]).to have_key(:phone)
    expect(response[:businesses][0]).to have_key(:name)
    expect(response[:businesses][0]).to have_key(:image_url)
    expect(response[:businesses][0]).to have_key(:url)
    expect(response[:businesses][0]).to have_key(:name)
  end

  it 'search by category & black owned, does the voodoo it needs to', :vcr do
    response = YelpService.search_black_owned("denver", "music")
    expect(response[:businesses].count).to eq(20)
    expect(response[:businesses][0]).to have_key(:location)
    expect(response[:businesses][0]).to have_key(:categories)
    expect(response[:businesses][0]).to have_key(:phone)
    expect(response[:businesses][0]).to have_key(:name)
    expect(response[:businesses][0]).to have_key(:image_url)
    expect(response[:businesses][0]).to have_key(:url)
    expect(response[:businesses][0]).to have_key(:name)
  end

  it "returns a single business", :vcr do
    id = "w-eA1Vac8szhi3LQ44Ub6A"
    response = YelpService.search_business(id)
    expect(response[:id]).to eq(id)
    expect(response[:categories]).to be_a(Array)
    expect(response[:image_url]).to eq("https://s3-media3.fl.yelpcdn.com/bphoto/ipBWWTBDzxcfuj_6YoO1ow/o.jpg")

    expect(response[:location]).to have_key(:address1)
    expect(response[:location]).to have_key(:address2)
    expect(response[:location]).to have_key(:city)
    expect(response[:location]).to have_key(:zip_code)
    expect(response).to have_key(:hours)
    expect(response[:phone]).to eq("+17203297154")
    expect(response[:url]).to eq("https://www.yelp.com/biz/milk-denver?adjust_creative=us0-GXhQzuMv9uLzOEXxpw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=us0-GXhQzuMv9uLzOEXxpw")
    expect(response[:price]).to eq("$")
    #binding.pry
  end
end
