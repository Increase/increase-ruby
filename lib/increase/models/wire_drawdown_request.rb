# frozen_string_literal: true

module Increase
  module Models
    class WireDrawdownRequest < BaseModel
      # @!attribute [rw] id
      #   The Wire drawdown request identifier.
      #   @return [String]
      required :id, String

      # @!attribute [rw] account_number_id
      #   The Account Number to which the recipient of this request is being requested to send funds.
      #   @return [String]
      required :account_number_id, String

      # @!attribute [rw] amount
      #   The amount being requested in cents.
      #   @return [Integer]
      required :amount, Integer

      # @!attribute [rw] currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being requested. Will always be "USD".
      #   @return [String]
      required :currency, String

      # @!attribute [rw] fulfillment_inbound_wire_transfer_id
      #   If the recipient fulfills the drawdown request by sending funds, then this will be the identifier of the corresponding Transaction.
      #   @return [String]
      required :fulfillment_inbound_wire_transfer_id, String

      # @!attribute [rw] idempotency_key
      #   The idempotency key you chose for this object. This value is unique across Increase and is used to ensure that a request is only processed once. Learn more about [idempotency](https://increase.com/documentation/idempotency-keys).
      #   @return [String]
      required :idempotency_key, String

      # @!attribute [rw] message_to_recipient
      #   The message the recipient will see as part of the drawdown request.
      #   @return [String]
      required :message_to_recipient, String

      # @!attribute [rw] originator_address_line1
      #   The originator's address line 1.
      #   @return [String]
      required :originator_address_line1, String

      # @!attribute [rw] originator_address_line2
      #   The originator's address line 2.
      #   @return [String]
      required :originator_address_line2, String

      # @!attribute [rw] originator_address_line3
      #   The originator's address line 3.
      #   @return [String]
      required :originator_address_line3, String

      # @!attribute [rw] originator_name
      #   The originator's name.
      #   @return [String]
      required :originator_name, String

      # @!attribute [rw] recipient_account_number
      #   The drawdown request's recipient's account number.
      #   @return [String]
      required :recipient_account_number, String

      # @!attribute [rw] recipient_address_line1
      #   Line 1 of the drawdown request's recipient's address.
      #   @return [String]
      required :recipient_address_line1, String

      # @!attribute [rw] recipient_address_line2
      #   Line 2 of the drawdown request's recipient's address.
      #   @return [String]
      required :recipient_address_line2, String

      # @!attribute [rw] recipient_address_line3
      #   Line 3 of the drawdown request's recipient's address.
      #   @return [String]
      required :recipient_address_line3, String

      # @!attribute [rw] recipient_name
      #   The drawdown request's recipient's name.
      #   @return [String]
      required :recipient_name, String

      # @!attribute [rw] recipient_routing_number
      #   The drawdown request's recipient's routing number.
      #   @return [String]
      required :recipient_routing_number, String

      # @!attribute [rw] status
      #   The lifecycle status of the drawdown request.
      #   @return [Symbol, Increase::Models::WireDrawdownRequest::Status]
      required :status, enum: -> { Increase::Models::WireDrawdownRequest::Status }

      # @!attribute [rw] submission
      #   After the drawdown request is submitted to Fedwire, this will contain supplemental details.
      #   @return [Increase::Models::WireDrawdownRequest::Submission]
      required :submission, -> { Increase::Models::WireDrawdownRequest::Submission }

      # @!attribute [rw] type
      #   A constant representing the object's type. For this resource it will always be `wire_drawdown_request`.
      #   @return [Symbol, Increase::Models::WireDrawdownRequest::Type]
      required :type, enum: -> { Increase::Models::WireDrawdownRequest::Type }

      # The lifecycle status of the drawdown request.
      class Status < Increase::Enum
        # The drawdown request is queued to be submitted to Fedwire.
        PENDING_SUBMISSION = :pending_submission

        # The drawdown request has been sent and the recipient should respond in some way.
        PENDING_RESPONSE = :pending_response

        # The drawdown request has been fulfilled by the recipient.
        FULFILLED = :fulfilled

        # The drawdown request has been refused by the recipient.
        REFUSED = :refused
      end

      class Submission < BaseModel
        # @!attribute [rw] input_message_accountability_data
        #   The input message accountability data (IMAD) uniquely identifying the submission with Fedwire.
        #   @return [String]
        required :input_message_accountability_data, String

        # Create a new instance of Submission from a Hash of raw data.
        #
        # @overload initialize(input_message_accountability_data: nil)
        # @param input_message_accountability_data [String] The input message accountability data (IMAD) uniquely identifying the submission
        #   with Fedwire.
        def initialize(data = {})
          super
        end
      end

      # A constant representing the object's type. For this resource it will always be `wire_drawdown_request`.
      class Type < Increase::Enum
        WIRE_DRAWDOWN_REQUEST = :wire_drawdown_request
      end

      # Create a new instance of WireDrawdownRequest from a Hash of raw data.
      #
      # @overload initialize(id: nil, account_number_id: nil, amount: nil, currency: nil, fulfillment_inbound_wire_transfer_id: nil, idempotency_key: nil, message_to_recipient: nil, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, recipient_account_number: nil, recipient_address_line1: nil, recipient_address_line2: nil, recipient_address_line3: nil, recipient_name: nil, recipient_routing_number: nil, status: nil, submission: nil, type: nil)
      # @param id [String] The Wire drawdown request identifier.
      # @param account_number_id [String] The Account Number to which the recipient of this request is being requested to
      #   send funds.
      # @param amount [Integer] The amount being requested in cents.
      # @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #   requested. Will always be "USD".
      # @param fulfillment_inbound_wire_transfer_id [String] If the recipient fulfills the drawdown request by sending funds, then this will
      #   be the identifier of the corresponding Transaction.
      # @param idempotency_key [String] The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      # @param message_to_recipient [String] The message the recipient will see as part of the drawdown request.
      # @param originator_address_line1 [String] The originator's address line 1.
      # @param originator_address_line2 [String] The originator's address line 2.
      # @param originator_address_line3 [String] The originator's address line 3.
      # @param originator_name [String] The originator's name.
      # @param recipient_account_number [String] The drawdown request's recipient's account number.
      # @param recipient_address_line1 [String] Line 1 of the drawdown request's recipient's address.
      # @param recipient_address_line2 [String] Line 2 of the drawdown request's recipient's address.
      # @param recipient_address_line3 [String] Line 3 of the drawdown request's recipient's address.
      # @param recipient_name [String] The drawdown request's recipient's name.
      # @param recipient_routing_number [String] The drawdown request's recipient's routing number.
      # @param status [String] The lifecycle status of the drawdown request.
      # @param submission [Object] After the drawdown request is submitted to Fedwire, this will contain
      #   supplemental details.
      # @param type [String] A constant representing the object's type. For this resource it will always be
      #   `wire_drawdown_request`.
      def initialize(data = {})
        super
      end
    end
  end
end
