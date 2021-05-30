require 'rails_helper'

RSpec.describe 'Movies requests' do

  let!(:movie) { Movie.create(title: 'Start Wars', age_limit: '18', duration: '200') }

  describe 'GET /movies' do
    it 'returns status 200' do
      get('/movies')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /movies/:id' do
    it 'returns status 200' do
      get("/movies/#{movie.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /movies' do
    it 'returns status 201' do
      post("/movies", params: { movie: {  title: 'Start Wars', age_limit: '18', duration: '200' } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /movies/:id' do
    it 'returns status 200' do
      put("/movies/#{movie.id}", params: { movie: { id: movie.id, title: 'Matrix' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /movies/:id' do
    it 'returns status 204' do
      delete("/movies/#{movie.id}")
      expect(response.status).to eq(204)
    end
  end
end