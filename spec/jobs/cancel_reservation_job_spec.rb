require 'rails_helper'
require 'spec_helper'

RSpec.describe 'CancelReservation', type: :job do
  describe '#perform_later' do
    let(:destroy_use_case) { instance_double(Reservations::UseCases::Destroy, call: true) }

    it 'enqueues reservation timeout process' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        CancelReservationJob.perform_later('reservation')
      end.to have_enqueued_job
    end

    it 'calls destroy usecase' do
      expect(Reservations::UseCases::Destroy).to receive(:new).and_return(destroy_use_case)
      expect(destroy_use_case).to receive(:call).with(id: 'reservation')

      CancelReservationJob.perform_now('reservation')
    end

    context 'when cancel reservation job is executed' do
      let!(:reservation) { create :reservation }

      it 'deletes record' do
        expect { CancelReservationJob.perform_now(reservation.id) }.to change(Reservation, :count).by(-1)
      end
    end
  end
end
