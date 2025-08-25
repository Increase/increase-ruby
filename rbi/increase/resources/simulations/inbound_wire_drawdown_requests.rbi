# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundWireDrawdownRequests
        # Simulates receiving an
        # [Inbound Wire Drawdown Request](#inbound-wire-drawdown-requests).
        sig do
          params(
            amount: Integer,
            creditor_account_number: String,
            creditor_routing_number: String,
            currency: String,
            recipient_account_number_id: String,
            creditor_address_line1: String,
            creditor_address_line2: String,
            creditor_address_line3: String,
            creditor_name: String,
            debtor_account_number: String,
            debtor_address_line1: String,
            debtor_address_line2: String,
            debtor_address_line3: String,
            debtor_name: String,
            debtor_routing_number: String,
            end_to_end_identification: String,
            instruction_identification: String,
            unique_end_to_end_transaction_reference: String,
            unstructured_remittance_information: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::InboundWireDrawdownRequest)
        end
        def create(
          # The amount being requested in cents.
          amount:,
          # The creditor's account number.
          creditor_account_number:,
          # The creditor's routing number.
          creditor_routing_number:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
          # requested. Will always be "USD".
          currency:,
          # The Account Number to which the recipient of this request is being requested to
          # send funds from.
          recipient_account_number_id:,
          # A free-form address field set by the sender representing the first line of the
          # creditor's address.
          creditor_address_line1: nil,
          # A free-form address field set by the sender representing the second line of the
          # creditor's address.
          creditor_address_line2: nil,
          # A free-form address field set by the sender representing the third line of the
          # creditor's address.
          creditor_address_line3: nil,
          # A free-form name field set by the sender representing the creditor's name.
          creditor_name: nil,
          # The debtor's account number.
          debtor_account_number: nil,
          # A free-form address field set by the sender representing the first line of the
          # debtor's address.
          debtor_address_line1: nil,
          # A free-form address field set by the sender representing the second line of the
          # debtor's address.
          debtor_address_line2: nil,
          # A free-form address field set by the sender.
          debtor_address_line3: nil,
          # A free-form name field set by the sender representing the debtor's name.
          debtor_name: nil,
          # The debtor's routing number.
          debtor_routing_number: nil,
          # A free-form reference string set by the sender, to help identify the transfer.
          end_to_end_identification: nil,
          # The sending bank's identifier for the wire transfer.
          instruction_identification: nil,
          # The Unique End-to-end Transaction Reference
          # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
          # of the transfer.
          unique_end_to_end_transaction_reference: nil,
          # A free-form message set by the sender.
          unstructured_remittance_information: nil,
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
