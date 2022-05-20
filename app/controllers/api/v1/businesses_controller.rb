class Api::V1::BusinessesController < ApplicationController
  def index
    businesses = YelpFacade.find_category(params[:location], params[:category])
    binding.pry
    render json: BusinessListSerializer.new(businesses)
  end

  def show
    businesses = YelpFacade.find_business(params[:id])
    render json: BusinessSerializer.new(businesses)
  end
end
