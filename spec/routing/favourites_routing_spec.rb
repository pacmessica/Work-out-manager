require 'rails_helper'

RSpec.describe FavouritesController, type: :routing do
  describe "POST /favourites" do
    it "routes to favourites#create" do
      route = "/favourites"
      expect(post route).to route_to("favourites#create")
    end
  end
end
