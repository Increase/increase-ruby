# frozen_string_literal: true

module Increase
  module Resources
    class AccountNumbers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::AccountNumberCreateParams} for more details.
      #
      # Create an Account Number
      #
      # @overload create(account_id:, name:, inbound_ach: nil, inbound_checks: nil, request_options: {})
      #
      # @param account_id [String] The Account the Account Number should belong to.
      #
      # @param name [String] The name you choose for the Account Number.
      #
      # @param inbound_ach [Increase::Models::AccountNumberCreateParams::InboundACH] Options related to how this Account Number should handle inbound ACH transfers.
      #
      # @param inbound_checks [Increase::Models::AccountNumberCreateParams::InboundChecks] Options related to how this Account Number should handle inbound check withdrawa
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountNumber]
      #
      # @see Increase::Models::AccountNumberCreateParams
      def create(params)
        parsed, options = Increase::AccountNumberCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "account_numbers",
          body: parsed,
          model: Increase::AccountNumber,
          options: options
        )
      end

      # Retrieve an Account Number
      #
      # @overload retrieve(account_number_id, request_options: {})
      #
      # @param account_number_id [String] The identifier of the Account Number to retrieve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountNumber]
      #
      # @see Increase::Models::AccountNumberRetrieveParams
      def retrieve(account_number_id, params = {})
        @client.request(
          method: :get,
          path: ["account_numbers/%1$s", account_number_id],
          model: Increase::AccountNumber,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::AccountNumberUpdateParams} for more details.
      #
      # Update an Account Number
      #
      # @overload update(account_number_id, inbound_ach: nil, inbound_checks: nil, name: nil, status: nil, request_options: {})
      #
      # @param account_number_id [String] The identifier of the Account Number.
      #
      # @param inbound_ach [Increase::Models::AccountNumberUpdateParams::InboundACH] Options related to how this Account Number handles inbound ACH transfers.
      #
      # @param inbound_checks [Increase::Models::AccountNumberUpdateParams::InboundChecks] Options related to how this Account Number should handle inbound check withdrawa
      #
      # @param name [String] The name you choose for the Account Number.
      #
      # @param status [Symbol, Increase::Models::AccountNumberUpdateParams::Status] This indicates if transfers can be made to the Account Number.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::AccountNumber]
      #
      # @see Increase::Models::AccountNumberUpdateParams
      def update(account_number_id, params = {})
        parsed, options = Increase::AccountNumberUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["account_numbers/%1$s", account_number_id],
          body: parsed,
          model: Increase::AccountNumber,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::AccountNumberListParams} for more details.
      #
      # List Account Numbers
      #
      # @overload list(account_id: nil, ach_debit_status: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Account Numbers to those belonging to the specified Account.
      #
      # @param ach_debit_status [Increase::Models::AccountNumberListParams::ACHDebitStatus]
      #
      # @param created_at [Increase::Models::AccountNumberListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::AccountNumberListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::AccountNumber>]
      #
      # @see Increase::Models::AccountNumberListParams
      def list(params = {})
        parsed, options = Increase::AccountNumberListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "account_numbers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::AccountNumber,
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
