# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class Documents
        # Simulates an tax document being created for an account.
        #
        # @overload create(account_id:, request_options: {})
        #
        # @param account_id [String] The identifier of the Account the tax document is for.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Document]
        #
        # @see Increase::Models::Simulations::DocumentCreateParams
        def create(params)
          parsed, options = Increase::Simulations::DocumentCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/documents",
            body: parsed,
            model: Increase::Document,
            options: options
          )
        end

        # @api private
        #
        # @param client [Increase::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
