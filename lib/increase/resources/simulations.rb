# frozen_string_literal: true

module Increase
  module Resources
    class Simulations
      # @return [Increase::Resources::Simulations::InterestPayments]
      attr_reader :interest_payments

      # @return [Increase::Resources::Simulations::AccountTransfers]
      attr_reader :account_transfers

      # @return [Increase::Resources::Simulations::CardAuthorizations]
      attr_reader :card_authorizations

      # @return [Increase::Resources::Simulations::CardAuthorizationExpirations]
      attr_reader :card_authorization_expirations

      # @return [Increase::Resources::Simulations::CardSettlements]
      attr_reader :card_settlements

      # @return [Increase::Resources::Simulations::CardReversals]
      attr_reader :card_reversals

      # @return [Increase::Resources::Simulations::CardIncrements]
      attr_reader :card_increments

      # @return [Increase::Resources::Simulations::CardFuelConfirmations]
      attr_reader :card_fuel_confirmations

      # @return [Increase::Resources::Simulations::CardRefunds]
      attr_reader :card_refunds

      # @return [Increase::Resources::Simulations::CardDisputes]
      attr_reader :card_disputes

      # @return [Increase::Resources::Simulations::PhysicalCards]
      attr_reader :physical_cards

      # @return [Increase::Resources::Simulations::DigitalWalletTokenRequests]
      attr_reader :digital_wallet_token_requests

      # @return [Increase::Resources::Simulations::PendingTransactions]
      attr_reader :pending_transactions

      # @return [Increase::Resources::Simulations::ACHTransfers]
      attr_reader :ach_transfers

      # @return [Increase::Resources::Simulations::InboundACHTransfers]
      attr_reader :inbound_ach_transfers

      # @return [Increase::Resources::Simulations::WireTransfers]
      attr_reader :wire_transfers

      # @return [Increase::Resources::Simulations::InboundWireTransfers]
      attr_reader :inbound_wire_transfers

      # @return [Increase::Resources::Simulations::WireDrawdownRequests]
      attr_reader :wire_drawdown_requests

      # @return [Increase::Resources::Simulations::InboundWireDrawdownRequests]
      attr_reader :inbound_wire_drawdown_requests

      # @return [Increase::Resources::Simulations::CheckTransfers]
      attr_reader :check_transfers

      # @return [Increase::Resources::Simulations::InboundCheckDeposits]
      attr_reader :inbound_check_deposits

      # @return [Increase::Resources::Simulations::RealTimePaymentsTransfers]
      attr_reader :real_time_payments_transfers

      # @return [Increase::Resources::Simulations::InboundRealTimePaymentsTransfers]
      attr_reader :inbound_real_time_payments_transfers

      # @return [Increase::Resources::Simulations::CheckDeposits]
      attr_reader :check_deposits

      # @return [Increase::Resources::Simulations::InboundMailItems]
      attr_reader :inbound_mail_items

      # @return [Increase::Resources::Simulations::Programs]
      attr_reader :programs

      # @return [Increase::Resources::Simulations::AccountStatements]
      attr_reader :account_statements

      # @return [Increase::Resources::Simulations::Documents]
      attr_reader :documents

      # @return [Increase::Resources::Simulations::CardTokens]
      attr_reader :card_tokens

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
        @interest_payments = Increase::Resources::Simulations::InterestPayments.new(client: client)
        @account_transfers = Increase::Resources::Simulations::AccountTransfers.new(client: client)
        @card_authorizations = Increase::Resources::Simulations::CardAuthorizations.new(client: client)
        @card_authorization_expirations =
          Increase::Resources::Simulations::CardAuthorizationExpirations.new(client: client)
        @card_settlements = Increase::Resources::Simulations::CardSettlements.new(client: client)
        @card_reversals = Increase::Resources::Simulations::CardReversals.new(client: client)
        @card_increments = Increase::Resources::Simulations::CardIncrements.new(client: client)
        @card_fuel_confirmations = Increase::Resources::Simulations::CardFuelConfirmations.new(client: client)
        @card_refunds = Increase::Resources::Simulations::CardRefunds.new(client: client)
        @card_disputes = Increase::Resources::Simulations::CardDisputes.new(client: client)
        @physical_cards = Increase::Resources::Simulations::PhysicalCards.new(client: client)
        @digital_wallet_token_requests =
          Increase::Resources::Simulations::DigitalWalletTokenRequests.new(client: client)
        @pending_transactions = Increase::Resources::Simulations::PendingTransactions.new(client: client)
        @ach_transfers = Increase::Resources::Simulations::ACHTransfers.new(client: client)
        @inbound_ach_transfers = Increase::Resources::Simulations::InboundACHTransfers.new(client: client)
        @wire_transfers = Increase::Resources::Simulations::WireTransfers.new(client: client)
        @inbound_wire_transfers = Increase::Resources::Simulations::InboundWireTransfers.new(client: client)
        @wire_drawdown_requests = Increase::Resources::Simulations::WireDrawdownRequests.new(client: client)
        @inbound_wire_drawdown_requests =
          Increase::Resources::Simulations::InboundWireDrawdownRequests.new(client: client)
        @check_transfers = Increase::Resources::Simulations::CheckTransfers.new(client: client)
        @inbound_check_deposits = Increase::Resources::Simulations::InboundCheckDeposits.new(client: client)
        @real_time_payments_transfers =
          Increase::Resources::Simulations::RealTimePaymentsTransfers.new(client: client)
        @inbound_real_time_payments_transfers =
          Increase::Resources::Simulations::InboundRealTimePaymentsTransfers.new(client: client)
        @check_deposits = Increase::Resources::Simulations::CheckDeposits.new(client: client)
        @inbound_mail_items = Increase::Resources::Simulations::InboundMailItems.new(client: client)
        @programs = Increase::Resources::Simulations::Programs.new(client: client)
        @account_statements = Increase::Resources::Simulations::AccountStatements.new(client: client)
        @documents = Increase::Resources::Simulations::Documents.new(client: client)
        @card_tokens = Increase::Resources::Simulations::CardTokens.new(client: client)
      end
    end
  end
end
