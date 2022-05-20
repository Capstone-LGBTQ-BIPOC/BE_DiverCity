require 'rails_helper'

RSpec.describe "recommendations" do
  describe 'post recomendations' do
    it 'creates recomdendations' do
    user = User.create!(user_name: "some u2ser")
    data = { "user_id": "#{user.id}","business_id": "asdf3qd", "recomendation": "great product"}
   headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json'}

    post '/api/v1/recommendations', headers: headers, params: JSON.generate(data)
    expect(response.status).to eq(201)
    end
  end

  describe 'get recomendations' do
    it 'can get a recomendation' do
      user = User.create!(user_name: "some u2ser")
      rec = UserRecommendation.create(user_id: user.id,
                                      business_yelp_id: "asdf1234",
                                      recommendation: "FOOD GOOD")
      user_2 = User.create!(user_name: "some other user")
      rec = UserRecommendation.create(user_id: user_2.id,
        business_yelp_id: "asdf1234",
        recommendation: "FOOD GOOD")
      get "/api/v1/recommendations?business_id=asdf1234"
      result = JSON.parse(response.body, symbolize_names: true)

    end
  end
end
