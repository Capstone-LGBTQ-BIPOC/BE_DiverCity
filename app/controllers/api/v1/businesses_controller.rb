class Api::V1::BusinessesController < ApplicationController
  def index
    businesses = YelpFacade.find_businesses(params[:category], params[:location])
    binding.pry
  end
end
