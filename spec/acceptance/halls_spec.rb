require "rails_helper"
require 'rspec_api_documentation/dsl'

resource 'Halls' do
  get "/halls" do
    example_request 'Halls listing' do
      expect(status).to eq(200)
    end
  end

  get 'show hall by id' do
    parameter :hall_id, 'Hall id', required: true

    let(:hall_id) { 1 }

    example_request 'show hall by id' do
      expect(status).to eq 200
    end
  end
end