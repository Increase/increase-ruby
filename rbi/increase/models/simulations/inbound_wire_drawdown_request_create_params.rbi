# typed: strong

module Increase
  module Models
    module Simulations
      class InboundWireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The amount being requested in cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The drawdown request's beneficiary's account number.
        sig { returns(String) }
        attr_accessor :beneficiary_account_number

        # The drawdown request's beneficiary's routing number.
        sig { returns(String) }
        attr_accessor :beneficiary_routing_number

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        # requested. Will always be "USD".
        sig { returns(String) }
        attr_accessor :currency

        # A message from the drawdown request's originator.
        sig { returns(String) }
        attr_accessor :message_to_recipient

        # The drawdown request's originator's account number.
        sig { returns(String) }
        attr_accessor :originator_account_number

        # The drawdown request's originator's routing number.
        sig { returns(String) }
        attr_accessor :originator_routing_number

        # The Account Number to which the recipient of this request is being requested to
        # send funds from.
        sig { returns(String) }
        attr_accessor :recipient_account_number_id

        # Line 1 of the drawdown request's beneficiary's address.
        sig { returns(T.nilable(String)) }
        attr_reader :beneficiary_address_line1

        sig { params(beneficiary_address_line1: String).void }
        attr_writer :beneficiary_address_line1

        # Line 2 of the drawdown request's beneficiary's address.
        sig { returns(T.nilable(String)) }
        attr_reader :beneficiary_address_line2

        sig { params(beneficiary_address_line2: String).void }
        attr_writer :beneficiary_address_line2

        # Line 3 of the drawdown request's beneficiary's address.
        sig { returns(T.nilable(String)) }
        attr_reader :beneficiary_address_line3

        sig { params(beneficiary_address_line3: String).void }
        attr_writer :beneficiary_address_line3

        # The drawdown request's beneficiary's name.
        sig { returns(T.nilable(String)) }
        attr_reader :beneficiary_name

        sig { params(beneficiary_name: String).void }
        attr_writer :beneficiary_name

        # Line 1 of the drawdown request's originator's address.
        sig { returns(T.nilable(String)) }
        attr_reader :originator_address_line1

        sig { params(originator_address_line1: String).void }
        attr_writer :originator_address_line1

        # Line 2 of the drawdown request's originator's address.
        sig { returns(T.nilable(String)) }
        attr_reader :originator_address_line2

        sig { params(originator_address_line2: String).void }
        attr_writer :originator_address_line2

        # Line 3 of the drawdown request's originator's address.
        sig { returns(T.nilable(String)) }
        attr_reader :originator_address_line3

        sig { params(originator_address_line3: String).void }
        attr_writer :originator_address_line3

        # The drawdown request's originator's name.
        sig { returns(T.nilable(String)) }
        attr_reader :originator_name

        sig { params(originator_name: String).void }
        attr_writer :originator_name

        # Line 1 of the information conveyed from the originator of the message to the
        # beneficiary.
        sig { returns(T.nilable(String)) }
        attr_reader :originator_to_beneficiary_information_line1

        sig { params(originator_to_beneficiary_information_line1: String).void }
        attr_writer :originator_to_beneficiary_information_line1

        # Line 2 of the information conveyed from the originator of the message to the
        # beneficiary.
        sig { returns(T.nilable(String)) }
        attr_reader :originator_to_beneficiary_information_line2

        sig { params(originator_to_beneficiary_information_line2: String).void }
        attr_writer :originator_to_beneficiary_information_line2

        # Line 3 of the information conveyed from the originator of the message to the
        # beneficiary.
        sig { returns(T.nilable(String)) }
        attr_reader :originator_to_beneficiary_information_line3

        sig { params(originator_to_beneficiary_information_line3: String).void }
        attr_writer :originator_to_beneficiary_information_line3

        # Line 4 of the information conveyed from the originator of the message to the
        # beneficiary.
        sig { returns(T.nilable(String)) }
        attr_reader :originator_to_beneficiary_information_line4

        sig { params(originator_to_beneficiary_information_line4: String).void }
        attr_writer :originator_to_beneficiary_information_line4

        sig do
          params(
            amount: Integer,
            beneficiary_account_number: String,
            beneficiary_routing_number: String,
            currency: String,
            message_to_recipient: String,
            originator_account_number: String,
            originator_routing_number: String,
            recipient_account_number_id: String,
            beneficiary_address_line1: String,
            beneficiary_address_line2: String,
            beneficiary_address_line3: String,
            beneficiary_name: String,
            originator_address_line1: String,
            originator_address_line2: String,
            originator_address_line3: String,
            originator_name: String,
            originator_to_beneficiary_information_line1: String,
            originator_to_beneficiary_information_line2: String,
            originator_to_beneficiary_information_line3: String,
            originator_to_beneficiary_information_line4: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The amount being requested in cents.
          amount:,
          # The drawdown request's beneficiary's account number.
          beneficiary_account_number:,
          # The drawdown request's beneficiary's routing number.
          beneficiary_routing_number:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
          # requested. Will always be "USD".
          currency:,
          # A message from the drawdown request's originator.
          message_to_recipient:,
          # The drawdown request's originator's account number.
          originator_account_number:,
          # The drawdown request's originator's routing number.
          originator_routing_number:,
          # The Account Number to which the recipient of this request is being requested to
          # send funds from.
          recipient_account_number_id:,
          # Line 1 of the drawdown request's beneficiary's address.
          beneficiary_address_line1: nil,
          # Line 2 of the drawdown request's beneficiary's address.
          beneficiary_address_line2: nil,
          # Line 3 of the drawdown request's beneficiary's address.
          beneficiary_address_line3: nil,
          # The drawdown request's beneficiary's name.
          beneficiary_name: nil,
          # Line 1 of the drawdown request's originator's address.
          originator_address_line1: nil,
          # Line 2 of the drawdown request's originator's address.
          originator_address_line2: nil,
          # Line 3 of the drawdown request's originator's address.
          originator_address_line3: nil,
          # The drawdown request's originator's name.
          originator_name: nil,
          # Line 1 of the information conveyed from the originator of the message to the
          # beneficiary.
          originator_to_beneficiary_information_line1: nil,
          # Line 2 of the information conveyed from the originator of the message to the
          # beneficiary.
          originator_to_beneficiary_information_line2: nil,
          # Line 3 of the information conveyed from the originator of the message to the
          # beneficiary.
          originator_to_beneficiary_information_line3: nil,
          # Line 4 of the information conveyed from the originator of the message to the
          # beneficiary.
          originator_to_beneficiary_information_line4: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              amount: Integer,
              beneficiary_account_number: String,
              beneficiary_routing_number: String,
              currency: String,
              message_to_recipient: String,
              originator_account_number: String,
              originator_routing_number: String,
              recipient_account_number_id: String,
              beneficiary_address_line1: String,
              beneficiary_address_line2: String,
              beneficiary_address_line3: String,
              beneficiary_name: String,
              originator_address_line1: String,
              originator_address_line2: String,
              originator_address_line3: String,
              originator_name: String,
              originator_to_beneficiary_information_line1: String,
              originator_to_beneficiary_information_line2: String,
              originator_to_beneficiary_information_line3: String,
              originator_to_beneficiary_information_line4: String,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
