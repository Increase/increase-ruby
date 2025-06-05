# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireDrawdownRequests#create
    class WireDrawdownRequest < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Wire drawdown request identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_number_id
      #   The Account Number to which the recipient of this request is being requested to
      #   send funds.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute amount
      #   The amount being requested in cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the wire drawdown request was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #   requested. Will always be "USD".
      #
      #   @return [String]
      required :currency, String

      # @!attribute fulfillment_inbound_wire_transfer_id
      #   If the recipient fulfills the drawdown request by sending funds, then this will
      #   be the identifier of the corresponding Transaction.
      #
      #   @return [String, nil]
      required :fulfillment_inbound_wire_transfer_id, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute message_to_recipient
      #   The message the recipient will see as part of the drawdown request.
      #
      #   @return [String]
      required :message_to_recipient, String

      # @!attribute originator_address_line1
      #   The originator's address line 1.
      #
      #   @return [String, nil]
      required :originator_address_line1, String, nil?: true

      # @!attribute originator_address_line2
      #   The originator's address line 2.
      #
      #   @return [String, nil]
      required :originator_address_line2, String, nil?: true

      # @!attribute originator_address_line3
      #   The originator's address line 3.
      #
      #   @return [String, nil]
      required :originator_address_line3, String, nil?: true

      # @!attribute originator_name
      #   The originator's name.
      #
      #   @return [String, nil]
      required :originator_name, String, nil?: true

      # @!attribute recipient_account_number
      #   The drawdown request's recipient's account number.
      #
      #   @return [String]
      required :recipient_account_number, String

      # @!attribute recipient_address_line1
      #   Line 1 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      required :recipient_address_line1, String, nil?: true

      # @!attribute recipient_address_line2
      #   Line 2 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      required :recipient_address_line2, String, nil?: true

      # @!attribute recipient_address_line3
      #   Line 3 of the drawdown request's recipient's address.
      #
      #   @return [String, nil]
      required :recipient_address_line3, String, nil?: true

      # @!attribute recipient_name
      #   The drawdown request's recipient's name.
      #
      #   @return [String, nil]
      required :recipient_name, String, nil?: true

      # @!attribute recipient_routing_number
      #   The drawdown request's recipient's routing number.
      #
      #   @return [String]
      required :recipient_routing_number, String

      # @!attribute status
      #   The lifecycle status of the drawdown request.
      #
      #   @return [Symbol, Increase::Models::WireDrawdownRequest::Status]
      required :status, enum: -> { Increase::WireDrawdownRequest::Status }

      # @!attribute submission
      #   After the drawdown request is submitted to Fedwire, this will contain
      #   supplemental details.
      #
      #   @return [Increase::Models::WireDrawdownRequest::Submission, nil]
      required :submission, -> { Increase::WireDrawdownRequest::Submission }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `wire_drawdown_request`.
      #
      #   @return [Symbol, Increase::Models::WireDrawdownRequest::Type]
      required :type, enum: -> { Increase::WireDrawdownRequest::Type }

      # @!method initialize(id:, account_number_id:, amount:, created_at:, currency:, fulfillment_inbound_wire_transfer_id:, idempotency_key:, message_to_recipient:, originator_address_line1:, originator_address_line2:, originator_address_line3:, originator_name:, recipient_account_number:, recipient_address_line1:, recipient_address_line2:, recipient_address_line3:, recipient_name:, recipient_routing_number:, status:, submission:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::WireDrawdownRequest} for more details.
      #
      #   Wire drawdown requests enable you to request that someone else send you a wire.
      #   Because there is nuance to making sure your counterparty's bank processes these
      #   correctly, we ask that you reach out to
      #   [support@increase.com](mailto:support@increase.com) to enable this feature so we
      #   can help you plan your integration. For more information, see our
      #   [Wire Drawdown Requests documentation](/documentation/wire-drawdown-requests).
      #
      #   @param id [String] The Wire drawdown request identifier.
      #
      #   @param account_number_id [String] The Account Number to which the recipient of this request is being requested to
      #
      #   @param amount [Integer] The amount being requested in cents.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #
      #   @param fulfillment_inbound_wire_transfer_id [String, nil] If the recipient fulfills the drawdown request by sending funds, then this will
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param message_to_recipient [String] The message the recipient will see as part of the drawdown request.
      #
      #   @param originator_address_line1 [String, nil] The originator's address line 1.
      #
      #   @param originator_address_line2 [String, nil] The originator's address line 2.
      #
      #   @param originator_address_line3 [String, nil] The originator's address line 3.
      #
      #   @param originator_name [String, nil] The originator's name.
      #
      #   @param recipient_account_number [String] The drawdown request's recipient's account number.
      #
      #   @param recipient_address_line1 [String, nil] Line 1 of the drawdown request's recipient's address.
      #
      #   @param recipient_address_line2 [String, nil] Line 2 of the drawdown request's recipient's address.
      #
      #   @param recipient_address_line3 [String, nil] Line 3 of the drawdown request's recipient's address.
      #
      #   @param recipient_name [String, nil] The drawdown request's recipient's name.
      #
      #   @param recipient_routing_number [String] The drawdown request's recipient's routing number.
      #
      #   @param status [Symbol, Increase::Models::WireDrawdownRequest::Status] The lifecycle status of the drawdown request.
      #
      #   @param submission [Increase::Models::WireDrawdownRequest::Submission, nil] After the drawdown request is submitted to Fedwire, this will contain supplement
      #
      #   @param type [Symbol, Increase::Models::WireDrawdownRequest::Type] A constant representing the object's type. For this resource it will always be `

      # The lifecycle status of the drawdown request.
      #
      # @see Increase::Models::WireDrawdownRequest#status
      module Status
        extend Increase::Internal::Type::Enum

        # The drawdown request is queued to be submitted to Fedwire.
        PENDING_SUBMISSION = :pending_submission

        # The drawdown request has been sent and the recipient should respond in some way.
        PENDING_RESPONSE = :pending_response

        # The drawdown request has been fulfilled by the recipient.
        FULFILLED = :fulfilled

        # The drawdown request has been refused by the recipient.
        REFUSED = :refused

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::WireDrawdownRequest#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute input_message_accountability_data
        #   The input message accountability data (IMAD) uniquely identifying the submission
        #   with Fedwire.
        #
        #   @return [String]
        required :input_message_accountability_data, String

        # @!method initialize(input_message_accountability_data:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::WireDrawdownRequest::Submission} for more details.
        #
        #   After the drawdown request is submitted to Fedwire, this will contain
        #   supplemental details.
        #
        #   @param input_message_accountability_data [String] The input message accountability data (IMAD) uniquely identifying the submission
      end

      # A constant representing the object's type. For this resource it will always be
      # `wire_drawdown_request`.
      #
      # @see Increase::Models::WireDrawdownRequest#type
      module Type
        extend Increase::Internal::Type::Enum

        WIRE_DRAWDOWN_REQUEST = :wire_drawdown_request

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
