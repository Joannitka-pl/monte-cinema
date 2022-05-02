# frozen_string_literal: true

class TicketPolicy
  attr_reader :user, :ticket

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def destroy?
    false unless user.admin?
  end

  def validate_ticket?
    true if user.usher?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.all if user.admin?

      scope.where(ticket.reservation.user_id == user.id)
    end
  end
end
