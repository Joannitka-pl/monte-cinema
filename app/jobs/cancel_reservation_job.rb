class CancelReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation_id)
    Reservations::UseCases::Destroy.new.call(id: reservation_id)
  end
end
