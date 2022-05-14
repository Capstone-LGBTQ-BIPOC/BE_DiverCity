# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :user_name, :zipcode
end
