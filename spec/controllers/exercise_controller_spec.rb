require 'rails_helper'

RSpec.describe ExerciseController, type: :controller do
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe "GET #index" do
    let(:exercise) { FactoryGirl.create(:exercise)}
    before do
      login_user
      get :index
    end
    it "assigns @exercises" do
      expect(assigns(:exercises)).to eq([exercise])
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:exercise) { FactoryGirl.create(:exercise)}
    before do
      login_user
      get :show, id: exercise.id
    end
    it "assigns the requested exercise as @exercise" do
      expect(assigns(:exercise)).to eq(exercise)
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
