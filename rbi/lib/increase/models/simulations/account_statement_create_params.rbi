# typed: strong

module Increase
  module Models
    module Simulations
      class AccountStatementCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # The identifier of the Account the statement is for.
        sig { returns(String) }
        attr_accessor :account_id

        sig do
          params(
            account_id: String,
            request_options: T.any(
              Increase::RequestOptions,
              Increase::Internal::AnyHash
            )
          )
            .returns(T.attached_class)
        end
        def self.new(account_id:, request_options: {})
        end

        sig { override.returns({account_id: String, request_options: Increase::RequestOptions}) }
        def to_hash
        end
      end
    end
  end
end
