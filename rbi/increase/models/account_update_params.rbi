# typed: strong

module Increase
  module Models
    class AccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::AccountUpdateParams, Increase::Internal::AnyHash)
        end

      # The new credit limit of the Account, if and only if the Account is a loan
      # account.
      sig { returns(T.nilable(Integer)) }
      attr_reader :credit_limit

      sig { params(credit_limit: Integer).void }
      attr_writer :credit_limit

      # The new name of the Account.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        params(
          credit_limit: Integer,
          name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The new credit limit of the Account, if and only if the Account is a loan
        # account.
        credit_limit: nil,
        # The new name of the Account.
        name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            credit_limit: Integer,
            name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
