class YelpFacade
  class << self

    def location_search(location)
      business_list = YelpService.yelp_search(location)
      bussiness_poro = poro_ize(business_list)
    end

    def find_category(location, category)
      business_list = YelpService.search_by_category(location, business_list)
      bussiness_poro = poro_ize(business_list)
    end

    private
    def poro_ize(list)
      list[:businesses].map do |result|
        List.new(id: result[:id], name: result[:name], sub_category: result[:categories][0][:title], image: result[:image_url], address: result[:location][:display_address][0])
      end
    end
  end
end
