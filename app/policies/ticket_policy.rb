# frozen_string_literal: true

class TicketPolicy
  attr_reader :user, :ticket

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def permitted_attributes_for_create
    %i[sort price reservation_id seat]
  end

  def permitted_attributes_for_show
    [:id]
  end

  def permitted_attributes_for_update
    %i[id qr_code]
  end

  def destroy?
    false unless user.admin?
  end

  def validate_ticket?
    true if user.ticket_checker?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.all if user.admin? || user.ticket_checker?

      scope.where(ticket.reservation.user_id == user.id)
    end
  end
end
