class BusinessListSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :sub_category
  attributes :name, :address, :image
end
