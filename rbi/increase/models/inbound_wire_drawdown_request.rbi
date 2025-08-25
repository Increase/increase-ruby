# typed: strong

module Increase
  module Models
    class InboundWireDrawdownRequest < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundWireDrawdownRequest,
            Increase::Internal::AnyHash
          )
        end

      # The Wire drawdown request identifier.
      sig { returns(String) }
      attr_accessor :id

      # The amount being requested in cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the inbound wire drawdown requested was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The creditor's account number.
      sig { returns(String) }
      attr_accessor :creditor_account_number

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :creditor_address_line1

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :creditor_address_line2

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :creditor_address_line3

      # A name set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :creditor_name

      # The creditor's routing number.
      sig { returns(String) }
      attr_accessor :creditor_routing_number

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      # requested. Will always be "USD".
      sig { returns(String) }
      attr_accessor :currency

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :debtor_address_line1

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :debtor_address_line2

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :debtor_address_line3

      # A name set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :debtor_name

      # A free-form reference string set by the sender, to help identify the drawdown
      # request.
      sig { returns(T.nilable(String)) }
      attr_accessor :end_to_end_identification

      # A unique identifier available to the originating and receiving banks, commonly
      # abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
      # service and is helpful when debugging wires with the originating bank.
      sig { returns(T.nilable(String)) }
      attr_accessor :input_message_accountability_data

      # The sending bank's identifier for the drawdown request.
      sig { returns(T.nilable(String)) }
      attr_accessor :instruction_identification

      # The Account Number from which the recipient of this request is being requested
      # to send funds.
      sig { returns(String) }
      attr_accessor :recipient_account_number_id

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_drawdown_request`.
      sig { returns(Increase::InboundWireDrawdownRequest::Type::TaggedSymbol) }
      attr_accessor :type

      # The Unique End-to-end Transaction Reference
      # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
      # of the drawdown request.
      sig { returns(T.nilable(String)) }
      attr_accessor :unique_end_to_end_transaction_reference

      # A free-form message set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :unstructured_remittance_information

      # Inbound wire drawdown requests are requests from someone else to send them a
      # wire. For more information, see our
      # [Wire Drawdown Requests documentation](/documentation/wire-drawdown-requests).
      sig do
        params(
          id: String,
          amount: Integer,
          created_at: Time,
          creditor_account_number: String,
          creditor_address_line1: T.nilable(String),
          creditor_address_line2: T.nilable(String),
          creditor_address_line3: T.nilable(String),
          creditor_name: T.nilable(String),
          creditor_routing_number: String,
          currency: String,
          debtor_address_line1: T.nilable(String),
          debtor_address_line2: T.nilable(String),
          debtor_address_line3: T.nilable(String),
          debtor_name: T.nilable(String),
          end_to_end_identification: T.nilable(String),
          input_message_accountability_data: T.nilable(String),
          instruction_identification: T.nilable(String),
          recipient_account_number_id: String,
          type: Increase::InboundWireDrawdownRequest::Type::OrSymbol,
          unique_end_to_end_transaction_reference: T.nilable(String),
          unstructured_remittance_information: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The Wire drawdown request identifier.
        id:,
        # The amount being requested in cents.
        amount:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the inbound wire drawdown requested was created.
        created_at:,
        # The creditor's account number.
        creditor_account_number:,
        # A free-form address field set by the sender.
        creditor_address_line1:,
        # A free-form address field set by the sender.
        creditor_address_line2:,
        # A free-form address field set by the sender.
        creditor_address_line3:,
        # A name set by the sender.
        creditor_name:,
        # The creditor's routing number.
        creditor_routing_number:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        # requested. Will always be "USD".
        currency:,
        # A free-form address field set by the sender.
        debtor_address_line1:,
        # A free-form address field set by the sender.
        debtor_address_line2:,
        # A free-form address field set by the sender.
        debtor_address_line3:,
        # A name set by the sender.
        debtor_name:,
        # A free-form reference string set by the sender, to help identify the drawdown
        # request.
        end_to_end_identification:,
        # A unique identifier available to the originating and receiving banks, commonly
        # abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
        # service and is helpful when debugging wires with the originating bank.
        input_message_accountability_data:,
        # The sending bank's identifier for the drawdown request.
        instruction_identification:,
        # The Account Number from which the recipient of this request is being requested
        # to send funds.
        recipient_account_number_id:,
        # A constant representing the object's type. For this resource it will always be
        # `inbound_wire_drawdown_request`.
        type:,
        # The Unique End-to-end Transaction Reference
        # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
        # of the drawdown request.
        unique_end_to_end_transaction_reference:,
        # A free-form message set by the sender.
        unstructured_remittance_information:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            amount: Integer,
            created_at: Time,
            creditor_account_number: String,
            creditor_address_line1: T.nilable(String),
            creditor_address_line2: T.nilable(String),
            creditor_address_line3: T.nilable(String),
            creditor_name: T.nilable(String),
            creditor_routing_number: String,
            currency: String,
            debtor_address_line1: T.nilable(String),
            debtor_address_line2: T.nilable(String),
            debtor_address_line3: T.nilable(String),
            debtor_name: T.nilable(String),
            end_to_end_identification: T.nilable(String),
            input_message_accountability_data: T.nilable(String),
            instruction_identification: T.nilable(String),
            recipient_account_number_id: String,
            type: Increase::InboundWireDrawdownRequest::Type::TaggedSymbol,
            unique_end_to_end_transaction_reference: T.nilable(String),
            unstructured_remittance_information: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_drawdown_request`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundWireDrawdownRequest::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND_WIRE_DRAWDOWN_REQUEST =
          T.let(
            :inbound_wire_drawdown_request,
            Increase::InboundWireDrawdownRequest::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::InboundWireDrawdownRequest::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
