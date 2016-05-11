require 'rails_helper'

RSpec.describe WorkoutsController, type: :routing do
  describe "GET /workouts" do
    it "routes to workouts#index" do
      expect(get "/workouts").to route_to("workouts#index")
    end
  end

  describe "GET /workouts/:workout_id" do
    let(:workout) { FactoryGirl.create(:workout)}
    it "routes to workouts#show" do
      route = "/workouts/#{workout.to_param}"
      expect(get route).to route_to("workouts#show", id: workout.to_param)
    end
  end
end
