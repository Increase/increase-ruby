# typed: strong

module Increase
  module Models
    class InboundWireTransfer < Increase::Internal::Type::BaseModel
      # The inbound wire transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account to which the transfer belongs.
      sig { returns(String) }
      attr_accessor :account_id

      # The identifier of the Account Number to which this transfer was sent.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line1

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line2

      # A free-form address field set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line3

      # A name set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_name

      # A free-form reference string set by the sender, to help identify the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_reference

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the inbound wire transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # An Increase-constructed description of the transfer.
      sig { returns(String) }
      attr_accessor :description

      # A unique identifier available to the originating and receiving banks, commonly
      # abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
      # service and is helpful when debugging wires with the originating bank.
      sig { returns(T.nilable(String)) }
      attr_accessor :input_message_accountability_data

      # The address of the wire originator, set by the sending bank.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line1

      # The address of the wire originator, set by the sending bank.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line2

      # The address of the wire originator, set by the sending bank.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line3

      # The originator of the wire, set by the sending bank.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_name

      # The American Banking Association (ABA) routing number of the bank originating
      # the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_routing_number

      # An Increase-created concatenation of the Originator-to-Beneficiary lines.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information

      # A free-form message set by the wire originator.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information_line1

      # A free-form message set by the wire originator.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information_line2

      # A free-form message set by the wire originator.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information_line3

      # A free-form message set by the wire originator.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information_line4

      # Information about the reversal of the inbound wire transfer if it has been
      # reversed.
      sig { returns(T.nilable(Increase::Models::InboundWireTransfer::Reversal)) }
      attr_reader :reversal

      sig do
        params(
          reversal: T.nilable(T.any(Increase::Models::InboundWireTransfer::Reversal, Increase::Internal::AnyHash))
        )
          .void
      end
      attr_writer :reversal

      # The sending bank's reference number for the wire transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :sender_reference

      # The status of the transfer.
      sig { returns(Increase::Models::InboundWireTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_transfer`.
      sig { returns(Increase::Models::InboundWireTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # An Inbound Wire Transfer is a wire transfer initiated outside of Increase to
      # your account.
      sig do
        params(
          id: String,
          account_id: String,
          account_number_id: String,
          amount: Integer,
          beneficiary_address_line1: T.nilable(String),
          beneficiary_address_line2: T.nilable(String),
          beneficiary_address_line3: T.nilable(String),
          beneficiary_name: T.nilable(String),
          beneficiary_reference: T.nilable(String),
          created_at: Time,
          description: String,
          input_message_accountability_data: T.nilable(String),
          originator_address_line1: T.nilable(String),
          originator_address_line2: T.nilable(String),
          originator_address_line3: T.nilable(String),
          originator_name: T.nilable(String),
          originator_routing_number: T.nilable(String),
          originator_to_beneficiary_information: T.nilable(String),
          originator_to_beneficiary_information_line1: T.nilable(String),
          originator_to_beneficiary_information_line2: T.nilable(String),
          originator_to_beneficiary_information_line3: T.nilable(String),
          originator_to_beneficiary_information_line4: T.nilable(String),
          reversal: T.nilable(T.any(Increase::Models::InboundWireTransfer::Reversal, Increase::Internal::AnyHash)),
          sender_reference: T.nilable(String),
          status: Increase::Models::InboundWireTransfer::Status::OrSymbol,
          type: Increase::Models::InboundWireTransfer::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        # The inbound wire transfer's identifier.
        id:,
        # The Account to which the transfer belongs.
        account_id:,
        # The identifier of the Account Number to which this transfer was sent.
        account_number_id:,
        # The amount in USD cents.
        amount:,
        # A free-form address field set by the sender.
        beneficiary_address_line1:,
        # A free-form address field set by the sender.
        beneficiary_address_line2:,
        # A free-form address field set by the sender.
        beneficiary_address_line3:,
        # A name set by the sender.
        beneficiary_name:,
        # A free-form reference string set by the sender, to help identify the transfer.
        beneficiary_reference:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the inbound wire transfer was created.
        created_at:,
        # An Increase-constructed description of the transfer.
        description:,
        # A unique identifier available to the originating and receiving banks, commonly
        # abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
        # service and is helpful when debugging wires with the originating bank.
        input_message_accountability_data:,
        # The address of the wire originator, set by the sending bank.
        originator_address_line1:,
        # The address of the wire originator, set by the sending bank.
        originator_address_line2:,
        # The address of the wire originator, set by the sending bank.
        originator_address_line3:,
        # The originator of the wire, set by the sending bank.
        originator_name:,
        # The American Banking Association (ABA) routing number of the bank originating
        # the transfer.
        originator_routing_number:,
        # An Increase-created concatenation of the Originator-to-Beneficiary lines.
        originator_to_beneficiary_information:,
        # A free-form message set by the wire originator.
        originator_to_beneficiary_information_line1:,
        # A free-form message set by the wire originator.
        originator_to_beneficiary_information_line2:,
        # A free-form message set by the wire originator.
        originator_to_beneficiary_information_line3:,
        # A free-form message set by the wire originator.
        originator_to_beneficiary_information_line4:,
        # Information about the reversal of the inbound wire transfer if it has been
        # reversed.
        reversal:,
        # The sending bank's reference number for the wire transfer.
        sender_reference:,
        # The status of the transfer.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `inbound_wire_transfer`.
        type:
      ); end
      sig do
        override
          .returns(
            {
              id: String,
              account_id: String,
              account_number_id: String,
              amount: Integer,
              beneficiary_address_line1: T.nilable(String),
              beneficiary_address_line2: T.nilable(String),
              beneficiary_address_line3: T.nilable(String),
              beneficiary_name: T.nilable(String),
              beneficiary_reference: T.nilable(String),
              created_at: Time,
              description: String,
              input_message_accountability_data: T.nilable(String),
              originator_address_line1: T.nilable(String),
              originator_address_line2: T.nilable(String),
              originator_address_line3: T.nilable(String),
              originator_name: T.nilable(String),
              originator_routing_number: T.nilable(String),
              originator_to_beneficiary_information: T.nilable(String),
              originator_to_beneficiary_information_line1: T.nilable(String),
              originator_to_beneficiary_information_line2: T.nilable(String),
              originator_to_beneficiary_information_line3: T.nilable(String),
              originator_to_beneficiary_information_line4: T.nilable(String),
              reversal: T.nilable(Increase::Models::InboundWireTransfer::Reversal),
              sender_reference: T.nilable(String),
              status: Increase::Models::InboundWireTransfer::Status::TaggedSymbol,
              type: Increase::Models::InboundWireTransfer::Type::TaggedSymbol
            }
          )
      end
      def to_hash; end

      class Reversal < Increase::Internal::Type::BaseModel
        # The reason for the reversal.
        sig { returns(Increase::Models::InboundWireTransfer::Reversal::Reason::TaggedSymbol) }
        attr_accessor :reason

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was reversed.
        sig { returns(Time) }
        attr_accessor :reversed_at

        # Information about the reversal of the inbound wire transfer if it has been
        # reversed.
        sig do
          params(reason: Increase::Models::InboundWireTransfer::Reversal::Reason::OrSymbol, reversed_at: Time)
            .returns(T.attached_class)
        end
        def self.new(
          # The reason for the reversal.
          reason:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was reversed.
          reversed_at:
        ); end
        sig do
          override
            .returns(
              {reason: Increase::Models::InboundWireTransfer::Reversal::Reason::TaggedSymbol, reversed_at: Time}
            )
        end
        def to_hash; end

        # The reason for the reversal.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundWireTransfer::Reversal::Reason) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The inbound wire transfer was a duplicate.
          DUPLICATE = T.let(:duplicate, Increase::Models::InboundWireTransfer::Reversal::Reason::TaggedSymbol)

          # The recipient of the wire transfer requested the funds be returned to the sender.
          CREDITOR_REQUEST =
            T.let(:creditor_request, Increase::Models::InboundWireTransfer::Reversal::Reason::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::InboundWireTransfer::Reversal::Reason::TaggedSymbol]) }
          def self.values; end
        end
      end

      # The status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundWireTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Inbound Wire Transfer is awaiting action, will transition automatically if no action is taken.
        PENDING = T.let(:pending, Increase::Models::InboundWireTransfer::Status::TaggedSymbol)

        # The Inbound Wire Transfer is accepted.
        ACCEPTED = T.let(:accepted, Increase::Models::InboundWireTransfer::Status::TaggedSymbol)

        # The Inbound Wire Transfer was declined.
        DECLINED = T.let(:declined, Increase::Models::InboundWireTransfer::Status::TaggedSymbol)

        # The Inbound Wire Transfer was reversed.
        REVERSED = T.let(:reversed, Increase::Models::InboundWireTransfer::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::InboundWireTransfer::Status::TaggedSymbol]) }
        def self.values; end
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundWireTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND_WIRE_TRANSFER =
          T.let(:inbound_wire_transfer, Increase::Models::InboundWireTransfer::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::InboundWireTransfer::Type::TaggedSymbol]) }
        def self.values; end
      end
    end
  end
end
