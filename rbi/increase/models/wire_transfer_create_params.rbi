# typed: strong

module Increase
  module Models
    class WireTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::WireTransferCreateParams, Increase::Internal::AnyHash)
        end

      # The identifier for the account that will send the transfer.
      sig { returns(String) }
      attr_accessor :account_id

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The beneficiary's name.
      sig { returns(String) }
      attr_accessor :beneficiary_name

      # The message that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :message_to_recipient

      # The account number for the destination account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number

      sig { params(account_number: String).void }
      attr_writer :account_number

      # The beneficiary's address line 1.
      sig { returns(T.nilable(String)) }
      attr_reader :beneficiary_address_line1

      sig { params(beneficiary_address_line1: String).void }
      attr_writer :beneficiary_address_line1

      # The beneficiary's address line 2.
      sig { returns(T.nilable(String)) }
      attr_reader :beneficiary_address_line2

      sig { params(beneficiary_address_line2: String).void }
      attr_writer :beneficiary_address_line2

      # The beneficiary's address line 3.
      sig { returns(T.nilable(String)) }
      attr_reader :beneficiary_address_line3

      sig { params(beneficiary_address_line3: String).void }
      attr_writer :beneficiary_address_line3

      # The ID of an External Account to initiate a transfer to. If this parameter is
      # provided, `account_number` and `routing_number` must be absent.
      sig { returns(T.nilable(String)) }
      attr_reader :external_account_id

      sig { params(external_account_id: String).void }
      attr_writer :external_account_id

      # The originator's address line 1. This is only necessary if you're transferring
      # from a commingled account. Otherwise, we'll use the associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line1

      sig { params(originator_address_line1: String).void }
      attr_writer :originator_address_line1

      # The originator's address line 2. This is only necessary if you're transferring
      # from a commingled account. Otherwise, we'll use the associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line2

      sig { params(originator_address_line2: String).void }
      attr_writer :originator_address_line2

      # The originator's address line 3. This is only necessary if you're transferring
      # from a commingled account. Otherwise, we'll use the associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line3

      sig { params(originator_address_line3: String).void }
      attr_writer :originator_address_line3

      # The originator's name. This is only necessary if you're transferring from a
      # commingled account. Otherwise, we'll use the associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_name

      sig { params(originator_name: String).void }
      attr_writer :originator_name

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      # destination account.
      sig { returns(T.nilable(String)) }
      attr_reader :routing_number

      sig { params(routing_number: String).void }
      attr_writer :routing_number

      # The ID of an Account Number that will be passed to the wire's recipient
      sig { returns(T.nilable(String)) }
      attr_reader :source_account_number_id

      sig { params(source_account_number_id: String).void }
      attr_writer :source_account_number_id

      sig do
        params(
          account_id: String,
          amount: Integer,
          beneficiary_name: String,
          message_to_recipient: String,
          account_number: String,
          beneficiary_address_line1: String,
          beneficiary_address_line2: String,
          beneficiary_address_line3: String,
          external_account_id: String,
          originator_address_line1: String,
          originator_address_line2: String,
          originator_address_line3: String,
          originator_name: String,
          require_approval: T::Boolean,
          routing_number: String,
          source_account_number_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The transfer amount in USD cents.
        amount:,
        # The beneficiary's name.
        beneficiary_name:,
        # The message that will show on the recipient's bank statement.
        message_to_recipient:,
        # The account number for the destination account.
        account_number: nil,
        # The beneficiary's address line 1.
        beneficiary_address_line1: nil,
        # The beneficiary's address line 2.
        beneficiary_address_line2: nil,
        # The beneficiary's address line 3.
        beneficiary_address_line3: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number` and `routing_number` must be absent.
        external_account_id: nil,
        # The originator's address line 1. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line1: nil,
        # The originator's address line 2. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line2: nil,
        # The originator's address line 3. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line3: nil,
        # The originator's name. This is only necessary if you're transferring from a
        # commingled account. Otherwise, we'll use the associated entity's details.
        originator_name: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
        # destination account.
        routing_number: nil,
        # The ID of an Account Number that will be passed to the wire's recipient
        source_account_number_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Integer,
            beneficiary_name: String,
            message_to_recipient: String,
            account_number: String,
            beneficiary_address_line1: String,
            beneficiary_address_line2: String,
            beneficiary_address_line3: String,
            external_account_id: String,
            originator_address_line1: String,
            originator_address_line2: String,
            originator_address_line3: String,
            originator_name: String,
            require_approval: T::Boolean,
            routing_number: String,
            source_account_number_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
