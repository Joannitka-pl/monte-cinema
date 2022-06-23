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

  def permitted_attributes_for_update
    %i[id qr_code]
  end

  def permitted_attributes_for_validate
    [:qr_code]
  end

  def index?
    true
  end

  def create?
    true unless user.role_ticket_checker?
  end

  def update?
    true unless user.role_ticket_checker? || user.role_user?
  end

  def destroy?
    true if user.role_admin?
  end

  def validate_ticket?
    true if user.role_ticket_checker?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.all if user.role_admin? || user.role_ticket_checker?

      scope.joins(:reservation).where(user.id == 'reservation.user_id')
    end
  end
end
