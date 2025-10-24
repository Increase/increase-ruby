# typed: strong

module Increase
  module Models
    module Simulations
      class InboundFednowTransferCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::InboundFednowTransferCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account Number the inbound FedNow Transfer is for.
        sig { returns(String) }
        attr_accessor :account_number_id

        # The transfer amount in USD cents. Must be positive.
        sig { returns(Integer) }
        attr_accessor :amount

        # The account number of the account that sent the transfer.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_account_number

        sig { params(debtor_account_number: String).void }
        attr_writer :debtor_account_number

        # The name provided by the sender of the transfer.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_name

        sig { params(debtor_name: String).void }
        attr_writer :debtor_name

        # The routing number of the account that sent the transfer.
        sig { returns(T.nilable(String)) }
        attr_reader :debtor_routing_number

        sig { params(debtor_routing_number: String).void }
        attr_writer :debtor_routing_number

        # Additional information included with the transfer.
        sig { returns(T.nilable(String)) }
        attr_reader :unstructured_remittance_information

        sig { params(unstructured_remittance_information: String).void }
        attr_writer :unstructured_remittance_information

        sig do
          params(
            account_number_id: String,
            amount: Integer,
            debtor_account_number: String,
            debtor_name: String,
            debtor_routing_number: String,
            unstructured_remittance_information: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account Number the inbound FedNow Transfer is for.
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
          unstructured_remittance_information: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account_number_id: String,
              amount: Integer,
              debtor_account_number: String,
              debtor_name: String,
              debtor_routing_number: String,
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
