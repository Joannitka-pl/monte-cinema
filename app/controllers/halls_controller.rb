# frozen_string_literal: true

class HallsController < ApplicationController
  
  before_action :set_hall, only: %i[show update destroy]

  def index
    @halls = Hall::UseCases::FetchAll.new.call
    render json: Hall::Representers::List.new(@halls).basic
  end

  def show
    render json: Hall::Representers::Single.new(@hall).basic
  end

  def create
    @hall = Hall::UseCases::Create.new(params: hall_params).call
  end

  def update
    Hall::UseCases::Update.new(id: @hall[:id], params: hall_params).call
  end

  def destroy
    Hall::UseCases::Destroy.new(id: @hall[:id])
  end

  private

  def set_hall
    @hall = Hall::Repository.new.find_by(params[:id])
  end

  def hall_params
    params.require(:hall).permit[:number, :capacity]
  end
end
