# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seances::Repository do
  let(:instance) { Seances::Repository.new }

  describe 'reservation repository' do

    let(:date) { create :date }
    let(:movie) { create :movie }
    let(:hall) { create :hall }
    let(:seance_1) { create :seance }
    let(:seance_2) { create :seance }
    let(:seance_3) { create :seance }

    it 'returns seances' do
      expect(instance.find_all).to eq([seance_1, seance_2, seance_3])
    end
  end
end
