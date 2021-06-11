class CancelReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation_id)
    reservation = Reservations::UseCases::Show.new.call(reservation_id)
    Reservations::UseCases::Destroy.new.call(reservation.id) unless reservation.status == "paid"
  end
end
