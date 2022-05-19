class Api::V1::BusinessesController < ApplicationController
  def index
    businesses = YelpFacade.find_category(params[:location], params[:category])
    binding.pry
    render json: BusinessListSerializer.new(businesses)
  end
end
