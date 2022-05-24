class Api::V1::RecommendationsController < ApplicationController
  def create
  wip = UserRecommendation.create(user_id: params[:user_id],
                                  business_yelp_id: params[:business_id],
                                  recommendation: params[:recomendation])
    user = User.find_by(id: params[:user_id])
    # binding.pry

    MailSenderJob.perform_async(user.email, user.user_name)
    render status: 201
  end

  def index
    recs =  UserRecommendation.where(business_yelp_id: params[:business_id])
    render json: UserRecommendationSerializer.new(recs)
  end
end
