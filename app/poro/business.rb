class Business
  attr_reader :id,
              :name,
              :image,
              :address,
              :sub_category,
              :hours_of_operation,
              :phone_number,
              :description



  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @image = data[:image_url]
    @address = {city: data[:location][:city],
                street_address: data[:location][:address1],
                state: data[:location][:state],
                zipcode: data[:location][:zip_code]
              }
    @sub_category = data[:categories]
    @hours_of_operation = nil
    @phone_number = data[:display_phone]
    @description = nil
  end
  # Name
  # Sub Category
  # Image
  # Location
  # Hours of operation
  # Description?
  # Phone number
end
