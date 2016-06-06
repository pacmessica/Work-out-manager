require 'rails_helper'

RSpec.describe FavouritesController, type: :routing do
  describe "POST /favourites" do
    it "routes to favourites#create" do
      route = "/favourites"
      expect(post route).to route_to("favourites#create")
    end
  end

  describe "GET /favourites" do
    it "routes to favourites#index" do
      route = "/favourites"
      expect(get route).to route_to("favourites#index")
    end
  end
end
