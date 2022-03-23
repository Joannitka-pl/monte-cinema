# frozen_string_literal: true

module QrCodes
  module UseCases
    class GenerateKey
      def call
        SecureRandom.base64(12)
      end
    end
  end
end
