require 'rails_helper'

RSpec.describe "Movies", type: :request do

  describe "GET #index" do
    let!(:movie1) { create(:movie, name: "The Shawshank Redemption", release_date: "1994-09-23") }
    let!(:movie2) { create(:movie, name: "The Godfather", release_date: "1972-03-24") }
    let!(:movie3) { create(:movie, name: "The Dark Knight", release_date: "2008-07-18") }

    context "when no parameters are provided" do
      before { get :index }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    context "when search parameter is provided" do
      before { get :index, params: { search: "The" } }
      it "assigns @movies to movies with a name that contains the search term" do
        expect(assigns(:movies)).to eq([movie1, movie2])
      end
    end

    context "when start_date and end_date parameters are provided" do
      before { get :index, params: { start_date: "2008-01-01", end_date: "2010-12-31" } }
      it "assigns @movies to movies released between the start and end date" do
        expect(assigns(:movies)).to eq([movie3])
      end
    end
  end
end
