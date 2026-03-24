# typed: strong

module Increase
  module Models
    class RealTimePaymentsTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::RealTimePaymentsTransferCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The transfer amount in USD cents. For Real-Time Payments transfers, must be
      # positive.
      sig { returns(Integer) }
      attr_accessor :amount

      # The name of the transfer's recipient.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The identifier of the Account Number from which to send the transfer.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # Unstructured information that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # The destination account number.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number

      sig { params(account_number: String).void }
      attr_writer :account_number

      # The name of the transfer's sender. If not provided, defaults to the name of the
      # account's entity.
      sig { returns(T.nilable(String)) }
      attr_reader :debtor_name

      sig { params(debtor_name: String).void }
      attr_writer :debtor_name

      # The ID of an External Account to initiate a transfer to. If this parameter is
      # provided, `account_number` and `routing_number` must be absent.
      sig { returns(T.nilable(String)) }
      attr_reader :external_account_id

      sig { params(external_account_id: String).void }
      attr_writer :external_account_id

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      # The destination American Bankers' Association (ABA) Routing Transit Number
      # (RTN).
      sig { returns(T.nilable(String)) }
      attr_reader :routing_number

      sig { params(routing_number: String).void }
      attr_writer :routing_number

      # The name of the ultimate recipient of the transfer. Set this if the creditor is
      # an intermediary receiving the payment for someone else.
      sig { returns(T.nilable(String)) }
      attr_reader :ultimate_creditor_name

      sig { params(ultimate_creditor_name: String).void }
      attr_writer :ultimate_creditor_name

      # The name of the ultimate sender of the transfer. Set this if the funds are being
      # sent on behalf of someone who is not the account holder at Increase.
      sig { returns(T.nilable(String)) }
      attr_reader :ultimate_debtor_name

      sig { params(ultimate_debtor_name: String).void }
      attr_writer :ultimate_debtor_name

      sig do
        params(
          amount: Integer,
          creditor_name: String,
          source_account_number_id: String,
          unstructured_remittance_information: String,
          account_number: String,
          debtor_name: String,
          external_account_id: String,
          require_approval: T::Boolean,
          routing_number: String,
          ultimate_creditor_name: String,
          ultimate_debtor_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The transfer amount in USD cents. For Real-Time Payments transfers, must be
        # positive.
        amount:,
        # The name of the transfer's recipient.
        creditor_name:,
        # The identifier of the Account Number from which to send the transfer.
        source_account_number_id:,
        # Unstructured information that will show on the recipient's bank statement.
        unstructured_remittance_information:,
        # The destination account number.
        account_number: nil,
        # The name of the transfer's sender. If not provided, defaults to the name of the
        # account's entity.
        debtor_name: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number` and `routing_number` must be absent.
        external_account_id: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The destination American Bankers' Association (ABA) Routing Transit Number
        # (RTN).
        routing_number: nil,
        # The name of the ultimate recipient of the transfer. Set this if the creditor is
        # an intermediary receiving the payment for someone else.
        ultimate_creditor_name: nil,
        # The name of the ultimate sender of the transfer. Set this if the funds are being
        # sent on behalf of someone who is not the account holder at Increase.
        ultimate_debtor_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: Integer,
            creditor_name: String,
            source_account_number_id: String,
            unstructured_remittance_information: String,
            account_number: String,
            debtor_name: String,
            external_account_id: String,
            require_approval: T::Boolean,
            routing_number: String,
            ultimate_creditor_name: String,
            ultimate_debtor_name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
