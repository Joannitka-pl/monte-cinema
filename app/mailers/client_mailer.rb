class ClientMailer < ApplicationMailer

  def reservation_confirmation_email
    @client = params[:client]
    @url = 'https://www.monterail.com/'
    mail(to: 'joanna.wroblewska@monterail.com', subject: 'Reservation to Monte Cinema is confirmed.')
  end
end
