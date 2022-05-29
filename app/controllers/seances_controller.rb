# frozen_string_literal: true

class SeancesController < ApplicationController
  def index
    @seances = Seances::UseCases::FetchAll.new.call
    render json: Seances::Representers::List.new(@seances).basic
  end

  def show
    @seance = Seances::UseCases::Show.new.call(id: params[:id])
    @seats = Seances::UseCases::GetSeatsForSeance.new(seance: @seance).call
    render json: Seances::Representers::Single.new(@seance, seats: @seats).extended
  end

  def create
    @seance = Seances::UseCases::Create.new.call(params: seance_params)

    if @seance.valid?
      render json: @seance, status: :created
    else
      render json: @seance.errors, status: :unprocessable_entity
    end
  end

  def update
    @seance = Seances::UseCases::Update.new.call(id: params[:id], params: seance_params)

    if @seance.valid?
      render json: @seance
    else
      render json: @seance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Seances::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  def seance_params
    params.require(:seance).permit(:date, :time, :movie_id, :hall_id)
  end
end
