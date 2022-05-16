class YelpFacade
  class << self

    def location_search(location)
      business_list = YelpService.yelp_search(location)
      bussiness_poro = poro_ize(business_list)
    end

    def find_category(location, category)
      business_list = YelpService.search_by_category(location, category)
      bussiness_poro = poro_ize(business_list)
    end

    private
    def poro_ize(list)
      list[:businesses].map do |result|
        Business.new(result)
      end
    end
  end
end
