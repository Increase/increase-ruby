# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class Exports
        # Simulates a tax form export being generated.
        #
        # @overload create(account_id:, request_options: {})
        #
        # @param account_id [String] The identifier of the Account the tax document is for.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Models::Export]
        #
        # @see Increase::Models::Simulations::ExportCreateParams
        def create(params)
          parsed, options = Increase::Simulations::ExportCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/exports",
            body: parsed,
            model: Increase::Export,
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
