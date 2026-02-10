# typed: strong

module Increase
  module Models
    class InboundWireTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::InboundWireTransfer, Increase::Internal::AnyHash)
        end

      # The inbound wire transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # If the transfer is accepted, this will contain details of the acceptance.
      sig { returns(T.nilable(Increase::InboundWireTransfer::Acceptance)) }
      attr_reader :acceptance

      sig do
        params(
          acceptance:
            T.nilable(Increase::InboundWireTransfer::Acceptance::OrHash)
        ).void
      end
      attr_writer :acceptance

      # The Account to which the transfer belongs.
      sig { returns(String) }
      attr_accessor :account_id

      # The identifier of the Account Number to which this transfer was sent.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the inbound wire transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

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

      # An Increase-constructed description of the transfer.
      sig { returns(String) }
      attr_accessor :description

      # A free-form reference string set by the sender, to help identify the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :end_to_end_identification

      # A unique identifier available to the originating and receiving banks, commonly
      # abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
      # service and is helpful when debugging wires with the originating bank.
      sig { returns(T.nilable(String)) }
      attr_accessor :input_message_accountability_data

      # The American Banking Association (ABA) routing number of the bank that sent the
      # wire.
      sig { returns(T.nilable(String)) }
      attr_accessor :instructing_agent_routing_number

      # The sending bank's identifier for the wire transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :instruction_identification

      # If the transfer is reversed, this will contain details of the reversal.
      sig { returns(T.nilable(Increase::InboundWireTransfer::Reversal)) }
      attr_reader :reversal

      sig do
        params(
          reversal: T.nilable(Increase::InboundWireTransfer::Reversal::OrHash)
        ).void
      end
      attr_writer :reversal

      # The status of the transfer.
      sig { returns(Increase::InboundWireTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_transfer`.
      sig { returns(Increase::InboundWireTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # The Unique End-to-end Transaction Reference
      # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
      # of the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :unique_end_to_end_transaction_reference

      # A free-form message set by the sender.
      sig { returns(T.nilable(String)) }
      attr_accessor :unstructured_remittance_information

      # The wire drawdown request the inbound wire transfer is fulfilling.
      sig { returns(T.nilable(String)) }
      attr_accessor :wire_drawdown_request_id

      # An Inbound Wire Transfer is a wire transfer initiated outside of Increase to
      # your account.
      sig do
        params(
          id: String,
          acceptance:
            T.nilable(Increase::InboundWireTransfer::Acceptance::OrHash),
          account_id: String,
          account_number_id: String,
          amount: Integer,
          created_at: Time,
          creditor_address_line1: T.nilable(String),
          creditor_address_line2: T.nilable(String),
          creditor_address_line3: T.nilable(String),
          creditor_name: T.nilable(String),
          debtor_address_line1: T.nilable(String),
          debtor_address_line2: T.nilable(String),
          debtor_address_line3: T.nilable(String),
          debtor_name: T.nilable(String),
          description: String,
          end_to_end_identification: T.nilable(String),
          input_message_accountability_data: T.nilable(String),
          instructing_agent_routing_number: T.nilable(String),
          instruction_identification: T.nilable(String),
          reversal: T.nilable(Increase::InboundWireTransfer::Reversal::OrHash),
          status: Increase::InboundWireTransfer::Status::OrSymbol,
          type: Increase::InboundWireTransfer::Type::OrSymbol,
          unique_end_to_end_transaction_reference: T.nilable(String),
          unstructured_remittance_information: T.nilable(String),
          wire_drawdown_request_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The inbound wire transfer's identifier.
        id:,
        # If the transfer is accepted, this will contain details of the acceptance.
        acceptance:,
        # The Account to which the transfer belongs.
        account_id:,
        # The identifier of the Account Number to which this transfer was sent.
        account_number_id:,
        # The amount in USD cents.
        amount:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the inbound wire transfer was created.
        created_at:,
        # A free-form address field set by the sender.
        creditor_address_line1:,
        # A free-form address field set by the sender.
        creditor_address_line2:,
        # A free-form address field set by the sender.
        creditor_address_line3:,
        # A name set by the sender.
        creditor_name:,
        # A free-form address field set by the sender.
        debtor_address_line1:,
        # A free-form address field set by the sender.
        debtor_address_line2:,
        # A free-form address field set by the sender.
        debtor_address_line3:,
        # A name set by the sender.
        debtor_name:,
        # An Increase-constructed description of the transfer.
        description:,
        # A free-form reference string set by the sender, to help identify the transfer.
        end_to_end_identification:,
        # A unique identifier available to the originating and receiving banks, commonly
        # abbreviated as IMAD. It is created when the wire is submitted to the Fedwire
        # service and is helpful when debugging wires with the originating bank.
        input_message_accountability_data:,
        # The American Banking Association (ABA) routing number of the bank that sent the
        # wire.
        instructing_agent_routing_number:,
        # The sending bank's identifier for the wire transfer.
        instruction_identification:,
        # If the transfer is reversed, this will contain details of the reversal.
        reversal:,
        # The status of the transfer.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `inbound_wire_transfer`.
        type:,
        # The Unique End-to-end Transaction Reference
        # ([UETR](https://www.swift.com/payments/what-unique-end-end-transaction-reference-uetr))
        # of the transfer.
        unique_end_to_end_transaction_reference:,
        # A free-form message set by the sender.
        unstructured_remittance_information:,
        # The wire drawdown request the inbound wire transfer is fulfilling.
        wire_drawdown_request_id:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            acceptance: T.nilable(Increase::InboundWireTransfer::Acceptance),
            account_id: String,
            account_number_id: String,
            amount: Integer,
            created_at: Time,
            creditor_address_line1: T.nilable(String),
            creditor_address_line2: T.nilable(String),
            creditor_address_line3: T.nilable(String),
            creditor_name: T.nilable(String),
            debtor_address_line1: T.nilable(String),
            debtor_address_line2: T.nilable(String),
            debtor_address_line3: T.nilable(String),
            debtor_name: T.nilable(String),
            description: String,
            end_to_end_identification: T.nilable(String),
            input_message_accountability_data: T.nilable(String),
            instructing_agent_routing_number: T.nilable(String),
            instruction_identification: T.nilable(String),
            reversal: T.nilable(Increase::InboundWireTransfer::Reversal),
            status: Increase::InboundWireTransfer::Status::TaggedSymbol,
            type: Increase::InboundWireTransfer::Type::TaggedSymbol,
            unique_end_to_end_transaction_reference: T.nilable(String),
            unstructured_remittance_information: T.nilable(String),
            wire_drawdown_request_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Acceptance < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundWireTransfer::Acceptance,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was accepted.
        sig { returns(Time) }
        attr_accessor :accepted_at

        # The identifier of the transaction for the accepted transfer.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If the transfer is accepted, this will contain details of the acceptance.
        sig do
          params(accepted_at: Time, transaction_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was accepted.
          accepted_at:,
          # The identifier of the transaction for the accepted transfer.
          transaction_id:
        )
        end

        sig { override.returns({ accepted_at: Time, transaction_id: String }) }
        def to_hash
        end
      end

      class Reversal < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundWireTransfer::Reversal,
              Increase::Internal::AnyHash
            )
          end

        # The reason for the reversal.
        sig do
          returns(Increase::InboundWireTransfer::Reversal::Reason::TaggedSymbol)
        end
        attr_accessor :reason

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was reversed.
        sig { returns(Time) }
        attr_accessor :reversed_at

        # If the transfer is reversed, this will contain details of the reversal.
        sig do
          params(
            reason: Increase::InboundWireTransfer::Reversal::Reason::OrSymbol,
            reversed_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The reason for the reversal.
          reason:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was reversed.
          reversed_at:
        )
        end

        sig do
          override.returns(
            {
              reason:
                Increase::InboundWireTransfer::Reversal::Reason::TaggedSymbol,
              reversed_at: Time
            }
          )
        end
        def to_hash
        end

        # The reason for the reversal.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::InboundWireTransfer::Reversal::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The inbound wire transfer was a duplicate.
          DUPLICATE =
            T.let(
              :duplicate,
              Increase::InboundWireTransfer::Reversal::Reason::TaggedSymbol
            )

          # The recipient of the wire transfer requested the funds be returned to the sender.
          CREDITOR_REQUEST =
            T.let(
              :creditor_request,
              Increase::InboundWireTransfer::Reversal::Reason::TaggedSymbol
            )

          # The account cannot currently receive inbound wires.
          TRANSACTION_FORBIDDEN =
            T.let(
              :transaction_forbidden,
              Increase::InboundWireTransfer::Reversal::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundWireTransfer::Reversal::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::InboundWireTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Inbound Wire Transfer is awaiting action, will transition automatically if no action is taken.
        PENDING =
          T.let(:pending, Increase::InboundWireTransfer::Status::TaggedSymbol)

        # The Inbound Wire Transfer is accepted.
        ACCEPTED =
          T.let(:accepted, Increase::InboundWireTransfer::Status::TaggedSymbol)

        # The Inbound Wire Transfer was declined.
        DECLINED =
          T.let(:declined, Increase::InboundWireTransfer::Status::TaggedSymbol)

        # The Inbound Wire Transfer was reversed.
        REVERSED =
          T.let(:reversed, Increase::InboundWireTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::InboundWireTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_wire_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::InboundWireTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND_WIRE_TRANSFER =
          T.let(
            :inbound_wire_transfer,
            Increase::InboundWireTransfer::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::InboundWireTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
