# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundRealTimePaymentsTransfers
        # Simulates an
        # [Inbound Real-Time Payments Transfer](#inbound-real-time-payments-transfers) to
        # your account. Real-Time Payments are a beta feature.
        sig do
          params(
            account_number_id: String,
            amount: Integer,
            debtor_account_number: String,
            debtor_name: String,
            debtor_routing_number: String,
            remittance_information: String,
            request_for_payment_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::InboundRealTimePaymentsTransfer)
        end
        def create(
          # The identifier of the Account Number the inbound Real-Time Payments Transfer is
          # for.
          account_number_id:,
          # The transfer amount in USD cents. Must be positive.
          amount:,
          # The account number of the account that sent the transfer.
          debtor_account_number: nil,
          # The name provided by the sender of the transfer.
          debtor_name: nil,
          # The routing number of the account that sent the transfer.
          debtor_routing_number: nil,
          # Additional information included with the transfer.
          remittance_information: nil,
          # The identifier of a pending Request for Payment that this transfer will fulfill.
          request_for_payment_id: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Increase::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
