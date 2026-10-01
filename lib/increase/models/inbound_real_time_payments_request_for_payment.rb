# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundRealTimePaymentsRequestsForPayment#retrieve
    class InboundRealTimePaymentsRequestForPayment < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The inbound Real-Time Payments request for payment's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account the request for payment is for.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number_id
      #   The identifier of the Account Number the request for payment is for.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute amount
      #   The requested amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the request for payment was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute creditor
      #   Details of the party requesting payment.
      #
      #   @return [Increase::Models::InboundRealTimePaymentsRequestForPayment::Creditor]
      required :creditor, -> { Increase::InboundRealTimePaymentsRequestForPayment::Creditor }

      # @!attribute creditor_account_number
      #   The creditor's account number.
      #
      #   @return [String]
      required :creditor_account_number, String

      # @!attribute creditor_routing_number
      #   The creditor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @return [String]
      required :creditor_routing_number, String

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the requested
      #   currency. This will always be "USD" for a Real-Time Payments request for
      #   payment.
      #
      #   @return [Symbol, Increase::Models::InboundRealTimePaymentsRequestForPayment::Currency]
      required :currency, enum: -> { Increase::InboundRealTimePaymentsRequestForPayment::Currency }

      # @!attribute debtor_name
      #   The name of the account holder the payment is requested from, as provided by the
      #   creditor.
      #
      #   @return [String]
      required :debtor_name, String

      # @!attribute end_to_end_identification
      #   A free-form reference string set by the creditor, to help identify the request
      #   for payment.
      #
      #   @return [String]
      required :end_to_end_identification, String

      # @!attribute expires_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      #   the request for payment is no longer valid and should no longer be paid.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute fulfillment_real_time_payments_transfer_id
      #   The identifier of the Real-Time Payments Transfer that fulfilled this request
      #   for payment. This is set once a transfer sent in response to the request for
      #   payment has been acknowledged by the Real-Time Payments network.
      #
      #   @return [String, nil]
      required :fulfillment_real_time_payments_transfer_id, String, nil?: true

      # @!attribute invoicer_identification
      #   An identifier for the party that issued the invoice, for requests for payment
      #   sent on behalf of another party.
      #
      #   @return [String, nil]
      required :invoicer_identification, String, nil?: true

      # @!attribute payment_information_identification
      #   The Real-Time Payments network identification of the request for payment.
      #
      #   @return [String]
      required :payment_information_identification, String

      # @!attribute requested_execution_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      #   the creditor requests the payment to be made.
      #
      #   @return [Time, nil]
      required :requested_execution_at, Time, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_real_time_payments_request_for_payment`.
      #
      #   @return [Symbol, Increase::Models::InboundRealTimePaymentsRequestForPayment::Type]
      required :type, enum: -> { Increase::InboundRealTimePaymentsRequestForPayment::Type }

      # @!attribute unstructured_remittance_information
      #   Unstructured information included with the request for payment.
      #
      #   @return [String, nil]
      required :unstructured_remittance_information, String, nil?: true

      # @!method initialize(id:, account_id:, account_number_id:, amount:, created_at:, creditor:, creditor_account_number:, creditor_routing_number:, currency:, debtor_name:, end_to_end_identification:, expires_at:, fulfillment_real_time_payments_transfer_id:, invoicer_identification:, payment_information_identification:, requested_execution_at:, type:, unstructured_remittance_information:)
      #   An Inbound Real-Time Payments Request for Payment is a request initiated outside
      #   of Increase for one of your accounts to send a Real-Time Payments transfer.
      #
      #   @param id [String] The inbound Real-Time Payments request for payment's identifier.
      #
      #   @param account_id [String] The Account the request for payment is for.
      #
      #   @param account_number_id [String] The identifier of the Account Number the request for payment is for.
      #
      #   @param amount [Integer] The requested amount in USD cents.
      #
      #   @param created_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the request for payment was created.
      #
      #   @param creditor [Increase::Models::InboundRealTimePaymentsRequestForPayment::Creditor]
      #     Details of the party requesting payment.
      #
      #   @param creditor_account_number [String] The creditor's account number.
      #
      #   @param creditor_routing_number [String]
      #     The creditor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @param currency [Symbol, Increase::Models::InboundRealTimePaymentsRequestForPayment::Currency]
      #     The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the requested
      #     currency. This will always be "USD" for a Real-Time Payments request for
      #     payment.
      #
      #   @param debtor_name [String]
      #     The name of the account holder the payment is requested from, as provided by the
      #     creditor.
      #
      #   @param end_to_end_identification [String]
      #     A free-form reference string set by the creditor, to help identify the request
      #     for payment.
      #
      #   @param expires_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      #     the request for payment is no longer valid and should no longer be paid.
      #
      #   @param fulfillment_real_time_payments_transfer_id [String, nil]
      #     The identifier of the Real-Time Payments Transfer that fulfilled this request
      #     for payment. This is set once a transfer sent in response to the request for
      #     payment has been acknowledged by the Real-Time Payments network.
      #
      #   @param invoicer_identification [String, nil]
      #     An identifier for the party that issued the invoice, for requests for payment
      #     sent on behalf of another party.
      #
      #   @param payment_information_identification [String]
      #     The Real-Time Payments network identification of the request for payment.
      #
      #   @param requested_execution_at [Time, nil]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      #     the creditor requests the payment to be made.
      #
      #   @param type [Symbol, Increase::Models::InboundRealTimePaymentsRequestForPayment::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `inbound_real_time_payments_request_for_payment`.
      #
      #   @param unstructured_remittance_information [String, nil]
      #     Unstructured information included with the request for payment.

      # @see Increase::Models::InboundRealTimePaymentsRequestForPayment#creditor
      class Creditor < Increase::Internal::Type::BaseModel
        # @!attribute account_name
        #   The name of the account that would receive the payment, as provided by the
        #   creditor.
        #
        #   @return [String, nil]
        required :account_name, String, nil?: true

        # @!attribute address
        #   Address of the creditor.
        #
        #   @return [Increase::Models::InboundRealTimePaymentsRequestForPayment::Creditor::Address]
        required :address, -> { Increase::InboundRealTimePaymentsRequestForPayment::Creditor::Address }

        # @!attribute name
        #   The name of the creditor.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(account_name:, address:, name:)
        #   Details of the party requesting payment.
        #
        #   @param account_name [String, nil]
        #     The name of the account that would receive the payment, as provided by the
        #     creditor.
        #
        #   @param address [Increase::Models::InboundRealTimePaymentsRequestForPayment::Creditor::Address]
        #     Address of the creditor.
        #
        #   @param name [String] The name of the creditor.

        # @see Increase::Models::InboundRealTimePaymentsRequestForPayment::Creditor#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute address_line2
          #   A second address line, such as an apartment or suite number. The first address
          #   line is separated into `building_number` and `street_name`.
          #
          #   @return [String, nil]
          required :address_line2, String, nil?: true

          # @!attribute building_number
          #   The number identifying the position of the building on the street.
          #
          #   @return [String, nil]
          required :building_number, String, nil?: true

          # @!attribute city
          #   The town or city.
          #
          #   @return [String, nil]
          required :city, String, nil?: true

          # @!attribute country
          #   The ISO 3166, Alpha-2 country code.
          #
          #   @return [String, nil]
          required :country, String, nil?: true

          # @!attribute postal_code
          #   The postal code or zip.
          #
          #   @return [String, nil]
          required :postal_code, String, nil?: true

          # @!attribute state
          #   The US state component of the address.
          #
          #   @return [String, nil]
          required :state, String, nil?: true

          # @!attribute street_name
          #   The street name without the street number.
          #
          #   @return [String, nil]
          required :street_name, String, nil?: true

          # @!method initialize(address_line2:, building_number:, city:, country:, postal_code:, state:, street_name:)
          #   Address of the creditor.
          #
          #   @param address_line2 [String, nil]
          #     A second address line, such as an apartment or suite number. The first address
          #     line is separated into `building_number` and `street_name`.
          #
          #   @param building_number [String, nil] The number identifying the position of the building on the street.
          #
          #   @param city [String, nil] The town or city.
          #
          #   @param country [String, nil] The ISO 3166, Alpha-2 country code.
          #
          #   @param postal_code [String, nil] The postal code or zip.
          #
          #   @param state [String, nil] The US state component of the address.
          #
          #   @param street_name [String, nil] The street name without the street number.
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code of the requested
      # currency. This will always be "USD" for a Real-Time Payments request for
      # payment.
      #
      # @see Increase::Models::InboundRealTimePaymentsRequestForPayment#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_real_time_payments_request_for_payment`.
      #
      # @see Increase::Models::InboundRealTimePaymentsRequestForPayment#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_REAL_TIME_PAYMENTS_REQUEST_FOR_PAYMENT = :inbound_real_time_payments_request_for_payment

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
