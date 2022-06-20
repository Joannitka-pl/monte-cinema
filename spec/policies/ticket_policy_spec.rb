# frozen_string_literal: true

require 'pundit/rspec'
require 'rails_helper'

describe TicketPolicy do
  subject { described_class.new(user, ticket) }

  let(:reservation) { create(:reservation) }
  let(:ticket) { create(:ticket, reservation_id: reservation.id) }

  context 'when user role is ticket_checker' do
    let(:user) { build(:user, role: 'ticket_checker') }

    it { is_expected.to permit_action(:validate_ticket) }
    it { is_expected.to forbid_action(:destroy) }
  end
end
