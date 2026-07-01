# frozen_string_literal: true

module Increase
  module Resources
    class InboundACHTransfers
      # Retrieve an Inbound ACH Transfer
      #
      # @overload retrieve(inbound_ach_transfer_id, request_options: {})
      #
      # @param inbound_ach_transfer_id [String] The identifier of the Inbound ACH Transfer to get details for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundACHTransfer]
      #
      # @see Increase::Models::InboundACHTransferRetrieveParams
      def retrieve(inbound_ach_transfer_id, params = {})
        @client.request(
          method: :get,
          path: ["inbound_ach_transfers/%1$s", inbound_ach_transfer_id],
          model: Increase::InboundACHTransfer,
          options: params[:request_options]
        )
      end

      # List Inbound ACH Transfers
      #
      # @overload list(account_id: nil, account_number_id: nil, created_at: nil, cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Inbound ACH Transfers to ones belonging to the specified Account.
      #
      # @param account_number_id [String]
      #   Filter Inbound ACH Transfers to ones belonging to the specified Account Number.
      #
      # @param created_at [Increase::Models::InboundACHTransferListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      # @param status [Increase::Models::InboundACHTransferListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::InboundACHTransfer>]
      #
      # @see Increase::Models::InboundACHTransferListParams
      def list(params = {})
        parsed, options = Increase::InboundACHTransferListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "inbound_ach_transfers",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::InboundACHTransfer,
          options: options
        )
      end

      # Create a notification of change for an Inbound ACH Transfer
      #
      # @overload create_notification_of_change(inbound_ach_transfer_id, updated_account_number: nil, updated_routing_number: nil, request_options: {})
      #
      # @param inbound_ach_transfer_id [String]
      #   The identifier of the Inbound ACH Transfer for which to create a notification of
      #   change.
      #
      # @param updated_account_number [String] The updated account number to send in the notification of change.
      #
      # @param updated_routing_number [String] The updated routing number to send in the notification of change.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundACHTransfer]
      #
      # @see Increase::Models::InboundACHTransferCreateNotificationOfChangeParams
      def create_notification_of_change(inbound_ach_transfer_id, params = {})
        parsed, options = Increase::InboundACHTransferCreateNotificationOfChangeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["inbound_ach_transfers/%1$s/create_notification_of_change", inbound_ach_transfer_id],
          body: parsed,
          model: Increase::InboundACHTransfer,
          options: options
        )
      end

      # Decline an Inbound ACH Transfer
      #
      # @overload decline(inbound_ach_transfer_id, reason: nil, request_options: {})
      #
      # @param inbound_ach_transfer_id [String] The identifier of the Inbound ACH Transfer to decline.
      #
      # @param reason [Symbol, Increase::Models::InboundACHTransferDeclineParams::Reason]
      #   The reason why this transfer will be returned. If this parameter is unset, the
      #   return codes will be `payment_stopped` for debits and
      #   `credit_entry_refused_by_receiver` for credits.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundACHTransfer]
      #
      # @see Increase::Models::InboundACHTransferDeclineParams
      def decline(inbound_ach_transfer_id, params = {})
        parsed, options = Increase::InboundACHTransferDeclineParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["inbound_ach_transfers/%1$s/decline", inbound_ach_transfer_id],
          body: parsed,
          model: Increase::InboundACHTransfer,
          options: options
        )
      end

      # Return an Inbound ACH Transfer
      #
      # @overload transfer_return(inbound_ach_transfer_id, reason:, request_options: {})
      #
      # @param inbound_ach_transfer_id [String]
      #   The identifier of the Inbound ACH Transfer to return to the originating
      #   financial institution.
      #
      # @param reason [Symbol, Increase::Models::InboundACHTransferTransferReturnParams::Reason]
      #   The reason why this transfer will be returned. The most usual return codes are
      #   `payment_stopped` for debits and `credit_entry_refused_by_receiver` for credits.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundACHTransfer]
      #
      # @see Increase::Models::InboundACHTransferTransferReturnParams
      def transfer_return(inbound_ach_transfer_id, params)
        parsed, options = Increase::InboundACHTransferTransferReturnParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["inbound_ach_transfers/%1$s/transfer_return", inbound_ach_transfer_id],
          body: parsed,
          model: Increase::InboundACHTransfer,
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
