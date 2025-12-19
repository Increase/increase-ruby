# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class Exports
        # Some parameter documentations has been truncated, see
        # {Increase::Models::Simulations::ExportCreateParams} for more details.
        #
        # Many exports are created by you via POST /exports or in the Dashboard. Some
        # exports are created automatically by Increase. For example, tax documents are
        # published once a year. In sandbox, you can trigger the arrival of an export that
        # would normally only be created automatically via this simulation.
        #
        # @overload create(category:, form_1099_int: nil, request_options: {})
        #
        # @param category [Symbol, Increase::Models::Simulations::ExportCreateParams::Category] The type of Export to create.
        #
        # @param form_1099_int [Increase::Models::Simulations::ExportCreateParams::Form1099Int] Options for the created export. Required if `category` is equal to `form_1099_in
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
