# frozen_string_literal: true

class SeatsController < ApplicationController
  def index
    @seats = Seats::UseCases::FetchAll.new.call
    render json: Seats::Representers::List.new(@seats).basic
  end

  def show
    @seats = Seats::UseCases::Show.new.call(id: params[:id])
    render json: Seats::Representers::Single.new(@seats).basic
  end

  def create
    @seat = Seats::UseCases::Create.new.call(params: seat_params)

    if @seat.valid?
      render json: @seat, status: :created
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  def update
    @seat = Seats::UseCases::Update.new.call(id: params[:id], params: seat_params)

    if @seat.valid?
      render json: @seat
    else
      render json: @seat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Seats::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  def seat_params
    params.require(:seat).permit(:row, :number, :availability, :hall_id)
  end
end
