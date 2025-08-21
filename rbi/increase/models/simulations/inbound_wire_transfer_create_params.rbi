# typed: strong

module Increase
  module Models
    module Simulations
      class InboundWireTransferCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::InboundWireTransferCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account Number the inbound Wire Transfer is for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # The transfer amount in cents. Must be positive.
        sig { returns(Integer) }
        attr_accessor :amount

        # The sending bank will set creditor_address_line1 in production. You can simulate
        # any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :creditor_address_line1

        sig { params(creditor_address_line1: String).void }
        attr_writer :creditor_address_line1

        # The sending bank will set creditor_address_line2 in production. You can simulate
        # any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :creditor_address_line2

        sig { params(creditor_address_line2: String).void }
        attr_writer :creditor_address_line2

        # The sending bank will set creditor_address_line3 in production. You can simulate
        # any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :creditor_address_line3

        sig { params(creditor_address_line3: String).void }
        attr_writer :creditor_address_line3

        # The sending bank will set creditor_name in production. You can simulate any
        # value here.
        sig { returns(T.nilable(String)) }
        attr_reader :creditor_name

        sig { params(creditor_name: String).void }
        attr_writer :creditor_name

        # The sending bank will set debtor_address_line1 in production. You can simulate
        # any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_address_line1

        sig { params(debtor_address_line1: String).void }
        attr_writer :debtor_address_line1

        # The sending bank will set debtor_address_line2 in production. You can simulate
        # any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_address_line2

        sig { params(debtor_address_line2: String).void }
        attr_writer :debtor_address_line2

        # The sending bank will set debtor_address_line3 in production. You can simulate
        # any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_address_line3

        sig { params(debtor_address_line3: String).void }
        attr_writer :debtor_address_line3

        # The sending bank will set debtor_name in production. You can simulate any value
        # here.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_name

        sig { params(debtor_name: String).void }
        attr_writer :debtor_name

        # The sending bank will set end_to_end_identification in production. You can
        # simulate any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :end_to_end_identification

        sig { params(end_to_end_identification: String).void }
        attr_writer :end_to_end_identification

        # The sending bank will set instructing_agent_routing_number in production. You
        # can simulate any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :instructing_agent_routing_number

        sig { params(instructing_agent_routing_number: String).void }
        attr_writer :instructing_agent_routing_number

        # The sending bank will set instruction_identification in production. You can
        # simulate any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :instruction_identification

        sig { params(instruction_identification: String).void }
        attr_writer :instruction_identification

        # The sending bank will set unique_end_to_end_transaction_reference in production.
        # You can simulate any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :unique_end_to_end_transaction_reference

        sig { params(unique_end_to_end_transaction_reference: String).void }
        attr_writer :unique_end_to_end_transaction_reference

        # The sending bank will set unstructured_remittance_information in production. You
        # can simulate any value here.
        sig { returns(T.nilable(String)) }
        attr_reader :unstructured_remittance_information

        sig { params(unstructured_remittance_information: String).void }
        attr_writer :unstructured_remittance_information

        # The identifier of a Wire Drawdown Request the inbound Wire Transfer is
        # fulfilling.
        sig { returns(T.nilable(String)) }
        attr_reader :wire_drawdown_request_id

        sig { params(wire_drawdown_request_id: String).void }
        attr_writer :wire_drawdown_request_id

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
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
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
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
