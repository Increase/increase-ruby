# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::SwiftTransfers#create
    class SwiftTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number
      #   The creditor's account number.
      #
      #   @return [String]
      required :account_number, String

      # @!attribute bank_identification_code
      #   The bank identification code (BIC) of the creditor. If it ends with the
      #   three-character branch code, this must be 11 characters long. Otherwise this
      #   must be 8 characters and the branch code will be assumed to be `XXX`.
      #
      #   @return [String]
      required :bank_identification_code, String

      # @!attribute creditor_address
      #   The creditor's address.
      #
      #   @return [Increase::Models::SwiftTransferCreateParams::CreditorAddress]
      required :creditor_address, -> { Increase::SwiftTransferCreateParams::CreditorAddress }

      # @!attribute creditor_name
      #   The creditor's name.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute debtor_address
      #   The debtor's address.
      #
      #   @return [Increase::Models::SwiftTransferCreateParams::DebtorAddress]
      required :debtor_address, -> { Increase::SwiftTransferCreateParams::DebtorAddress }

      # @!attribute debtor_name
      #   The debtor's name.
      #
      #   @return [String]
      required :debtor_name, String

      # @!attribute instructed_amount
      #   The amount, in minor units of `instructed_currency`, to send to the creditor.
      #
      #   @return [Integer]
      required :instructed_amount, Integer

      # @!attribute instructed_currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
      #   instructed amount.
      #
      #   @return [Symbol, Increase::Models::SwiftTransferCreateParams::InstructedCurrency]
      required :instructed_currency, enum: -> { Increase::SwiftTransferCreateParams::InstructedCurrency }

      # @!attribute source_account_number_id
      #   The Account Number to include in the transfer as the debtor's account number.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute unstructured_remittance_information
      #   Unstructured remittance information to include in the transfer.
      #
      #   @return [String]
      required :unstructured_remittance_information, String

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!attribute routing_number
      #   The creditor's bank account routing or transit number. Required in certain
      #   countries.
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!method initialize(account_id:, account_number:, bank_identification_code:, creditor_address:, creditor_name:, debtor_address:, debtor_name:, instructed_amount:, instructed_currency:, source_account_number_id:, unstructured_remittance_information:, require_approval: nil, routing_number: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::SwiftTransferCreateParams} for more details.
      #
      #   @param account_id [String] The identifier for the account that will send the transfer.
      #
      #   @param account_number [String] The creditor's account number.
      #
      #   @param bank_identification_code [String] The bank identification code (BIC) of the creditor. If it ends with the three-ch
      #
      #   @param creditor_address [Increase::Models::SwiftTransferCreateParams::CreditorAddress] The creditor's address.
      #
      #   @param creditor_name [String] The creditor's name.
      #
      #   @param debtor_address [Increase::Models::SwiftTransferCreateParams::DebtorAddress] The debtor's address.
      #
      #   @param debtor_name [String] The debtor's name.
      #
      #   @param instructed_amount [Integer] The amount, in minor units of `instructed_currency`, to send to the creditor.
      #
      #   @param instructed_currency [Symbol, Increase::Models::SwiftTransferCreateParams::InstructedCurrency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the inst
      #
      #   @param source_account_number_id [String] The Account Number to include in the transfer as the debtor's account number.
      #
      #   @param unstructured_remittance_information [String] Unstructured remittance information to include in the transfer.
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param routing_number [String] The creditor's bank account routing or transit number. Required in certain count
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

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
        #   The first line of the address. This is usually the street number and street.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the address. This might be the floor or room number.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!attribute postal_code
        #   The ZIP or postal code of the address. Required in certain countries.
        #
        #   @return [String, nil]
        optional :postal_code, String

        # @!attribute state
        #   The state, province, or region of the address. Required in certain countries.
        #
        #   @return [String, nil]
        optional :state, String

        # @!method initialize(city:, country:, line1:, line2: nil, postal_code: nil, state: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::SwiftTransferCreateParams::CreditorAddress} for more details.
        #
        #   The creditor's address.
        #
        #   @param city [String] The city, district, town, or village of the address.
        #
        #   @param country [String] The two-letter [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alp
        #
        #   @param line1 [String] The first line of the address. This is usually the street number and street.
        #
        #   @param line2 [String] The second line of the address. This might be the floor or room number.
        #
        #   @param postal_code [String] The ZIP or postal code of the address. Required in certain countries.
        #
        #   @param state [String] The state, province, or region of the address. Required in certain countries.
      end

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
        #   The first line of the address. This is usually the street number and street.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the address. This might be the floor or room number.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!attribute postal_code
        #   The ZIP or postal code of the address. Required in certain countries.
        #
        #   @return [String, nil]
        optional :postal_code, String

        # @!attribute state
        #   The state, province, or region of the address. Required in certain countries.
        #
        #   @return [String, nil]
        optional :state, String

        # @!method initialize(city:, country:, line1:, line2: nil, postal_code: nil, state: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::SwiftTransferCreateParams::DebtorAddress} for more details.
        #
        #   The debtor's address.
        #
        #   @param city [String] The city, district, town, or village of the address.
        #
        #   @param country [String] The two-letter [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alp
        #
        #   @param line1 [String] The first line of the address. This is usually the street number and street.
        #
        #   @param line2 [String] The second line of the address. This might be the floor or room number.
        #
        #   @param postal_code [String] The ZIP or postal code of the address. Required in certain countries.
        #
        #   @param state [String] The state, province, or region of the address. Required in certain countries.
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the
      # instructed amount.
      module InstructedCurrency
        extend Increase::Internal::Type::Enum

        # United States Dollar
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
