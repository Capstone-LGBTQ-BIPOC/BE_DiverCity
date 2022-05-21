class BusinessSerializer
  include JSONAPI::Serializer
  attributes :name, :category, :location, :hours, :phone_number, :url, :coordinates, :image, :sub_category
end
