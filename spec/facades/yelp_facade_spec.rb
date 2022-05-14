require 'rails_helper'

RSpec.describe Yelpfacade do
  it 'has a response', :vcr do
    response = YelpFacade.location_search("denver")
    binding.pry
    expect(response).to be_a(Array)
  end
end
