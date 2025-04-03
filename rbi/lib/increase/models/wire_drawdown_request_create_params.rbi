# typed: strong

module Increase
  module Models
    class WireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The Account Number to which the recipient should send funds.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The amount requested from the recipient, in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # A message the recipient will see as part of the request.
      sig { returns(String) }
      attr_accessor :message_to_recipient

      # The drawdown request's recipient's account number.
      sig { returns(String) }
      attr_accessor :recipient_account_number

      # The drawdown request's recipient's name.
      sig { returns(String) }
      attr_accessor :recipient_name

      # The drawdown request's recipient's routing number.
      sig { returns(String) }
      attr_accessor :recipient_routing_number

      # The drawdown request originator's address line 1. This is only necessary if
      #   you're requesting a payment to a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line1

      sig { params(originator_address_line1: String).void }
      attr_writer :originator_address_line1

      # The drawdown request originator's address line 2. This is only necessary if
      #   you're requesting a payment to a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line2

      sig { params(originator_address_line2: String).void }
      attr_writer :originator_address_line2

      # The drawdown request originator's address line 3. This is only necessary if
      #   you're requesting a payment to a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line3

      sig { params(originator_address_line3: String).void }
      attr_writer :originator_address_line3

      # The drawdown request originator's name. This is only necessary if you're
      #   requesting a payment to a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_name

      sig { params(originator_name: String).void }
      attr_writer :originator_name

      # Line 1 of the drawdown request's recipient's address.
      sig { returns(T.nilable(String)) }
      attr_reader :recipient_address_line1

      sig { params(recipient_address_line1: String).void }
      attr_writer :recipient_address_line1

      # Line 2 of the drawdown request's recipient's address.
      sig { returns(T.nilable(String)) }
      attr_reader :recipient_address_line2

      sig { params(recipient_address_line2: String).void }
      attr_writer :recipient_address_line2

      # Line 3 of the drawdown request's recipient's address.
      sig { returns(T.nilable(String)) }
      attr_reader :recipient_address_line3

      sig { params(recipient_address_line3: String).void }
      attr_writer :recipient_address_line3

      sig do
        params(
          account_number_id: String,
          amount: Integer,
          message_to_recipient: String,
          recipient_account_number: String,
          recipient_name: String,
          recipient_routing_number: String,
          originator_address_line1: String,
          originator_address_line2: String,
          originator_address_line3: String,
          originator_name: String,
          recipient_address_line1: String,
          recipient_address_line2: String,
          recipient_address_line3: String,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        account_number_id:,
        amount:,
        message_to_recipient:,
        recipient_account_number:,
        recipient_name:,
        recipient_routing_number:,
        originator_address_line1: nil,
        originator_address_line2: nil,
        originator_address_line3: nil,
        originator_name: nil,
        recipient_address_line1: nil,
        recipient_address_line2: nil,
        recipient_address_line3: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              account_number_id: String,
              amount: Integer,
              message_to_recipient: String,
              recipient_account_number: String,
              recipient_name: String,
              recipient_routing_number: String,
              originator_address_line1: String,
              originator_address_line2: String,
              originator_address_line3: String,
              originator_name: String,
              recipient_address_line1: String,
              recipient_address_line2: String,
              recipient_address_line3: String,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
