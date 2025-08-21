# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundWireTransfers
        # Simulates an [Inbound Wire Transfer](#inbound-wire-transfers) to your account.
        sig do
          params(
            account_number_id: String,
            amount: Integer,
            creditor_address_line1: String,
            creditor_address_line2: String,
            creditor_address_line3: String,
            creditor_name: String,
            debtor_address_line1: String,
            debtor_address_line2: String,
            debtor_address_line3: String,
            debtor_name: String,
            end_to_end_identification: String,
            instructing_agent_routing_number: String,
            instruction_identification: String,
            unique_end_to_end_transaction_reference: String,
            unstructured_remittance_information: String,
            wire_drawdown_request_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::InboundWireTransfer)
        end
        def create(
          # The identifier of the Account Number the inbound Wire Transfer is for.
          account_number_id:,
          # The transfer amount in cents. Must be positive.
          amount:,
          # The sending bank will set creditor_address_line1 in production. You can simulate
          # any value here.
          creditor_address_line1: nil,
          # The sending bank will set creditor_address_line2 in production. You can simulate
          # any value here.
          creditor_address_line2: nil,
          # The sending bank will set creditor_address_line3 in production. You can simulate
          # any value here.
          creditor_address_line3: nil,
          # The sending bank will set creditor_name in production. You can simulate any
          # value here.
          creditor_name: nil,
          # The sending bank will set debtor_address_line1 in production. You can simulate
          # any value here.
          debtor_address_line1: nil,
          # The sending bank will set debtor_address_line2 in production. You can simulate
          # any value here.
          debtor_address_line2: nil,
          # The sending bank will set debtor_address_line3 in production. You can simulate
          # any value here.
          debtor_address_line3: nil,
          # The sending bank will set debtor_name in production. You can simulate any value
          # here.
          debtor_name: nil,
          # The sending bank will set end_to_end_identification in production. You can
          # simulate any value here.
          end_to_end_identification: nil,
          # The sending bank will set instructing_agent_routing_number in production. You
          # can simulate any value here.
          instructing_agent_routing_number: nil,
          # The sending bank will set instruction_identification in production. You can
          # simulate any value here.
          instruction_identification: nil,
          # The sending bank will set unique_end_to_end_transaction_reference in production.
          # You can simulate any value here.
          unique_end_to_end_transaction_reference: nil,
          # The sending bank will set unstructured_remittance_information in production. You
          # can simulate any value here.
          unstructured_remittance_information: nil,
          # The identifier of a Wire Drawdown Request the inbound Wire Transfer is
          # fulfilling.
          wire_drawdown_request_id: nil,
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
