# frozen_string_literal: true

class HallsController < ApplicationController

  def index
    halls = Hall.all.map do |hall|
      hall_hash(hall)
    end
    render json: halls
  end

  def show
    hall = Hall.find(params[:number])
    @hall = hall_hash(hall)

    render json: @hall
  end

  def create
    @hall = Hall.create(hall_params)

      if @hall.save
        render json: @hall, status: :created
      else
        render json: @hall.errors, status: :unprocessable_entity
      end
  end

  def update
    if @hall.update(hall_params)
      render json: @hall
    else
      render json: @hall.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hall.destroy
    redirect_to root_url, notice: 'The hall has been deleted.'
  end

  private

  def hall_hash
    {
      number: hall.number,
      capacity: hall.capacity
    }
  end

  def hall_params
    params.require(:hall).permit[:number, :capacity]
  end
end
