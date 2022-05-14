# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'user requests' do
    it 'returns all users' do
      user = User.create!(user_name: 'Rich_L', zipcode: '80014', city: 'Denver', state: 'CO',
                          street_address: '123 somestreet')
      get '/api/v1/users'
      users = JSON.parse(response.body, symbolize_names: true)
      expect(users).to be_a Hash
      expect(users).to have_key(:data)
      expect(users[:data]).to be_a Array
      users[:data].each do |user|
        expect(user).to be_a Hash
        expect(user).to have_key(:id)
        expect(user).to have_key(:type)
        expect(user).to have_key(:attributes)
        expect(user[:attributes]).to have_key(:user_name)
        expect(user[:attributes]).to have_key(:zipcode)
      end
    end
  end
end
