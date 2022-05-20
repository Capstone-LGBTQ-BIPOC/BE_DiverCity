class Api::V1::BusinessesController < ApplicationController
  def index
    businesses = YelpFacade.find_category(params[:location], params[:category])

    render json: BusinessListSerializer.new(businesses)
  end
end
