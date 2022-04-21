# frozen_string_literal: true

module Clients
  module Representers
    class Single
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def basic
        {
          id: client.id,
          name: client.name,
          age: client.age,
          email: client.email,
          real_user: client.real_user
        }
      end
    end
  end
end
