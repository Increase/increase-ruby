# typed: strong

module Increase
  module Models
    class AccountTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::AccountTransferCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier for the account that will send the transfer.
      sig { returns(String) }
      attr_accessor :account_id

      # The transfer amount in the minor unit of the account currency. For dollars, for
      # example, this is cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The description you choose to give the transfer.
      sig { returns(String) }
      attr_accessor :description

      # The identifier for the account that will receive the transfer.
      sig { returns(String) }
      attr_accessor :destination_account_id

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      sig do
        params(
          account_id: String,
          amount: Integer,
          description: String,
          destination_account_id: String,
          require_approval: T::Boolean,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The transfer amount in the minor unit of the account currency. For dollars, for
        # example, this is cents.
        amount:,
        # The description you choose to give the transfer.
        description:,
        # The identifier for the account that will receive the transfer.
        destination_account_id:,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Integer,
            description: String,
            destination_account_id: String,
            require_approval: T::Boolean,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
