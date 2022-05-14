require 'rails_helper'

RSpec.describe "Gets Yesterday, Today, Tomorrow, Horoscopes", :vcr do

  it "gets todays and yesterdays horoscope and moon" do
    zodiac_name = "Leo"
    keys = [:current_date, :description, :compatibility, :mood, :color, :lucky_number, :lucky_time, :moon, :moon_phase]

    get "/api/v1/horoscopes/find?sign=#{zodiac_name}"
    horoscope_result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(horoscope_result[:data].count).to eq(3)
    expect(horoscope_result[:data][:attributes].keys.count).to eq(2)
    expect(horoscope_result[:data][:attributes][:today_horoscope].keys).to eq(keys)
    expect(horoscope_result[:data][:attributes][:yesterday_horoscope].keys).to eq(keys)

  end
end
