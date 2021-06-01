require 'rails_helper'
require 'spec_helper'

RSpec.describe 'ReservationTimeout', :type => :job do
  describe '#perform_later' do
    it 'destroys offline reservation after 10 minutes unless paid' do
      ReservationTimeoutJob.new.perform(id: reservation_id)
      expect(Reservations::UseCases::Destroy).to have_received(:call)
    end
  end
end