# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClientMailer, type: :mailer do
  describe 'reservation_confirmation_email' do
    let!(:client) { create :client }
    let!(:reservation) { create(:reservation) }
    let!(:mail) { ClientMailer.reservation_confirmation_email(reservation: reservation, email: client.email) }

    it 'renders the header' do
      expect(mail.subject).to eq('Your reservation to Monte Cinema is confirmed.')
      expect(mail.to).to eq(['fakeemail@mail.com'])
      expect(mail.from).to eq(['info@example.com'])
    end

    it 'renders the body' do
      expect(mail.text_part.body.to_s).to include(
        "Your reservation: #{reservation.id} for #{movie.title} has been succesfull."
      )
      expect(mail.html_part.body.to_s).to include(
        "Your reservation: #{reservation.id} for #{movie.title} has been succesfull."
      )
    end

    it 'sends the email' do
      assert_emails 1 do
        mail.deliver_now
      end
      expect(ActionMailer::Base.deliveries.first.subject).to eq('Reservation done')
    end
  end
end