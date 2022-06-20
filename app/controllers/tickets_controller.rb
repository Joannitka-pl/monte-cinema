# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize Ticket
    @tickets = policy_scope(Ticket)
    render json: Tickets::Representers::List.new(@tickets).basic
  end

  def show
    @ticket = Tickets::UseCases::Show.new.call(id: params[:id])
    authorize @ticket
    render json: Tickets::Representers::Single.new(@ticket).extended
  end

  def create
    @ticket = Tickets::UseCases::Create.new.call(params: permitted_attributes(Ticket))

    if @ticket.valid?
      render json: @ticket, status: :created
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def update
    @ticket = Tickets::UseCases::Update.new.call(id: params[:id], params: permitted_attributes(Ticket))

    if @ticket.valid?
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Tickets::UseCases::Destroy.new.call(id: params[:id])
  end

  def validate
    Tickets::UseCases::ValidateTicket.new(params: permitted_attributes(Ticket)).call
  end
end
