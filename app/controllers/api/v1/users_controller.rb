# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: UserSerializer.new(users)
      end
    end
  end
end
