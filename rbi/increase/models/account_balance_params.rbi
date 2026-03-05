# typed: strong

module Increase
  module Models
    class AccountBalanceParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::AccountBalanceParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Account to retrieve.
      sig { returns(String) }
      attr_accessor :account_id

      # The moment to query the balance at. If not set, returns the current balances.
      sig { returns(T.nilable(Time)) }
      attr_reader :at_time

      sig { params(at_time: Time).void }
      attr_writer :at_time

      sig do
        params(
          account_id: String,
          at_time: Time,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Account to retrieve.
        account_id:,
        # The moment to query the balance at. If not set, returns the current balances.
        at_time: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            at_time: Time,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
