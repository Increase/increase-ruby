# frozen_string_literal: true

module Increase
  module Resources
    class Checkbooks
      # Create a Checkbook
      #
      # @overload create(account_number_id:, mailing_address:, payer:, request_options: {})
      #
      # @param account_number_id [String]
      #   The identifier of the Account Number that the checks will draw from. The Account
      #   Number must be active.
      #
      # @param mailing_address [Increase::Models::CheckbookCreateParams::MailingAddress]
      #   The destination address that the Checkbook will be mailed to.
      #
      # @param payer [Array<Increase::Models::CheckbookCreateParams::Payer>]
      #   The payer of the checks. This will be printed on the top-left corner of each
      #   check. This should be an array of up to 4 elements, each of which represents a
      #   line of the payer.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Checkbook]
      #
      # @see Increase::Models::CheckbookCreateParams
      def create(params)
        parsed, options = Increase::CheckbookCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "checkbooks",
          body: parsed,
          model: Increase::Checkbook,
          options: options
        )
      end

      # Retrieve a Checkbook
      #
      # @overload retrieve(checkbook_id, request_options: {})
      #
      # @param checkbook_id [String] The identifier of the Checkbook.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Checkbook]
      #
      # @see Increase::Models::CheckbookRetrieveParams
      def retrieve(checkbook_id, params = {})
        @client.request(
          method: :get,
          path: ["checkbooks/%1$s", checkbook_id],
          model: Increase::Checkbook,
          options: params[:request_options]
        )
      end

      # List Checkbooks
      #
      # @overload list(account_number_id: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_number_id [String] Filter Checkbooks to those attached to the specified Account Number.
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String]
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param status [Increase::Models::CheckbookListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::Checkbook>]
      #
      # @see Increase::Models::CheckbookListParams
      def list(params = {})
        parsed, options = Increase::CheckbookListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "checkbooks",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::Checkbook,
          options: options
        )
      end

      # Stop a Checkbook. Stopping a Checkbook stops all of its checks that have not yet
      # been deposited.
      #
      # @overload stop(checkbook_id, request_options: {})
      #
      # @param checkbook_id [String] The identifier of the Checkbook to stop.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Checkbook]
      #
      # @see Increase::Models::CheckbookStopParams
      def stop(checkbook_id, params = {})
        @client.request(
          method: :post,
          path: ["checkbooks/%1$s/stop", checkbook_id],
          model: Increase::Checkbook,
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
