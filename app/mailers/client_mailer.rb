class ClientMailer < ApplicationMailer

  def reservation_confirmation_email(reservation:)
    @reservation = reservation
    @email = params[:email]
    @name = params[:name]
    @url = 'https://www.monterail.com/'
    mail(
      to: @email, 
      subject: 'Your reservation to Monte Cinema is confirmed.')
  end
end
