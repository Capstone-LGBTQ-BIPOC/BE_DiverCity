class List
  attr_reader :name,
              :address,
              :sub_category,
              :id,
              :image


  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @image = data[:image]
    @address = data[:address]
    @sub_category = data[:sub_category]
  end

end
