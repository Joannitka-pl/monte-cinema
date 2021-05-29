module Clients
  module Representers
    class List
      attr_reader :clients

      def initialize(clients)
        @clients = clients
      end

      def basic
        clients.map do |client|
          Single.new(client).basic
        end
      end
    end
  end
end
