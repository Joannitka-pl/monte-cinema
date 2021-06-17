# frozen_string_literal: true

before_action :authenticate_user!

class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservations::UseCases::FetchAll.new.call
    render json: Reservations::Representers::List.new(@reservations).basic
  end

  def show
    @reservation = Reservations::UseCases::Show.new.call(id: params[:id])
    render json: Reservations::Representers::Single.new(@reservation).extended
  end

  def create_online
    @reservation = Reservations::UseCases::CreateOnline.new.call(params: reservation_params)

    if @reservation.valid?
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def create_offline
    @reservation = Reservations::UseCases::CreateOffline.new.call(params: reservation_params)

    if @reservation.valid?
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    @reservation = Reservations::UseCases::Update.new.call(id: params[:id], params: reservation_params)

    if @reservation.valid?
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Reservations::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :client_id, :ticket_desk_id, :seance_id, :seat, :sort, :price)
  end
end
