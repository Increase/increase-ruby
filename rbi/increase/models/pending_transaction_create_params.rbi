# typed: strong

module Increase
  module Models
    class PendingTransactionCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::PendingTransactionCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The Account to place the hold on.
      sig { returns(String) }
      attr_accessor :account_id

      # The amount to hold in the minor unit of the account's currency. For dollars, for
      # example, this is cents. This should be a negative amount - to hold $1.00 from
      # the account, you would pass -100.
      sig { returns(Integer) }
      attr_accessor :amount

      # The description you choose to give the hold.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig do
        params(
          account_id: String,
          amount: Integer,
          description: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account to place the hold on.
        account_id:,
        # The amount to hold in the minor unit of the account's currency. For dollars, for
        # example, this is cents. This should be a negative amount - to hold $1.00 from
        # the account, you would pass -100.
        amount:,
        # The description you choose to give the hold.
        description: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Integer,
            description: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
