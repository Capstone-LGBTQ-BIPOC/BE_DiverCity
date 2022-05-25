class YelpFacade
  class << self
    def location_search(location)
      business_list = YelpService.yelp_search(location)
      if (business_list[:error]).nil?
        poro_ize(business_list)
      elsif (business_list[:error]).count.positive?
        business_list
      end
    end

    def find_category(location, category)
      business_list = YelpService.search_black_owned(location, category)
      business_list2 = YelpService.search_lgbt_owned(location, category)
      if business_list[:error].nil? && business_list2[:error].nil?
        business_poro = poro_ize(business_list)
        business_poro2 = poro_ize(business_list2)
        business_poro2.zip(business_poro).flatten.compact.uniq(&:id)
      elsif business_list[:error].count.positive? || business_list1[:error].count.positive?
        if business_list[:error].count.positive?
          business_list
        elsif business_list2[:error].count.positive?
          business_list2
        end
      end
    end

    def find_business(id)
      business = YelpService.search_business(id)
      Business.new(business)
    end

    private

    def poro_ize(list)
      list[:businesses].map do |result|
        Business.new(result)
      end
    end
  end
end
