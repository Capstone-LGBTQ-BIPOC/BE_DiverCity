class YelpFacade
  class << self
    def location_search(location)
      business_list = YelpService.yelp_search(location)

      poro_ize(business_list)
    end

    def find_category(location, category)
      business_list = YelpService.search_black_owned(location, category)
      business_list2 = YelpService.search_lgbt_owned(location, category)
      business_poro = poro_ize(business_list)
      business_poro2 = poro_ize(business_list2)
      business_poro2.zip(business_poro).flatten.compact
    end

    def find_business(id)
      business = YelpService.search_business(id)
      business_poro = Business.new(business)

    end

    private

    def poro_ize(list)
      list[:businesses].map do |result|
        Business.new(result)
      end
    end
  end
end
