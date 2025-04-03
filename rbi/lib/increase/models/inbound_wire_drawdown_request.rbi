# typed: strong

module Increase
  module Models
    class InboundWireDrawdownRequest < Increase::Internal::Type::BaseModel
      # The Wire drawdown request identifier.
      sig { returns(String) }
      attr_accessor :id

      # The amount being requested in cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The drawdown request's beneficiary's account number.
      sig { returns(String) }
      attr_accessor :beneficiary_account_number

      # Line 1 of the drawdown request's beneficiary's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line1

      # Line 2 of the drawdown request's beneficiary's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line2

      # Line 3 of the drawdown request's beneficiary's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_address_line3

      # The drawdown request's beneficiary's name.
      sig { returns(T.nilable(String)) }
      attr_accessor :beneficiary_name

      # The drawdown request's beneficiary's routing number.
      sig { returns(String) }
      attr_accessor :beneficiary_routing_number

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the inbound wire drawdown requested was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #   requested. Will always be "USD".
      sig { returns(String) }
      attr_accessor :currency

      # A message from the drawdown request's originator.
      sig { returns(T.nilable(String)) }
      attr_accessor :message_to_recipient

      # The drawdown request's originator's account number.
      sig { returns(String) }
      attr_accessor :originator_account_number

      # Line 1 of the drawdown request's originator's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line1

      # Line 2 of the drawdown request's originator's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line2

      # Line 3 of the drawdown request's originator's address.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_address_line3

      # The drawdown request's originator's name.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_name

      # The drawdown request's originator's routing number.
      sig { returns(String) }
      attr_accessor :originator_routing_number

      # Line 1 of the information conveyed from the originator of the message to the
      #   beneficiary.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information_line1

      # Line 2 of the information conveyed from the originator of the message to the
      #   beneficiary.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information_line2

      # Line 3 of the information conveyed from the originator of the message to the
      #   beneficiary.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information_line3

      # Line 4 of the information conveyed from the originator of the message to the
      #   beneficiary.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_to_beneficiary_information_line4

      # The Account Number from which the recipient of this request is being requested
      #   to send funds.
      sig { returns(String) }
      attr_accessor :recipient_account_number_id

      # A constant representing the object's type. For this resource it will always be
      #   `inbound_wire_drawdown_request`.
      sig { returns(Increase::Models::InboundWireDrawdownRequest::Type::TaggedSymbol) }
      attr_accessor :type

      # Inbound wire drawdown requests are requests from someone else to send them a
      #   wire. This feature is in beta; reach out to
      #   [support@increase.com](mailto:support@increase.com) to learn more.
      sig do
        params(
          id: String,
          amount: Integer,
          beneficiary_account_number: String,
          beneficiary_address_line1: T.nilable(String),
          beneficiary_address_line2: T.nilable(String),
          beneficiary_address_line3: T.nilable(String),
          beneficiary_name: T.nilable(String),
          beneficiary_routing_number: String,
          created_at: Time,
          currency: String,
          message_to_recipient: T.nilable(String),
          originator_account_number: String,
          originator_address_line1: T.nilable(String),
          originator_address_line2: T.nilable(String),
          originator_address_line3: T.nilable(String),
          originator_name: T.nilable(String),
          originator_routing_number: String,
          originator_to_beneficiary_information_line1: T.nilable(String),
          originator_to_beneficiary_information_line2: T.nilable(String),
          originator_to_beneficiary_information_line3: T.nilable(String),
          originator_to_beneficiary_information_line4: T.nilable(String),
          recipient_account_number_id: String,
          type: Increase::Models::InboundWireDrawdownRequest::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        amount:,
        beneficiary_account_number:,
        beneficiary_address_line1:,
        beneficiary_address_line2:,
        beneficiary_address_line3:,
        beneficiary_name:,
        beneficiary_routing_number:,
        created_at:,
        currency:,
        message_to_recipient:,
        originator_account_number:,
        originator_address_line1:,
        originator_address_line2:,
        originator_address_line3:,
        originator_name:,
        originator_routing_number:,
        originator_to_beneficiary_information_line1:,
        originator_to_beneficiary_information_line2:,
        originator_to_beneficiary_information_line3:,
        originator_to_beneficiary_information_line4:,
        recipient_account_number_id:,
        type:
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              amount: Integer,
              beneficiary_account_number: String,
              beneficiary_address_line1: T.nilable(String),
              beneficiary_address_line2: T.nilable(String),
              beneficiary_address_line3: T.nilable(String),
              beneficiary_name: T.nilable(String),
              beneficiary_routing_number: String,
              created_at: Time,
              currency: String,
              message_to_recipient: T.nilable(String),
              originator_account_number: String,
              originator_address_line1: T.nilable(String),
              originator_address_line2: T.nilable(String),
              originator_address_line3: T.nilable(String),
              originator_name: T.nilable(String),
              originator_routing_number: String,
              originator_to_beneficiary_information_line1: T.nilable(String),
              originator_to_beneficiary_information_line2: T.nilable(String),
              originator_to_beneficiary_information_line3: T.nilable(String),
              originator_to_beneficiary_information_line4: T.nilable(String),
              recipient_account_number_id: String,
              type: Increase::Models::InboundWireDrawdownRequest::Type::TaggedSymbol
            }
          )
      end
      def to_hash
      end

      # A constant representing the object's type. For this resource it will always be
      #   `inbound_wire_drawdown_request`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundWireDrawdownRequest::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::InboundWireDrawdownRequest::Type::TaggedSymbol) }

        INBOUND_WIRE_DRAWDOWN_REQUEST =
          T.let(:inbound_wire_drawdown_request, Increase::Models::InboundWireDrawdownRequest::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::InboundWireDrawdownRequest::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
