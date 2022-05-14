class YelpFacade
  def self.find_businesses(category, location)
    YelpService.find_businesses(category, location)
  end
end
