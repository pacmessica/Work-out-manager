require 'rails_helper'

RSpec.describe FavouritesController, type: :controller do
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  it "should have a current_user" do
    login_user
    expect(subject.current_user).to_not eq(nil)
  end

  describe "POST #create" do
    let(:favourite_params) do
      { favourite: {workout_id: 1} }
    end
    it "creates a new favourite" do
      expect {
        post :create, favourite_params
      }.to change(Favourite, :count).by(1)
    end
  end
end
