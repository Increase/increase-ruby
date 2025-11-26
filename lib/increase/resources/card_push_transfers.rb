# frozen_string_literal: true

module Increase
  module Resources
    class CardPushTransfers
      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardPushTransferCreateParams} for more details.
      #
      # Create a Card Push Transfer
      #
      # @overload create(business_application_identifier:, card_token_id:, merchant_category_code:, merchant_city_name:, merchant_name:, merchant_name_prefix:, merchant_postal_code:, merchant_state:, presentment_amount:, recipient_name:, sender_address_city:, sender_address_line1:, sender_address_postal_code:, sender_address_state:, sender_name:, source_account_number_id:, require_approval: nil, request_options: {})
      #
      # @param business_application_identifier [Symbol, Increase::Models::CardPushTransferCreateParams::BusinessApplicationIdentifier] The Business Application Identifier describes the type of transaction being perf
      #
      # @param card_token_id [String] The Increase identifier for the Card Token that represents the card number you'r
      #
      # @param merchant_category_code [String] The merchant category code (MCC) of the merchant (generally your business) sendi
      #
      # @param merchant_city_name [String] The city name of the merchant (generally your business) sending the transfer.
      #
      # @param merchant_name [String] The merchant name shows up as the statement descriptor for the transfer. This is
      #
      # @param merchant_name_prefix [String] For certain Business Application Identifiers, the statement descriptor is `merch
      #
      # @param merchant_postal_code [String] The postal code of the merchant (generally your business) sending the transfer.
      #
      # @param merchant_state [String] The state of the merchant (generally your business) sending the transfer.
      #
      # @param presentment_amount [Increase::Models::CardPushTransferCreateParams::PresentmentAmount] The amount to transfer. The receiving bank will convert this to the cardholder's
      #
      # @param recipient_name [String] The name of the funds recipient.
      #
      # @param sender_address_city [String] The city of the sender.
      #
      # @param sender_address_line1 [String] The address line 1 of the sender.
      #
      # @param sender_address_postal_code [String] The postal code of the sender.
      #
      # @param sender_address_state [String] The state of the sender.
      #
      # @param sender_name [String] The name of the funds originator.
      #
      # @param source_account_number_id [String] The identifier of the Account Number from which to send the transfer.
      #
      # @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardPushTransfer]
      #
      # @see Increase::Models::CardPushTransferCreateParams
      def create(params)
        parsed, options = Increase::CardPushTransferCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "card_push_transfers",
          body: parsed,
          model: Increase::CardPushTransfer,
          options: options
        )
      end

      # Retrieve a Card Push Transfer
      #
      # @overload retrieve(card_push_transfer_id, request_options: {})
      #
      # @param card_push_transfer_id [String] The identifier of the Card Push Transfer.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardPushTransfer]
      #
      # @see Increase::Models::CardPushTransferRetrieveParams
      def retrieve(card_push_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["card_push_transfers/%1$s", card_push_transfer_id],
          model: Increase::CardPushTransfer,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardPushTransferListParams} for more details.
      #
      # List Card Push Transfers
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Card Push Transfers to ones belonging to the specified Account.
      #
      # @param created_at [Increase::Models::CardPushTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::CardPushTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::CardPushTransfer>]
      #
      # @see Increase::Models::CardPushTransferListParams
      def list(params = {})
        parsed, options = Increase::CardPushTransferListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "card_push_transfers",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::CardPushTransfer,
          options: options
        )
      end

      # Approves a Card Push Transfer in a pending_approval state.
      #
      # @overload approve(card_push_transfer_id, request_options: {})
      #
      # @param card_push_transfer_id [String] The identifier of the Card Push Transfer to approve.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardPushTransfer]
      #
      # @see Increase::Models::CardPushTransferApproveParams
      def approve(card_push_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["card_push_transfers/%1$s/approve", card_push_transfer_id],
          model: Increase::CardPushTransfer,
          options: params[:request_options]
        )
      end

      # Cancels a Card Push Transfer in a pending_approval state.
      #
      # @overload cancel(card_push_transfer_id, request_options: {})
      #
      # @param card_push_transfer_id [String] The identifier of the pending Card Push Transfer to cancel.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardPushTransfer]
      #
      # @see Increase::Models::CardPushTransferCancelParams
      def cancel(card_push_transfer_id, params = {})
        @client.request(
          method: :post,
          path: ["card_push_transfers/%1$s/cancel", card_push_transfer_id],
          model: Increase::CardPushTransfer,
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
