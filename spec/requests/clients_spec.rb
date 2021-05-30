require "rails_helper"

RSpec.describe "Clients requests" do

  describe "GET /clients" do
  let!(:client) { Client.create(name: "Jan Kowalski", age: 20, email: "example@example.com", real_user: false) }

    it "returns status 200" do
      get("/clients")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /clients/:id" do
  let!(:client) { Client.create(name: "Jan Kowalski", age: 20, email: "example@example.com", real_user: false) }

    it "returns status 200" do
      get("/clients/#{client.id}")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /clients" do
    it "returns status 201" do
      post("/clients", params: { client: {  name: "Jan Kowalski", age: 20, email: "example@example.com", real_user: false } } )
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /clients/:id" do
  let!(:client) { Client.create(name: "Jan Kowalski", age: 20, email: "jan@example.com", real_user: false) }

    it "returns status 200" do
      put("/clients/#{client.id}", params: { client: { name: "Anna Nowak", age: 12, email: "anna@example.com", real_user: false } })
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /clients/:id" do
  let!(:client) { Client.create(name: "Jan Kowalski", age: 20, email: "example@example.com", real_user: false) }

    it "returns status 204" do
      delete("/clients/#{client.id}")
      expect(response.status).to eq(204)
    end
  end
end