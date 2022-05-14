require 'rails_helper'

RSpec.describe 'business requests' do
  it 'returns and index of all matching businesses in a location', :vcr do
    get '/api/v1/businesses?category=Shopping,all&location=80202'
    binding.pry
  end
end
