class CreateUserRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_recommendations do |t|
      t.references :user, foreign_key: true
      t.string :business_yelp_id
      t.string :recommendation
      t.timestamps
    end
  end
end
