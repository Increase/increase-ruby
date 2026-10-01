# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimePaymentsRequestsForPayment#create
    class RealTimePaymentsRequestsForPaymentCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   The identifier of the Account Number where the funds will land.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute amount
      #   The requested amount in USD cents. Must be positive.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute debtor
      #   Details of the person being requested to pay.
      #
      #   @return [Increase::Models::RealTimePaymentsRequestsForPaymentCreateParams::Debtor]
      required :debtor, -> { Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor }

      # @!attribute debtor_account_number
      #   The debtor's account number, which the funds will be requested from.
      #
      #   @return [String]
      required :debtor_account_number, String

      # @!attribute debtor_routing_number
      #   The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @return [String]
      required :debtor_routing_number, String

      # @!attribute expires_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      #   the request for payment is no longer valid. After this time the debtor's bank
      #   should no longer allow the debtor to pay it. Must not be before
      #   `requested_execution_at`.
      #
      #   @return [Time]
      required :expires_at, Time

      # @!attribute requested_execution_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      #   you are requesting the payment to be made.
      #
      #   @return [Time]
      required :requested_execution_at, Time

      # @!attribute unstructured_remittance_information
      #   Unstructured information that will show on the recipient's bank statement.
      #
      #   @return [String]
      required :unstructured_remittance_information, String

      # @!attribute creditor_name
      #   The name of the creditor requesting the payment. If not provided, defaults to
      #   the name of the account's entity.
      #
      #   @return [String, nil]
      optional :creditor_name, String

      # @!method initialize(account_number_id:, amount:, debtor:, debtor_account_number:, debtor_routing_number:, expires_at:, requested_execution_at:, unstructured_remittance_information:, creditor_name: nil, request_options: {})
      #   @param account_number_id [String] The identifier of the Account Number where the funds will land.
      #
      #   @param amount [Integer] The requested amount in USD cents. Must be positive.
      #
      #   @param debtor [Increase::Models::RealTimePaymentsRequestsForPaymentCreateParams::Debtor]
      #     Details of the person being requested to pay.
      #
      #   @param debtor_account_number [String] The debtor's account number, which the funds will be requested from.
      #
      #   @param debtor_routing_number [String]
      #     The debtor's American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @param expires_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time after which
      #     the request for payment is no longer valid. After this time the debtor's bank
      #     should no longer allow the debtor to pay it. Must not be before
      #     `requested_execution_at`.
      #
      #   @param requested_execution_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time by which
      #     you are requesting the payment to be made.
      #
      #   @param unstructured_remittance_information [String]
      #     Unstructured information that will show on the recipient's bank statement.
      #
      #   @param creditor_name [String]
      #     The name of the creditor requesting the payment. If not provided, defaults to
      #     the name of the account's entity.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Debtor < Increase::Internal::Type::BaseModel
        # @!attribute address
        #   Address of the debtor.
        #
        #   @return [Increase::Models::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::Address]
        required :address, -> { Increase::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::Address }

        # @!attribute name
        #   The name of the debtor.
        #
        #   @return [String]
        required :name, String

        # @!method initialize(address:, name:)
        #   Details of the person being requested to pay.
        #
        #   @param address [Increase::Models::RealTimePaymentsRequestsForPaymentCreateParams::Debtor::Address]
        #     Address of the debtor.
        #
        #   @param name [String] The name of the debtor.

        # @see Increase::Models::RealTimePaymentsRequestsForPaymentCreateParams::Debtor#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute country
          #   The ISO 3166, Alpha-2 country code.
          #
          #   Defaults to `US`.
          #
          #   @return [String]
          required :country, String

          # @!attribute address_line2
          #   A second address line, such as an apartment or suite number. The first address
          #   line is separated into `building_number` and `street_name`.
          #
          #   @return [String, nil]
          optional :address_line2, String

          # @!attribute building_number
          #   The number identifying the position of the building on the street.
          #
          #   @return [String, nil]
          optional :building_number, String

          # @!attribute city
          #   The town or city.
          #
          #   @return [String, nil]
          optional :city, String

          # @!attribute postal_code
          #   The postal code or zip.
          #
          #   @return [String, nil]
          optional :postal_code, String

          # @!attribute state
          #   The US state component of the address.
          #
          #   @return [String, nil]
          optional :state, String

          # @!attribute street_name
          #   The street name without the street number.
          #
          #   @return [String, nil]
          optional :street_name, String

          # @!method initialize(country:, address_line2: nil, building_number: nil, city: nil, postal_code: nil, state: nil, street_name: nil)
          #   Address of the debtor.
          #
          #   @param country [String]
          #     The ISO 3166, Alpha-2 country code.
          #
          #     Defaults to `US`.
          #
          #   @param address_line2 [String]
          #     A second address line, such as an apartment or suite number. The first address
          #     line is separated into `building_number` and `street_name`.
          #
          #   @param building_number [String] The number identifying the position of the building on the street.
          #
          #   @param city [String] The town or city.
          #
          #   @param postal_code [String] The postal code or zip.
          #
          #   @param state [String] The US state component of the address.
          #
          #   @param street_name [String] The street name without the street number.
        end
      end
    end
  end
end
