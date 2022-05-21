class Business
  attr_reader :id,
              :name,
              :category,
              :image,
              :address,
              :location,
              :hours,
              :coordinates,
              :url,
              :sub_category,
              :hours_of_operation,
              :phone_number,
              :description

  def initialize(data)
    #binding.pry
    if data.key?(:hours)
      @id = data[:id]
      @name = data[:name]
      if category_reducer(data[:categories]).count > 1
        @category = category_reducer(data[:categories])[0]
        @sub_category = category_reducer(data[:categories])[1]
      else
        @category = category_reducer(data[:categories]).flatten
      end
      @image = data[:image_url]
      @location = data[:location][:display_address].join(', ')
      @hours = hours_formatter(data[:hours])
      @phone_number = data[:display_phone]
      @url = data[:url]
      @coordinates = coordinate_format(data[:coordinates])
    else
      @id = data[:id]
      @name = data[:name]
      @image = data[:image_url]
      @address = { city: data[:location][:city],
                   street_address: data[:location][:address1],
                   state: data[:location][:state],
                   zipcode: data[:location][:zip_code] }
      @sub_category = category_reducer(data[:categories])
      @hours_of_operation = nil
      @phone_number = data[:display_phone]
      @description = nil
    end
  end

  def category_reducer(categories)
    array = []
    categories.each do |title|
      array << title[:title]
    end
    array
  end

  def hours_formatter(hours)
    array = []
    val = Hash.new
    hours[0][:open].each do |day|
      if day[:day] == 0
        val["Monday"] = {open: day[:start]}, {close: day[:end]}
      elsif day[:day] == 1
        val["Tuesday"] = {open: day[:start], close: day[:end]}
      elsif day[:day] == 2
        val["Wednesday"]= {open: day[:start], close: day[:end]}
      elsif day[:day] == 3
        val["Thursday"] = {open: day[:start], close: day[:end]}
      elsif day[:day] == 4
        val["Friday"] = {open: day[:start], close: day[:end]}
      elsif day[:day] == 5
        val["Saturday"] = {open: day[:start], close: day[:end]}
      else day[:day] == 6
        val["Sunday"] = {open:  day[:start], close: day[:end]}
      end
    end
    array << val
  end

  def coordinate_format(hash)
    #binding.pry
    hash
  end

end
