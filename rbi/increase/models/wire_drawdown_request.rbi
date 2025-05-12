# typed: strong

module Increase
  module Models
    class WireDrawdownRequest < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::WireDrawdownRequest, Increase::Internal::AnyHash)
        end

      # The Wire drawdown request identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account Number to which the recipient of this request is being requested to
      # send funds.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The amount being requested in cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the wire drawdown request was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      # requested. Will always be "USD".
      sig { returns(String) }
      attr_accessor :currency

      # If the recipient fulfills the drawdown request by sending funds, then this will
      # be the identifier of the corresponding Transaction.
      sig { returns(T.nilable(String)) }
      attr_accessor :fulfillment_inbound_wire_transfer_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The message the recipient will see as part of the drawdown request.
      sig { returns(String) }
      attr_accessor :message_to_recipient

      # The originator's address line 1.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line1

      # The originator's address line 2.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line2

      # The originator's address line 3.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line3

      # The originator's name.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_name

      # The drawdown request's recipient's account number.
      sig { returns(String) }
      attr_accessor :recipient_account_number

      # Line 1 of the drawdown request's recipient's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient_address_line1

      # Line 2 of the drawdown request's recipient's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient_address_line2

      # Line 3 of the drawdown request's recipient's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient_address_line3

      # The drawdown request's recipient's name.
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient_name

      # The drawdown request's recipient's routing number.
      sig { returns(String) }
      attr_accessor :recipient_routing_number

      # The lifecycle status of the drawdown request.
      sig { returns(Increase::WireDrawdownRequest::Status::TaggedSymbol) }
      attr_accessor :status

      # After the drawdown request is submitted to Fedwire, this will contain
      # supplemental details.
      sig { returns(T.nilable(Increase::WireDrawdownRequest::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission:
            T.nilable(Increase::WireDrawdownRequest::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # A constant representing the object's type. For this resource it will always be
      # `wire_drawdown_request`.
      sig { returns(Increase::WireDrawdownRequest::Type::TaggedSymbol) }
      attr_accessor :type

      # Wire drawdown requests enable you to request that someone else send you a wire.
      # This feature is in beta; reach out to
      # [support@increase.com](mailto:support@increase.com) to learn more.
      sig do
        params(
          id: String,
          account_number_id: String,
          amount: Integer,
          created_at: Time,
          currency: String,
          fulfillment_inbound_wire_transfer_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          message_to_recipient: String,
          originator_address_line1: T.nilable(String),
          originator_address_line2: T.nilable(String),
          originator_address_line3: T.nilable(String),
          originator_name: T.nilable(String),
          recipient_account_number: String,
          recipient_address_line1: T.nilable(String),
          recipient_address_line2: T.nilable(String),
          recipient_address_line3: T.nilable(String),
          recipient_name: T.nilable(String),
          recipient_routing_number: String,
          status: Increase::WireDrawdownRequest::Status::OrSymbol,
          submission:
            T.nilable(Increase::WireDrawdownRequest::Submission::OrHash),
          type: Increase::WireDrawdownRequest::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Wire drawdown request identifier.
        id:,
        # The Account Number to which the recipient of this request is being requested to
        # send funds.
        account_number_id:,
        # The amount being requested in cents.
        amount:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the wire drawdown request was created.
        created_at:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        # requested. Will always be "USD".
        currency:,
        # If the recipient fulfills the drawdown request by sending funds, then this will
        # be the identifier of the corresponding Transaction.
        fulfillment_inbound_wire_transfer_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The message the recipient will see as part of the drawdown request.
        message_to_recipient:,
        # The originator's address line 1.
        originator_address_line1:,
        # The originator's address line 2.
        originator_address_line2:,
        # The originator's address line 3.
        originator_address_line3:,
        # The originator's name.
        originator_name:,
        # The drawdown request's recipient's account number.
        recipient_account_number:,
        # Line 1 of the drawdown request's recipient's address.
        recipient_address_line1:,
        # Line 2 of the drawdown request's recipient's address.
        recipient_address_line2:,
        # Line 3 of the drawdown request's recipient's address.
        recipient_address_line3:,
        # The drawdown request's recipient's name.
        recipient_name:,
        # The drawdown request's recipient's routing number.
        recipient_routing_number:,
        # The lifecycle status of the drawdown request.
        status:,
        # After the drawdown request is submitted to Fedwire, this will contain
        # supplemental details.
        submission:,
        # A constant representing the object's type. For this resource it will always be
        # `wire_drawdown_request`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_number_id: String,
            amount: Integer,
            created_at: Time,
            currency: String,
            fulfillment_inbound_wire_transfer_id: T.nilable(String),
            idempotency_key: T.nilable(String),
            message_to_recipient: String,
            originator_address_line1: T.nilable(String),
            originator_address_line2: T.nilable(String),
            originator_address_line3: T.nilable(String),
            originator_name: T.nilable(String),
            recipient_account_number: String,
            recipient_address_line1: T.nilable(String),
            recipient_address_line2: T.nilable(String),
            recipient_address_line3: T.nilable(String),
            recipient_name: T.nilable(String),
            recipient_routing_number: String,
            status: Increase::WireDrawdownRequest::Status::TaggedSymbol,
            submission: T.nilable(Increase::WireDrawdownRequest::Submission),
            type: Increase::WireDrawdownRequest::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The lifecycle status of the drawdown request.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::WireDrawdownRequest::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The drawdown request is queued to be submitted to Fedwire.
        PENDING_SUBMISSION =
          T.let(
            :pending_submission,
            Increase::WireDrawdownRequest::Status::TaggedSymbol
          )

        # The drawdown request has been sent and the recipient should respond in some way.
        PENDING_RESPONSE =
          T.let(
            :pending_response,
            Increase::WireDrawdownRequest::Status::TaggedSymbol
          )

        # The drawdown request has been fulfilled by the recipient.
        FULFILLED =
          T.let(:fulfilled, Increase::WireDrawdownRequest::Status::TaggedSymbol)

        # The drawdown request has been refused by the recipient.
        REFUSED =
          T.let(:refused, Increase::WireDrawdownRequest::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::WireDrawdownRequest::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireDrawdownRequest::Submission,
              Increase::Internal::AnyHash
            )
          end

        # The input message accountability data (IMAD) uniquely identifying the submission
        # with Fedwire.
        sig { returns(String) }
        attr_accessor :input_message_accountability_data

        # After the drawdown request is submitted to Fedwire, this will contain
        # supplemental details.
        sig do
          params(input_message_accountability_data: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The input message accountability data (IMAD) uniquely identifying the submission
          # with Fedwire.
          input_message_accountability_data:
        )
        end

        sig { override.returns({ input_message_accountability_data: String }) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `wire_drawdown_request`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::WireDrawdownRequest::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WIRE_DRAWDOWN_REQUEST =
          T.let(
            :wire_drawdown_request,
            Increase::WireDrawdownRequest::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::WireDrawdownRequest::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
