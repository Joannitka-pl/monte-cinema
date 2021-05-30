require "rails_helper"

RSpec.describe "Seats requests" do

  let!(:seat) { Seat.create(row: "A", number: 10, availability: "true", hall_id: hall.id) }
  let!(:hall) { Hall.create(number: "1", capacity: 500) }

  describe "GET /seats" do
    it "returns status 200" do
      get("/seats")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /seats/:id" do
    it "returns status 200" do
      get("/seats/#{seat.id}")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /seats" do
    it "returns status 201" do
      post("/seats", params: { seat: {  row: "A", number: 10, availability: "true", hall_id: hall.id } } )
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /seats/:id" do
    it "returns status 200" do
      put("/seats/#{seat.id}", params: { seat: { row: "A", number: 10, availability: "true", hall_id: hall.id } })
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /seats/:id" do
    it "returns status 204" do
      delete("/seats/#{seat.id}")
      expect(response.status).to eq(204)
    end
  end
end