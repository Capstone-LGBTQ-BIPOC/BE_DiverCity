class Api::V1::BusinessController < ApplicationController
  def index
    business = YelpFacade.find_business(params[:id])
    render json: BusinessSerializer.new(business)
  end
end
