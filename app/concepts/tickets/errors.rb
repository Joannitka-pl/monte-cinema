# frozen_string_literal: true

module Tickets
  module UseCases
    module Errors
      class TicketNotValid < StandardError; end
      class TicketAlreadyUsed < StandardError; end
      class QrCodeNotValid < StandardError; end
      class TicketDateExpired < StandardError; end
    end
  end
end