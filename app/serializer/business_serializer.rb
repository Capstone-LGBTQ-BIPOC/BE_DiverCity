class BusinessSerializer
  include JSONAPI::Serializer
  attributes :name, :category, :location, :hours, :phone, :url, :coordinates, :image, :sub_category
end
