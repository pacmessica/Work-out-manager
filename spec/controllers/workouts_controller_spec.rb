require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do

  describe "GET #index" do
    let(:workout) { FactoryGirl.create(:workout)}
    before do
      get :index
    end
    it "assigns @workouts" do
      expect(assigns(:workouts)).to eq([workout])
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:workout) { FactoryGirl.create(:workout)}
    before do
      get :show, id: workout.id
    end
    it "assigns the requested workout as @workout" do
      expect(assigns(:workout)).to eq(workout)
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
