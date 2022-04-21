# frozen_string_literal: true

class ClientMailer < ApplicationMailer
  def reservation_confirmation_email(reservation:, params:)
    @reservation = reservation
    @client = Client.find(params[:client_id])
    @email = @client.email
    @name = @client.name
    @url = 'https://www.monterail.com/'
    mail(
      to: @email,
      subject: 'Your reservation to Monte Cinema is confirmed.'
    )
  end
end
