# typed: strong

module Increase
  module Models
    module Simulations
      class FeePaymentCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::FeePaymentCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account to use as the billing account for the fee payment.
        sig { returns(String) }
        attr_accessor :account_id

        # The fee amount in cents. Must be positive.
        sig { returns(Integer) }
        attr_accessor :amount

        sig do
          params(
            account_id: String,
            amount: Integer,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account to use as the billing account for the fee payment.
          account_id:,
          # The fee amount in cents. Must be positive.
          amount:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              amount: Integer,
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
