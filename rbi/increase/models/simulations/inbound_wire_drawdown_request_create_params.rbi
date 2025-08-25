# typed: strong

module Increase
  module Models
    module Simulations
      class InboundWireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::InboundWireDrawdownRequestCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The amount being requested in cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The creditor's account number.
        sig { returns(String) }
        attr_accessor :creditor_account_number

        # The creditor's routing number.
        sig { returns(String) }
        attr_accessor :creditor_routing_number

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        # requested. Will always be "USD".
        sig { returns(String) }
        attr_accessor :currency

        # The Account Number to which the recipient of this request is being requested to
        # send funds from.
        sig { returns(String) }
        attr_accessor :recipient_account_number_id

        # A free-form address field set by the sender representing the first line of the
        # creditor's address.
        sig { returns(T.nilable(String)) }
        attr_reader :creditor_address_line1

        sig { params(creditor_address_line1: String).void }
        attr_writer :creditor_address_line1

        # A free-form address field set by the sender representing the second line of the
        # creditor's address.
        sig { returns(T.nilable(String)) }
        attr_reader :creditor_address_line2

        sig { params(creditor_address_line2: String).void }
        attr_writer :creditor_address_line2

        # A free-form address field set by the sender representing the third line of the
        # creditor's address.
        sig { returns(T.nilable(String)) }
        attr_reader :creditor_address_line3

        sig { params(creditor_address_line3: String).void }
        attr_writer :creditor_address_line3

        # A free-form name field set by the sender representing the creditor's name.
        sig { returns(T.nilable(String)) }
        attr_reader :creditor_name

        sig { params(creditor_name: String).void }
        attr_writer :creditor_name

        # The debtor's account number.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_account_number

        sig { params(debtor_account_number: String).void }
        attr_writer :debtor_account_number

        # A free-form address field set by the sender representing the first line of the
        # debtor's address.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_address_line1

        sig { params(debtor_address_line1: String).void }
        attr_writer :debtor_address_line1

        # A free-form address field set by the sender representing the second line of the
        # debtor's address.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_address_line2

        sig { params(debtor_address_line2: String).void }
        attr_writer :debtor_address_line2

        # A free-form address field set by the sender.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_address_line3

        sig { params(debtor_address_line3: String).void }
        attr_writer :debtor_address_line3

        # A free-form name field set by the sender representing the debtor's name.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_name

        sig { params(debtor_name: String).void }
        attr_writer :debtor_name

        # The debtor's routing number.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_routing_number

        sig { params(debtor_routing_number: String).void }
        attr_writer :debtor_routing_number

        # A free-form reference string set by the sender, to help identify the transfer.
        sig { returns(T.nilable(String)) }
        attr_reader :end_to_end_identification

        sig { params(end_to_end_identification: String).void }
        attr_writer :end_to_end_identification

        # The sending bank's identifier for the wire transfer.
        sig { returns(T.nilable(String)) }
        attr_reader :instruction_identification

        sig { params(instruction_identification: String).void }
        attr_writer :instruction_identification

        # The Unique End-to-end Transaction Reference
        # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
        # of the transfer.
        sig { returns(T.nilable(String)) }
        attr_reader :unique_end_to_end_transaction_reference

        sig { params(unique_end_to_end_transaction_reference: String).void }
        attr_writer :unique_end_to_end_transaction_reference

        # A free-form message set by the sender.
        sig { returns(T.nilable(String)) }
        attr_reader :unstructured_remittance_information

        sig { params(unstructured_remittance_information: String).void }
        attr_writer :unstructured_remittance_information

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
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
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
