# frozen_string_literal: true

class ClientsController < ApplicationController
  
  def index
    @clients = Clients::UseCases::FetchAll.new.call
    render json: Clients::Representers::List.new(@clients).basic
  end

  def show
    @client = Clients::UseCases::Show.new.call(id: params[:id])
    render json: Clients::Representers::Single.new(@client).basic
  end

  def create
    @client = Clients::UseCases::Create.new.call(params: client_params)

    if @client.valid?
      render json: @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def update
    @client = Clients::UseCases::Update.new.call(id: params[:id], params: client_params)

    if @client.valid?
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Clients::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  def client_params
    params.require(:client).permit(:name, :age, :email, :real_user)
  end
end
