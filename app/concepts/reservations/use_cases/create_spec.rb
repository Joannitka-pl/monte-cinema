require 'rails_helper'

RSpec.describe 'ReservationTimeout', :type => :job do

  let(:reservation) { Reservation.create!(status: "active", client_id: client.id, seance_id: seance.id, ticket_desk_id: ticket_desk.id) }
  let(:ticket_desk) { TicketDesk.create!(category: 'offline') }
  let(:client) { Client.create!(name: 'fake', age: 20, email: "fake", real_user: true) }
  let(:seance) { Seance.create!(date: "20/10/2020", time: '10:00', hall_id: hall.id, movie_id: movie.id) }
  let(:hall) { Hall.create!(number: "1", capacity: 500) }
  let(:movie) { Movie.create!(title: 'Start Wars', age_limit: '18', duration: '200') }


  describe '#perform_later' do
    it 'destroys offline reservation after 10 minutes unless paid' do
      ReservationTimeoutJob.new.perform(reservation.id)
      expect(Reservations::UseCases::Destroy).to have_received(:call)
    end
  end
end