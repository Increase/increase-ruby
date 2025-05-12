# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      class Programs
        # Simulates a [Program](#programs) being created in your group. By default, your
        # group has one program called Commercial Banking. Note that when your group
        # operates more than one program, `program_id` is a required field when creating
        # accounts.
        #
        # @overload create(name:, reserve_account_id: nil, request_options: {})
        #
        # @param name [String] The name of the program being added.
        #
        # @param reserve_account_id [String] The identifier of the Account the Program should be added to is for.
        #
        # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Increase::Program]
        #
        # @see Increase::Models::Simulations::ProgramCreateParams
        def create(params)
          parsed, options = Increase::Simulations::ProgramCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "simulations/programs",
            body: parsed,
            model: Increase::Program,
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
