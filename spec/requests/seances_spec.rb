require "rails_helper"

RSpec.describe "Seances requests" do

  let(:hall) { Hall.create!(number: "1", capacity: 500) }
  let(:movie) { Movie.create!(title: 'Start Wars', age_limit: '18', duration: '200') }
  let(:seance) { Seance.create!(date: '20/10/2020 10:00', hall_id: hall.id, movie_id: movie.id) }

  describe "GET /seances" do
    it "returns status 200" do
      get("/seances")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /seances/:id" do
  before {seance}

    it "returns status 200" do
      get("/seances/#{seance.id}")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /seances" do
    it "returns status 201" do
      post("/seances", params: { seance: {  date: '20/10/2020 10:00', hall_id: hall.id, movie_id: movie.id } } )
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /seances/:id" do
    it "returns status 200" do
      put("/seances/#{seance.id}", params: { seance: { date: '20/11/2020 12:00', hall_id: hall.id, movie_id: movie.id } } )
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /seances/:id" do
    it "returns status 204" do
      delete("/seances/#{seance.id}")
      expect(response.status).to eq(204)
    end
  end
end