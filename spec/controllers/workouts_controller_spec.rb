require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  it "should have a current_user" do
    login_user
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET #index" do
    let!(:fav_workout) { FactoryGirl.create(:workout)}
    let!(:not_fav_workout) {FactoryGirl.create(:workout)}
    let!(:fav) { Favourite.create(workout:fav_workout, user:user)}
    before do
      login_user
      get :index
    end
    it "assigns @workouts to users favourite workouts" do
      expect(assigns(:workouts)).to eq([fav_workout])
    end
    it "does not assign @workouts when workout is not users favourite" do
      expect(assigns(:workouts)).to_not eq([not_fav_workout])
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

  describe "POST #create" do
    let(:exercise) { FactoryGirl.create(:exercise) }
    let(:workout_params) do
      { workout: {name:"hotwheels", interval:2, description:"awesome"},
        exercises_workouts: [{exercise_id:exercise[:id], instructions:"cool", time:30}]}
    end
    before do
      login_user
    end

    it "creates a new workout" do
      expect {
        post :create, workout_params
      }.to change(Workout, :count).by(1)
    end

    it "redirects to the created workout" do
      post :create, workout_params
      expect(response).to redirect_to(Workout.last)
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
