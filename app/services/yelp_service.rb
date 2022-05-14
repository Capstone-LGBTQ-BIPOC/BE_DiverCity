# frozen_string_literal: true

class YelpService
  class << self
    def yelp_search(location)
      response = conn.get("/v3/businesses/search?find_desc=lgbt+or+black+owned+businesses&location=#{location}") do |f|
        f.headers['Authorization'] = ENV['yelp_key']
      end
      parse_data(response)
    end

    def conn
      Faraday.new(url: 'https://api.yelp.com')
    end

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end

    def find_businesses(category, location)
      response = conn.get("/v3/businesses/search?find_desc=lgbt+or+black+owned+businesses&location=#{location}&category=#{category}") do |f|
        f.headers['Authorization'] = ENV['yelp_key']
      end
      wip = parse_data(response)
      binding.pry
    end
  end
end
