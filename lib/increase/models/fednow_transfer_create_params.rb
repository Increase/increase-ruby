# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::FednowTransfers#create
    class FednowTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The amount, in minor units, to send to the creditor.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute creditor_name
      #   The creditor's name.
      #
      #   @return [String]
      required :creditor_name, String

      # @!attribute debtor_name
      #   The debtor's name.
      #
      #   @return [String]
      required :debtor_name, String

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

      # @!attribute account_number
      #   The creditor's account number.
      #
      #   @return [String, nil]
      optional :account_number, String

      # @!attribute creditor_address
      #   The creditor's address.
      #
      #   @return [Increase::Models::FednowTransferCreateParams::CreditorAddress, nil]
      optional :creditor_address, -> { Increase::FednowTransferCreateParams::CreditorAddress }

      # @!attribute debtor_address
      #   The debtor's address.
      #
      #   @return [Increase::Models::FednowTransferCreateParams::DebtorAddress, nil]
      optional :debtor_address, -> { Increase::FednowTransferCreateParams::DebtorAddress }

      # @!attribute external_account_id
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #   provided, `account_number` and `routing_number` must be absent.
      #
      #   @return [String, nil]
      optional :external_account_id, String

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!attribute routing_number
      #   The creditor's bank account routing number.
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!method initialize(account_id:, amount:, creditor_name:, debtor_name:, source_account_number_id:, unstructured_remittance_information:, account_number: nil, creditor_address: nil, debtor_address: nil, external_account_id: nil, require_approval: nil, routing_number: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::FednowTransferCreateParams} for more details.
      #
      #   @param account_id [String] The identifier for the account that will send the transfer.
      #
      #   @param amount [Integer] The amount, in minor units, to send to the creditor.
      #
      #   @param creditor_name [String] The creditor's name.
      #
      #   @param debtor_name [String] The debtor's name.
      #
      #   @param source_account_number_id [String] The Account Number to include in the transfer as the debtor's account number.
      #
      #   @param unstructured_remittance_information [String] Unstructured remittance information to include in the transfer.
      #
      #   @param account_number [String] The creditor's account number.
      #
      #   @param creditor_address [Increase::Models::FednowTransferCreateParams::CreditorAddress] The creditor's address.
      #
      #   @param debtor_address [Increase::Models::FednowTransferCreateParams::DebtorAddress] The debtor's address.
      #
      #   @param external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param routing_number [String] The creditor's bank account routing number.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class CreditorAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city, district, town, or village of the address.
        #
        #   @return [String]
        required :city, String

        # @!attribute postal_code
        #   The postal code component of the address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The US state component of the address.
        #
        #   @return [String]
        required :state, String

        # @!attribute line1
        #   The first line of the address. This is usually the street number and street.
        #
        #   @return [String, nil]
        optional :line1, String

        # @!method initialize(city:, postal_code:, state:, line1: nil)
        #   The creditor's address.
        #
        #   @param city [String] The city, district, town, or village of the address.
        #
        #   @param postal_code [String] The postal code component of the address.
        #
        #   @param state [String] The US state component of the address.
        #
        #   @param line1 [String] The first line of the address. This is usually the street number and street.
      end

      class DebtorAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city, district, town, or village of the address.
        #
        #   @return [String]
        required :city, String

        # @!attribute postal_code
        #   The postal code component of the address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The US state component of the address.
        #
        #   @return [String]
        required :state, String

        # @!attribute line1
        #   The first line of the address. This is usually the street number and street.
        #
        #   @return [String, nil]
        optional :line1, String

        # @!method initialize(city:, postal_code:, state:, line1: nil)
        #   The debtor's address.
        #
        #   @param city [String] The city, district, town, or village of the address.
        #
        #   @param postal_code [String] The postal code component of the address.
        #
        #   @param state [String] The US state component of the address.
        #
        #   @param line1 [String] The first line of the address. This is usually the street number and street.
      end
    end
  end
end
