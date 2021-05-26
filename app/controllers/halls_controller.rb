# frozen_string_literal: true

class HallsController < ApplicationController
  
  def index
    @halls = Halls::UseCases::FetchAll.new.call
    render json: Halls::Representers::List.new(@halls).basic
  end

  def show
    render json: Halls::Representers::Single.new(@hall).basic
  end

  def create
    @hall = Halls::UseCases::Create.new(params: hall_params).call
  end

  def update
    Halls::UseCases::Update.new(id: @hall[:id], params: hall_params).call
  end

  def destroy
    Halls::UseCases::Destroy.new(id: @hall[:id])
  end

  private

  def set_hall
    @hall = Halls::Repository.new.find_by(params[:id])
  end

  def hall_params
    params.require(:hall).permit[:number, :capacity]
  end
end
