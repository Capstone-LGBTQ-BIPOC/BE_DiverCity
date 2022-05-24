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
    @id = data[:id]
    @name = data[:name]
    if data.key?(:hours)
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
    else
      @image = data[:image_url]
      @address = { city: data[:location][:city],
                   street_address: data[:location][:address1],
                   state: data[:location][:state],
                   zipcode: data[:location][:zip_code] }
      @sub_category = category_reducer(data[:categories])
      @hours_of_operation = nil
      @phone_number = data[:display_phone]
    end
    @coordinates = coordinate_format(data[:coordinates])
  end

  def category_reducer(categories)
    array = []
    categories.each do |title|
      array << title[:title]
    end
    array
  end

  def hours_formatter(hours)
    val = {}
    hours[0][:open].each do |day|
      case day[:day]
      when 0
        val['Monday'] = { open: day[:start], close: day[:end] }
      when 1
        val['Tuesday'] = { open: day[:start], close: day[:end] }
      when 2
        val['Wednesday'] = { open: day[:start], close: day[:end] }
      when 3
        val['Thursday'] = { open: day[:start], close: day[:end] }
      when 4
        val['Friday'] = { open: day[:start], close: day[:end] }
      when 5
        val['Saturday'] = { open: day[:start], close: day[:end] }
      else
        val['Sunday'] = { open: day[:start], close: day[:end] }
      end
    end
    val
  end

  def coordinate_format(hash)
    "#{hash[:latitude]}, #{hash[:longitude]}"
  end
end
