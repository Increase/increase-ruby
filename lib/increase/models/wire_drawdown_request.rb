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
      #   The Account Number to which the debtor—the recipient of this request—is being
      #   requested to send funds.
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

      # @!attribute creditor_address
      #   The creditor's address.
      #
      #   @return [Increase::Models::WireDrawdownRequest::CreditorAddress]
      required :creditor_address, -> { Increase::WireDrawdownRequest::CreditorAddress }

      # @!attribute creditor_name
      #   The creditor's name.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #   requested. Will always be "USD".
      #
      #   @return [String]
      required :currency, String

      # @!attribute debtor_account_number
      #   The debtor's account number.
      #
      #   @return [String]
      required :debtor_account_number, String

      # @!attribute debtor_address
      #   The debtor's address.
      #
      #   @return [Increase::Models::WireDrawdownRequest::DebtorAddress]
      required :debtor_address, -> { Increase::WireDrawdownRequest::DebtorAddress }

      # @!attribute debtor_name
      #   The debtor's name.
      #
      #   @return [String]
      required :debtor_name, String

      # @!attribute debtor_routing_number
      #   The debtor's routing number.
      #
      #   @return [String]
      required :debtor_routing_number, String

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

      # @!attribute unstructured_remittance_information
      #   Remittance information the debtor will see as part of the drawdown request.
      #
      #   @return [String]
      required :unstructured_remittance_information, String

      # @!method initialize(id:, account_number_id:, amount:, created_at:, creditor_address:, creditor_name:, currency:, debtor_account_number:, debtor_address:, debtor_name:, debtor_routing_number:, fulfillment_inbound_wire_transfer_id:, idempotency_key:, status:, submission:, type:, unstructured_remittance_information:)
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
      #   @param account_number_id [String] The Account Number to which the debtor—the recipient of this request—is being re
      #
      #   @param amount [Integer] The amount being requested in cents.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param creditor_address [Increase::Models::WireDrawdownRequest::CreditorAddress] The creditor's address.
      #
      #   @param creditor_name [String] The creditor's name.
      #
      #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      #
      #   @param debtor_account_number [String] The debtor's account number.
      #
      #   @param debtor_address [Increase::Models::WireDrawdownRequest::DebtorAddress] The debtor's address.
      #
      #   @param debtor_name [String] The debtor's name.
      #
      #   @param debtor_routing_number [String] The debtor's routing number.
      #
      #   @param fulfillment_inbound_wire_transfer_id [String, nil] If the recipient fulfills the drawdown request by sending funds, then this will
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param status [Symbol, Increase::Models::WireDrawdownRequest::Status] The lifecycle status of the drawdown request.
      #
      #   @param submission [Increase::Models::WireDrawdownRequest::Submission, nil] After the drawdown request is submitted to Fedwire, this will contain supplement
      #
      #   @param type [Symbol, Increase::Models::WireDrawdownRequest::Type] A constant representing the object's type. For this resource it will always be `
      #
      #   @param unstructured_remittance_information [String] Remittance information the debtor will see as part of the drawdown request.

      # @see Increase::Models::WireDrawdownRequest#creditor_address
      class CreditorAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city, district, town, or village of the address.
        #
        #   @return [String]
        required :city, String

        # @!attribute country
        #   The two-letter
        #   [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        #   the country of the address.
        #
        #   @return [String]
        required :country, String

        # @!attribute line1
        #   The first line of the address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the address.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute postal_code
        #   The ZIP code of the address.
        #
        #   @return [String, nil]
        required :postal_code, String, nil?: true

        # @!attribute state
        #   The address state.
        #
        #   @return [String, nil]
        required :state, String, nil?: true

        # @!method initialize(city:, country:, line1:, line2:, postal_code:, state:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::WireDrawdownRequest::CreditorAddress} for more details.
        #
        #   The creditor's address.
        #
        #   @param city [String] The city, district, town, or village of the address.
        #
        #   @param country [String] The two-letter [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alp
        #
        #   @param line1 [String] The first line of the address.
        #
        #   @param line2 [String, nil] The second line of the address.
        #
        #   @param postal_code [String, nil] The ZIP code of the address.
        #
        #   @param state [String, nil] The address state.
      end

      # @see Increase::Models::WireDrawdownRequest#debtor_address
      class DebtorAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city, district, town, or village of the address.
        #
        #   @return [String]
        required :city, String

        # @!attribute country
        #   The two-letter
        #   [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        #   the country of the address.
        #
        #   @return [String]
        required :country, String

        # @!attribute line1
        #   The first line of the address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the address.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute postal_code
        #   The ZIP code of the address.
        #
        #   @return [String, nil]
        required :postal_code, String, nil?: true

        # @!attribute state
        #   The address state.
        #
        #   @return [String, nil]
        required :state, String, nil?: true

        # @!method initialize(city:, country:, line1:, line2:, postal_code:, state:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::WireDrawdownRequest::DebtorAddress} for more details.
        #
        #   The debtor's address.
        #
        #   @param city [String] The city, district, town, or village of the address.
        #
        #   @param country [String] The two-letter [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alp
        #
        #   @param line1 [String] The first line of the address.
        #
        #   @param line2 [String, nil] The second line of the address.
        #
        #   @param postal_code [String, nil] The ZIP code of the address.
        #
        #   @param state [String, nil] The address state.
      end

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
