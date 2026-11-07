# frozen_string_literal: true

module Increase
  module Resources
    class CheckbookChecks
      # Retrieve a Checkbook Check
      #
      # @overload retrieve(checkbook_check_id, request_options: {})
      #
      # @param checkbook_check_id [String] The identifier of the Checkbook Check.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckbookCheck]
      #
      # @see Increase::Models::CheckbookCheckRetrieveParams
      def retrieve(checkbook_check_id, params = {})
        @client.request(
          method: :get,
          path: ["checkbook_checks/%1$s", checkbook_check_id],
          model: Increase::CheckbookCheck,
          options: params[:request_options]
        )
      end

      # List Checkbook Checks
      #
      # @overload list(account_number_id: nil, check_number: nil, checkbook_id: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param account_number_id [String] Filter Checkbook Checks to those drawn on the specified Account Number.
      #
      # @param check_number [Integer] Filter Checkbook Checks to the one with the specified check number.
      #
      # @param checkbook_id [String] Filter Checkbook Checks to those belonging to the specified Checkbook.
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::CheckbookCheck>]
      #
      # @see Increase::Models::CheckbookCheckListParams
      def list(params = {})
        parsed, options = Increase::CheckbookCheckListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "checkbook_checks",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::CheckbookCheck,
          options: options
        )
      end

      # Stop a Checkbook Check. A stopped check cannot be deposited.
      #
      # @overload stop(checkbook_check_id, request_options: {})
      #
      # @param checkbook_check_id [String] The identifier of the Checkbook Check to stop.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CheckbookCheck]
      #
      # @see Increase::Models::CheckbookCheckStopParams
      def stop(checkbook_check_id, params = {})
        @client.request(
          method: :post,
          path: ["checkbook_checks/%1$s/stop", checkbook_check_id],
          model: Increase::CheckbookCheck,
          options: params[:request_options]
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
