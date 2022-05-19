class Merchant

  attr_reader :id, :name, :category, :sub_category, :image, :location, :hours, :phone, :url, :coordinates

  def initialize(data)
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
    @phone = data[:display_phone]
    @url = data[:url]
    @coordinates = coordinate_format(data[:coordinates])

  end

  def category_reducer(categories)
    array = []
    categories.each do |title|
      array << title[:title]
    end
    return array
  end

  def hours_formatter(hours)
    schedule= []
    hours[0][:open].each do |day|
      if day[:day] == 0
        index_array = ["Monday", {:open => day[:start]}, {:close => day[:end]}, day[:day]]
      elsif day[:day] == 1
        index_array = ["Tuesday", {:open => day[:start], :close =>day[:end]}, day[:day]]
      elsif day[:day] == 2
        index_array = ["Wednesday", {:open => day[:start], :close =>day[:end]}, day[:day]]
      elsif day[:day] == 3
        index_array = ["Thursday", {:open => day[:start], :close =>day[:end]}, day[:day]]
      elsif day[:day] == 4
        index_array = ["Friday", {:open => day[:start], :close =>day[:end]}, day[:day]]
      elsif day[:day] == 5
        index_array = ["Saturday", {:open => day[:start], :close =>day[:end]}, day[:day]]
      else day[:day] == 6
        index_array = ["Sunday", {:open => day[:start], :close =>day[:end]}, day[:day]]
      end
      schedule << index_array
    end
    schedule
  end

  def coordinate_format(hash)
    #binding.pry
    hash
  end
end
