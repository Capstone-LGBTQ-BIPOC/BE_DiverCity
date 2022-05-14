require 'rails_helper'

RSpec.describe User do
  describe "user requests" do
    it 'returns all users' do
      get '/api/v1/users'
      binding.pry
    end
  end
end
