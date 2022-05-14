class YelpFacade
  class << self

    def location_search(location)
      business_list = YelpService.yelp_search(location)
      bussiness_poro = poro_ize(business_list)
    end

    private
    def poro_ize(list)
      list[:businesses].map do |result|
        List.new(id: result[:id], name: result[:name], sub_category: result[:categories], image: result[:image_url], address: result[:location][:display_address][0])
      end
    end
  end
end
