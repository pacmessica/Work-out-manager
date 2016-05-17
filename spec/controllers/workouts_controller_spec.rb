require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  it "should have a current_user" do
    login_user
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET #index" do
    let(:workout) { FactoryGirl.create(:workout)}
    before do
      login_user
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

  describe "GET /workouts/new" do
    before do
      login_user
      get :new
    end

    it "assigns @workout" do
      expect(assigns(:workout)).to be_a(Workout)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    let(:workout) { FactoryGirl.create(:workout)}
    before do
      login_user
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
