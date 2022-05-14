# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_name) }
    it { should validate_uniqueness_of(:user_name) }
  end
end
