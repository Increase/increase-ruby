# typed: strong

module Increase
  module Models
    class RealTimePaymentsTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The transfer amount in USD cents. For Real-Time Payments transfers, must be
      #   positive.
      sig { returns(Integer) }
      attr_accessor :amount

      # The name of the transfer's recipient.
      sig { returns(String) }
      attr_accessor :creditor_name

      # Unstructured information that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :remittance_information

      # The identifier of the Account Number from which to send the transfer.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # The name of the transfer's sender. If not provided, defaults to the name of the
      #   account's entity.
      sig { returns(T.nilable(String)) }
      attr_reader :debtor_name

      sig { params(debtor_name: String).void }
      attr_writer :debtor_name

      # The destination account number.
      sig { returns(T.nilable(String)) }
      attr_reader :destination_account_number

      sig { params(destination_account_number: String).void }
      attr_writer :destination_account_number

      # The destination American Bankers' Association (ABA) Routing Transit Number
      #   (RTN).
      sig { returns(T.nilable(String)) }
      attr_reader :destination_routing_number

      sig { params(destination_routing_number: String).void }
      attr_writer :destination_routing_number

      # The ID of an External Account to initiate a transfer to. If this parameter is
      #   provided, `destination_account_number` and `destination_routing_number` must be
      #   absent.
      sig { returns(T.nilable(String)) }
      attr_reader :external_account_id

      sig { params(external_account_id: String).void }
      attr_writer :external_account_id

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      # The name of the ultimate recipient of the transfer. Set this if the creditor is
      #   an intermediary receiving the payment for someone else.
      sig { returns(T.nilable(String)) }
      attr_reader :ultimate_creditor_name

      sig { params(ultimate_creditor_name: String).void }
      attr_writer :ultimate_creditor_name

      # The name of the ultimate sender of the transfer. Set this if the funds are being
      #   sent on behalf of someone who is not the account holder at Increase.
      sig { returns(T.nilable(String)) }
      attr_reader :ultimate_debtor_name

      sig { params(ultimate_debtor_name: String).void }
      attr_writer :ultimate_debtor_name

      sig do
        params(
          amount: Integer,
          creditor_name: String,
          remittance_information: String,
          source_account_number_id: String,
          debtor_name: String,
          destination_account_number: String,
          destination_routing_number: String,
          external_account_id: String,
          require_approval: T::Boolean,
          ultimate_creditor_name: String,
          ultimate_debtor_name: String,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        amount:,
        creditor_name:,
        remittance_information:,
        source_account_number_id:,
        debtor_name: nil,
        destination_account_number: nil,
        destination_routing_number: nil,
        external_account_id: nil,
        require_approval: nil,
        ultimate_creditor_name: nil,
        ultimate_debtor_name: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              amount: Integer,
              creditor_name: String,
              remittance_information: String,
              source_account_number_id: String,
              debtor_name: String,
              destination_account_number: String,
              destination_routing_number: String,
              external_account_id: String,
              require_approval: T::Boolean,
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
