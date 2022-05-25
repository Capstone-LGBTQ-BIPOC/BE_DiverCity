class UserRecommendationSerializer
  include JSONAPI::Serializer
  attributes :recommendation
  attribute :user do |object|
    object.user.user_name
  end
end
