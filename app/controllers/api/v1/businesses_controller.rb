class Api::V1::BusinessesController < ApplicationController
  def index
    businesses = YelpFacade.find_category(params[:location], params[:category])
    if businesses.instance_of?(Array)
      render json: BusinessListSerializer.new(businesses)
    elsif businesses.instance_of?(Hash)
      render json: ErrorSerializer.api_format(businesses), status: 404
    end
  end

  def show
    businesses = YelpFacade.find_business(params[:id])
    render json: BusinessSerializer.new(businesses)
  end
end
