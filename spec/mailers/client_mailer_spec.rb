# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClientMailer, type: :mailer do
  describe 'reservation_confirmation_email' do
    let!(:client) { create :client }
    let!(:reservation) { create(:reservation) }
    let(:params) { { email: client.email, name: client.name } }
    let!(:mail) { ClientMailer.reservation_confirmation_email(reservation: reservation, params: params) }

    it 'renders the header' do
      expect(mail.subject).to eq('Your reservation to Monte Cinema is confirmed.')
      expect(mail.to).to eq([client.email])
      expect(mail.from).to eq(['info@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.to_s).to include(
        'Your reservation was succesfull and your tickets are waiting for you to be picked up at the cinema.'
      )
      expect(mail.body.to_s).to include(
        'Your reservation was succesfull and your tickets are waiting for you to be picked up at the cinema.'
      )
    end

    it 'sends the email' do
      assert_emails 1 do
        mail.deliver_now
      end
      expect(ActionMailer::Base.deliveries.first.subject).to eq('Your reservation to Monte Cinema is confirmed.')
    end
  end
end
