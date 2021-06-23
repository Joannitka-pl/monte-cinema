# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservations::Repository do
  let(:instance) { Reservations::Repository.new }

  describe 'reservation repository' do

    let(:client) { create :client }
    let(:seance) { create :seance }
    let(:ticket_desk) { create :ticket_desk }
    let(:reservation_1) { create :reservation }
    let(:reservation_2) { create :reservation }
    let(:reservation_3) { create :reservation }

    it 'returns reservations' do
      expect(instance.find_all).to eq([reservation_1, reservation_2, reservation_3])
    end
  end
end
