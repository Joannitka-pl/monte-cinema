# frozen_string_literal: true

class HallsController < ApplicationController
  
  def index
    @halls = Halls::UseCases::FetchAll.new.call
    render json: Halls::Representers::List.new(@halls).basic
  end

  def show
    @hall = Halls::UseCases::Show.new.call(id: params[:id])
    render json: Halls::Representers::Single.new(@hall).basic
  end

  def create
    @hall = Halls::UseCases::Create.new.call(params: hall_params)

    if @hall.valid?
      render json: @hall, status: :created
    else
      render json: @hall.errors, status: :unprocessable_entity
    end
  end

  def update
    @hall = Halls::UseCases::Update.new.call(id: params[:id], params: hall_params)

    if @hall.valid?
      render json: @hall
    else
      render json: @hall.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Halls::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  def hall_params
    params.require(:hall).permit(:number, :capacity)
  end
end
