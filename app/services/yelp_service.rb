class YelpService
  class << self
    def yelp_search(location)
      response = conn.get("/v3/businesses/search?find_desc=lgbt+or+black+owned+businesses&location=#{location}") do |f|
        f.headers['Authorization'] = ENV['yelp_key']
      end
      parse_data(response)
    end

    def search_lgbt_owned(location, category)
      response = conn.get("/v3/businesses/search?location=#{location}&category=#{category}&term=lgbtq+owned") do |f|
        f.headers['Authorization'] = ENV['yelp_key']
      end
      parse_data(response)
    end

    def search_black_owned(location, category)
      response = conn.get("/v3/businesses/search?location=#{location}&term=black+owned,#{category}") do |f|
        f.headers['Authorization'] = ENV['yelp_key']
      end
      parse_data(response)
    end


    def conn
      Faraday.new(url: "https://api.yelp.com")
    end

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end

  end
end
