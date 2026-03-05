# typed: strong

module Increase
  module Models
    module Simulations
      class CheckDepositReturnParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CheckDepositReturnParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Check Deposit you wish to return.
        sig { returns(String) }
        attr_accessor :check_deposit_id

        sig do
          params(
            check_deposit_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Check Deposit you wish to return.
          check_deposit_id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              check_deposit_id: String,
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
