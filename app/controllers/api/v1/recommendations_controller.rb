class Api::V1::RecommendationsController < ApplicationController
  def create
  wip = UserRecommendation.create(user_id: params[:user_id],
                                  business_yelp_id: params[:business_id],
                                  recommendation: params[:recomendation])
    render status: 201
  end
end
