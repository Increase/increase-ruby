# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimePaymentsTransfers#create
    class RealTimePaymentsTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute amount
      #   The transfer amount in USD cents. For Real-Time Payments transfers, must be
      #   positive.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute creditor_name
      #   The name of the transfer's recipient.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute source_account_number_id
      #   The identifier of the Account Number from which to send the transfer.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute unstructured_remittance_information
      #   Unstructured information that will show on the recipient's bank statement.
      #
      #   @return [String]
      required :unstructured_remittance_information, String

      # @!attribute account_number
      #   The destination account number.
      #
      #   @return [String, nil]
      optional :account_number, String

      # @!attribute debtor_address
      #   The address of the transfer's sender. If not provided, no debtor address is sent
      #   with the transfer.
      #
      #   @return [Increase::Models::RealTimePaymentsTransferCreateParams::DebtorAddress, nil]
      optional :debtor_address, -> { Increase::RealTimePaymentsTransferCreateParams::DebtorAddress }

      # @!attribute debtor_name
      #   The name of the transfer's sender. If not provided, defaults to the name of the
      #   account's entity.
      #
      #   @return [String, nil]
      optional :debtor_name, String

      # @!attribute external_account_id
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #   provided, `account_number` and `routing_number` must be absent.
      #
      #   @return [String, nil]
      optional :external_account_id, String

      # @!attribute inbound_real_time_payments_request_for_payment_id
      #   The ID of an Inbound Real-Time Payments Request for Payment in response to which
      #   this transfer is being sent.
      #
      #   @return [String, nil]
      optional :inbound_real_time_payments_request_for_payment_id, String

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!attribute routing_number
      #   The destination American Bankers' Association (ABA) Routing Transit Number
      #   (RTN).
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!attribute ultimate_creditor_name
      #   The name of the ultimate recipient of the transfer. Set this if the creditor is
      #   an intermediary receiving the payment for someone else.
      #
      #   @return [String, nil]
      optional :ultimate_creditor_name, String

      # @!attribute ultimate_debtor_name
      #   The name of the ultimate sender of the transfer. Set this if the funds are being
      #   sent on behalf of someone who is not the account holder at Increase.
      #
      #   @return [String, nil]
      optional :ultimate_debtor_name, String

      # @!method initialize(amount:, creditor_name:, source_account_number_id:, unstructured_remittance_information:, account_number: nil, debtor_address: nil, debtor_name: nil, external_account_id: nil, inbound_real_time_payments_request_for_payment_id: nil, require_approval: nil, routing_number: nil, ultimate_creditor_name: nil, ultimate_debtor_name: nil, request_options: {})
      #   @param amount [Integer]
      #     The transfer amount in USD cents. For Real-Time Payments transfers, must be
      #     positive.
      #
      #   @param creditor_name [String] The name of the transfer's recipient.
      #
      #   @param source_account_number_id [String]
      #     The identifier of the Account Number from which to send the transfer.
      #
      #   @param unstructured_remittance_information [String]
      #     Unstructured information that will show on the recipient's bank statement.
      #
      #   @param account_number [String] The destination account number.
      #
      #   @param debtor_address [Increase::Models::RealTimePaymentsTransferCreateParams::DebtorAddress]
      #     The address of the transfer's sender. If not provided, no debtor address is sent
      #     with the transfer.
      #
      #   @param debtor_name [String]
      #     The name of the transfer's sender. If not provided, defaults to the name of the
      #     account's entity.
      #
      #   @param external_account_id [String]
      #     The ID of an External Account to initiate a transfer to. If this parameter is
      #     provided, `account_number` and `routing_number` must be absent.
      #
      #   @param inbound_real_time_payments_request_for_payment_id [String]
      #     The ID of an Inbound Real-Time Payments Request for Payment in response to which
      #     this transfer is being sent.
      #
      #   @param require_approval [Boolean]
      #     Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param routing_number [String]
      #     The destination American Bankers' Association (ABA) Routing Transit Number
      #     (RTN).
      #
      #   @param ultimate_creditor_name [String]
      #     The name of the ultimate recipient of the transfer. Set this if the creditor is
      #     an intermediary receiving the payment for someone else.
      #
      #   @param ultimate_debtor_name [String]
      #     The name of the ultimate sender of the transfer. Set this if the funds are being
      #     sent on behalf of someone who is not the account holder at Increase.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class DebtorAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The town or city.
        #
        #   @return [String]
        required :city, String

        # @!attribute country
        #   The ISO 3166, Alpha-2 country code.
        #
        #   Defaults to `US`.
        #
        #   @return [String]
        required :country, String

        # @!attribute postal_code
        #   The postal code or zip.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The US state component of the address.
        #
        #   @return [String]
        required :state, String

        # @!attribute street_name
        #   The street name without the street number.
        #
        #   @return [String]
        required :street_name, String

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

        # @!method initialize(city:, country:, postal_code:, state:, street_name:, address_line2: nil, building_number: nil)
        #   The address of the transfer's sender. If not provided, no debtor address is sent
        #   with the transfer.
        #
        #   @param city [String] The town or city.
        #
        #   @param country [String]
        #     The ISO 3166, Alpha-2 country code.
        #
        #     Defaults to `US`.
        #
        #   @param postal_code [String] The postal code or zip.
        #
        #   @param state [String] The US state component of the address.
        #
        #   @param street_name [String] The street name without the street number.
        #
        #   @param address_line2 [String]
        #     A second address line, such as an apartment or suite number. The first address
        #     line is separated into `building_number` and `street_name`.
        #
        #   @param building_number [String] The number identifying the position of the building on the street.
      end
    end
  end
end
