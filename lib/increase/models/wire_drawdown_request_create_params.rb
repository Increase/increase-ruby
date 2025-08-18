# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireDrawdownRequests#create
    class WireDrawdownRequestCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_number_id
      #   The Account Number to which the debtor should send funds.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute amount
      #   The amount requested from the debtor, in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute creditor_address
      #   The creditor's address.
      #
      #   @return [Increase::Models::WireDrawdownRequestCreateParams::CreditorAddress]
      required :creditor_address, -> { Increase::WireDrawdownRequestCreateParams::CreditorAddress }

      # @!attribute creditor_name
      #   The creditor's name.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute debtor_address
      #   The debtor's address.
      #
      #   @return [Increase::Models::WireDrawdownRequestCreateParams::DebtorAddress]
      required :debtor_address, -> { Increase::WireDrawdownRequestCreateParams::DebtorAddress }

      # @!attribute debtor_name
      #   The debtor's name.
      #
      #   @return [String]
      required :debtor_name, String

      # @!attribute unstructured_remittance_information
      #   Remittance information the debtor will see as part of the request.
      #
      #   @return [String]
      required :unstructured_remittance_information, String

      # @!attribute debtor_account_number
      #   The debtor's account number.
      #
      #   @return [String, nil]
      optional :debtor_account_number, String

      # @!attribute debtor_external_account_id
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #   provided, `debtor_account_number` and `debtor_routing_number` must be absent.
      #
      #   @return [String, nil]
      optional :debtor_external_account_id, String

      # @!attribute debtor_routing_number
      #   The debtor's routing number.
      #
      #   @return [String, nil]
      optional :debtor_routing_number, String

      # @!method initialize(account_number_id:, amount:, creditor_address:, creditor_name:, debtor_address:, debtor_name:, unstructured_remittance_information:, debtor_account_number: nil, debtor_external_account_id: nil, debtor_routing_number: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::WireDrawdownRequestCreateParams} for more details.
      #
      #   @param account_number_id [String] The Account Number to which the debtor should send funds.
      #
      #   @param amount [Integer] The amount requested from the debtor, in USD cents.
      #
      #   @param creditor_address [Increase::Models::WireDrawdownRequestCreateParams::CreditorAddress] The creditor's address.
      #
      #   @param creditor_name [String] The creditor's name.
      #
      #   @param debtor_address [Increase::Models::WireDrawdownRequestCreateParams::DebtorAddress] The debtor's address.
      #
      #   @param debtor_name [String] The debtor's name.
      #
      #   @param unstructured_remittance_information [String] Remittance information the debtor will see as part of the request.
      #
      #   @param debtor_account_number [String] The debtor's account number.
      #
      #   @param debtor_external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      #   @param debtor_routing_number [String] The debtor's routing number.
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
        #   The ZIP code of the address.
        #
        #   @return [String, nil]
        optional :postal_code, String

        # @!attribute state
        #   The address state.
        #
        #   @return [String, nil]
        optional :state, String

        # @!method initialize(city:, country:, line1:, line2: nil, postal_code: nil, state: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::WireDrawdownRequestCreateParams::CreditorAddress} for more
        #   details.
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
        #   @param postal_code [String] The ZIP code of the address.
        #
        #   @param state [String] The address state.
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
        #   The ZIP code of the address.
        #
        #   @return [String, nil]
        optional :postal_code, String

        # @!attribute state
        #   The address state.
        #
        #   @return [String, nil]
        optional :state, String

        # @!method initialize(city:, country:, line1:, line2: nil, postal_code: nil, state: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::WireDrawdownRequestCreateParams::DebtorAddress} for more
        #   details.
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
        #   @param postal_code [String] The ZIP code of the address.
        #
        #   @param state [String] The address state.
      end
    end
  end
end
