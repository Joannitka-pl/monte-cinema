class ReservationTimeoutJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    Reservations::UseCases::Destroy.new.call(id: params[:id])
  end
end