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
end
