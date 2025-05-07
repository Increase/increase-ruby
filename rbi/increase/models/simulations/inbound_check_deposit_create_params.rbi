# typed: strong

module Increase
  module Models
    module Simulations
      class InboundCheckDepositCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The identifier of the Account Number the Inbound Check Deposit will be against.
        sig { returns(String) }
        attr_accessor :account_number_id

        # The check amount in cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The check number on the check to be deposited.
        sig { returns(String) }
        attr_accessor :check_number

        sig do
          params(
            account_number_id: String,
            amount: Integer,
            check_number: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account Number the Inbound Check Deposit will be against.
          account_number_id:,
          # The check amount in cents.
          amount:,
          # The check number on the check to be deposited.
          check_number:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account_number_id: String,
              amount: Integer,
              check_number: String,
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
