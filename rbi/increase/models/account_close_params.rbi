# typed: strong

module Increase
  module Models
    class AccountCloseParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::AccountCloseParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Account to close. The account must have a zero balance.
      sig { returns(String) }
      attr_accessor :account_id

      sig do
        params(
          account_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Account to close. The account must have a zero balance.
        account_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { account_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
