class Api::V1::RecommendationsController < ApplicationController
  def create
    UserRecommendation.create(user_id: params[:user_id],
                              business_yelp_id: params[:business_id],
                              recommendation: params[:recomendation])
    user = User.find_by(id: params[:user_id])

    RecMailer.rec_email(user)
    render status: :created
  end

  def index
    recs = UserRecommendation.where(business_yelp_id: params[:business_id])
    render json: UserRecommendationSerializer.new(recs)
  end
end
