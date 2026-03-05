# typed: strong

module Increase
  module Models
    module Simulations
      class AccountTransferCompleteParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::AccountTransferCompleteParams,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account Transfer you wish to complete.
        sig { returns(String) }
        attr_accessor :account_transfer_id

        sig do
          params(
            account_transfer_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account Transfer you wish to complete.
          account_transfer_id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account_transfer_id: String,
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
