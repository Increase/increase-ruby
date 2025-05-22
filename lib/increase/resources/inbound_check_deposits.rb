# frozen_string_literal: true

module Increase
  module Resources
    class InboundCheckDeposits
      # Retrieve an Inbound Check Deposit
      #
      # @overload retrieve(inbound_check_deposit_id, request_options: {})
      #
      # @param inbound_check_deposit_id [String] The identifier of the Inbound Check Deposit to get details for.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundCheckDeposit]
      #
      # @see Increase::Models::InboundCheckDepositRetrieveParams
      def retrieve(inbound_check_deposit_id, params = {})
        @client.request(
          method: :get,
          path: ["inbound_check_deposits/%1$s", inbound_check_deposit_id],
          model: Increase::InboundCheckDeposit,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::InboundCheckDepositListParams} for more details.
      #
      # List Inbound Check Deposits
      #
      # @overload list(account_id: nil, check_transfer_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      #
      # @param account_id [String] Filter Inbound Check Deposits to those belonging to the specified Account.
      #
      # @param check_transfer_id [String] Filter Inbound Check Deposits to those belonging to the specified Check Transfer
      #
      # @param created_at [Increase::Models::InboundCheckDepositListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::InboundCheckDeposit>]
      #
      # @see Increase::Models::InboundCheckDepositListParams
      def list(params = {})
        parsed, options = Increase::InboundCheckDepositListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "inbound_check_deposits",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::InboundCheckDeposit,
          options: options
        )
      end

      # Decline an Inbound Check Deposit
      #
      # @overload decline(inbound_check_deposit_id, request_options: {})
      #
      # @param inbound_check_deposit_id [String] The identifier of the Inbound Check Deposit to decline.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundCheckDeposit]
      #
      # @see Increase::Models::InboundCheckDepositDeclineParams
      def decline(inbound_check_deposit_id, params = {})
        @client.request(
          method: :post,
          path: ["inbound_check_deposits/%1$s/decline", inbound_check_deposit_id],
          model: Increase::InboundCheckDeposit,
          options: params[:request_options]
        )
      end

      # Return an Inbound Check Deposit
      #
      # @overload return_(inbound_check_deposit_id, reason:, request_options: {})
      #
      # @param inbound_check_deposit_id [String] The identifier of the Inbound Check Deposit to return.
      #
      # @param reason [Symbol, Increase::Models::InboundCheckDepositReturnParams::Reason] The reason to return the Inbound Check Deposit.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::InboundCheckDeposit]
      #
      # @see Increase::Models::InboundCheckDepositReturnParams
      def return_(inbound_check_deposit_id, params)
        parsed, options = Increase::InboundCheckDepositReturnParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["inbound_check_deposits/%1$s/return", inbound_check_deposit_id],
          body: parsed,
          model: Increase::InboundCheckDeposit,
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
