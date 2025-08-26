# typed: strong

module Increase
  module Resources
    class Simulations
      sig { returns(Increase::Resources::Simulations::InterestPayments) }
      attr_reader :interest_payments

      sig { returns(Increase::Resources::Simulations::CardAuthorizations) }
      attr_reader :card_authorizations

      sig do
        returns(Increase::Resources::Simulations::CardAuthorizationExpirations)
      end
      attr_reader :card_authorization_expirations

      sig { returns(Increase::Resources::Simulations::CardSettlements) }
      attr_reader :card_settlements

      sig { returns(Increase::Resources::Simulations::CardReversals) }
      attr_reader :card_reversals

      sig { returns(Increase::Resources::Simulations::CardIncrements) }
      attr_reader :card_increments

      sig { returns(Increase::Resources::Simulations::CardFuelConfirmations) }
      attr_reader :card_fuel_confirmations

      sig { returns(Increase::Resources::Simulations::CardRefunds) }
      attr_reader :card_refunds

      sig { returns(Increase::Resources::Simulations::CardDisputes) }
      attr_reader :card_disputes

      sig { returns(Increase::Resources::Simulations::PhysicalCards) }
      attr_reader :physical_cards

      sig do
        returns(Increase::Resources::Simulations::DigitalWalletTokenRequests)
      end
      attr_reader :digital_wallet_token_requests

      sig { returns(Increase::Resources::Simulations::PendingTransactions) }
      attr_reader :pending_transactions

      sig { returns(Increase::Resources::Simulations::AccountTransfers) }
      attr_reader :account_transfers

      sig { returns(Increase::Resources::Simulations::ACHTransfers) }
      attr_reader :ach_transfers

      sig { returns(Increase::Resources::Simulations::InboundACHTransfers) }
      attr_reader :inbound_ach_transfers

      sig { returns(Increase::Resources::Simulations::WireTransfers) }
      attr_reader :wire_transfers

      sig { returns(Increase::Resources::Simulations::InboundWireTransfers) }
      attr_reader :inbound_wire_transfers

      sig { returns(Increase::Resources::Simulations::WireDrawdownRequests) }
      attr_reader :wire_drawdown_requests

      sig do
        returns(Increase::Resources::Simulations::InboundWireDrawdownRequests)
      end
      attr_reader :inbound_wire_drawdown_requests

      sig { returns(Increase::Resources::Simulations::CheckTransfers) }
      attr_reader :check_transfers

      sig { returns(Increase::Resources::Simulations::InboundCheckDeposits) }
      attr_reader :inbound_check_deposits

      sig do
        returns(Increase::Resources::Simulations::RealTimePaymentsTransfers)
      end
      attr_reader :real_time_payments_transfers

      sig do
        returns(
          Increase::Resources::Simulations::InboundRealTimePaymentsTransfers
        )
      end
      attr_reader :inbound_real_time_payments_transfers

      sig { returns(Increase::Resources::Simulations::CheckDeposits) }
      attr_reader :check_deposits

      sig { returns(Increase::Resources::Simulations::InboundMailItems) }
      attr_reader :inbound_mail_items

      sig { returns(Increase::Resources::Simulations::Programs) }
      attr_reader :programs

      sig { returns(Increase::Resources::Simulations::AccountStatements) }
      attr_reader :account_statements

      sig { returns(Increase::Resources::Simulations::Documents) }
      attr_reader :documents

      sig { returns(Increase::Resources::Simulations::CardTokens) }
      attr_reader :card_tokens

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
