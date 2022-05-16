class BusinessListSerializer
  include JSONAPI::Serializer
  attributes :name, :sub_category, :address, :image 
end
