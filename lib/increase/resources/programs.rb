# frozen_string_literal: true

module Increase
  module Resources
    class Programs
      # Retrieve a Program
      #
      # @overload retrieve(program_id, request_options: {})
      #
      # @param program_id [String] The identifier of the Program to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Program]
      #
      # @see Increase::Models::ProgramRetrieveParams
      def retrieve(program_id, params = {})
        @client.request(
          method: :get,
          path: ["programs/%1$s", program_id],
          model: Increase::Program,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::ProgramListParams} for more details.
      #
      # List Programs
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Program>]
      #
      # @see Increase::Models::ProgramListParams
      def list(params = {})
        parsed, options = Increase::ProgramListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "programs",
          query: parsed,
          page: Increase::Internal::Page,
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
