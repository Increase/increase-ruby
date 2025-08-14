# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardValidations#create
    class CardValidationCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier of the Account from which to send the validation.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute card_token_id
      #   The Increase identifier for the Card Token that represents the card number
      #   you're validating.
      #
      #   @return [String]
      required :card_token_id, String

      # @!attribute merchant_category_code
      #   A four-digit code (MCC) identifying the type of business or service provided by
      #   the merchant.
      #
      #   @return [String]
      required :merchant_category_code, String

      # @!attribute merchant_city_name
      #   The city where the merchant (typically your business) is located.
      #
      #   @return [String]
      required :merchant_city_name, String

      # @!attribute merchant_name
      #   The merchant name that will appear in the cardholder’s statement descriptor.
      #   Typically your business name.
      #
      #   @return [String]
      required :merchant_name, String

      # @!attribute merchant_postal_code
      #   The postal code for the merchant’s (typically your business’s) location.
      #
      #   @return [String]
      required :merchant_postal_code, String

      # @!attribute merchant_state
      #   The U.S. state where the merchant (typically your business) is located.
      #
      #   @return [String]
      required :merchant_state, String

      # @!attribute cardholder_first_name
      #   The cardholder's first name.
      #
      #   @return [String, nil]
      optional :cardholder_first_name, String

      # @!attribute cardholder_last_name
      #   The cardholder's last name.
      #
      #   @return [String, nil]
      optional :cardholder_last_name, String

      # @!attribute cardholder_middle_name
      #   The cardholder's middle name.
      #
      #   @return [String, nil]
      optional :cardholder_middle_name, String

      # @!attribute cardholder_postal_code
      #   The postal code of the cardholder's address.
      #
      #   @return [String, nil]
      optional :cardholder_postal_code, String

      # @!attribute cardholder_street_address
      #   The cardholder's street address.
      #
      #   @return [String, nil]
      optional :cardholder_street_address, String

      # @!method initialize(account_id:, card_token_id:, merchant_category_code:, merchant_city_name:, merchant_name:, merchant_postal_code:, merchant_state:, cardholder_first_name: nil, cardholder_last_name: nil, cardholder_middle_name: nil, cardholder_postal_code: nil, cardholder_street_address: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardValidationCreateParams} for more details.
      #
      #   @param account_id [String] The identifier of the Account from which to send the validation.
      #
      #   @param card_token_id [String] The Increase identifier for the Card Token that represents the card number you'r
      #
      #   @param merchant_category_code [String] A four-digit code (MCC) identifying the type of business or service provided by
      #
      #   @param merchant_city_name [String] The city where the merchant (typically your business) is located.
      #
      #   @param merchant_name [String] The merchant name that will appear in the cardholder’s statement descriptor. Typ
      #
      #   @param merchant_postal_code [String] The postal code for the merchant’s (typically your business’s) location.
      #
      #   @param merchant_state [String] The U.S. state where the merchant (typically your business) is located.
      #
      #   @param cardholder_first_name [String] The cardholder's first name.
      #
      #   @param cardholder_last_name [String] The cardholder's last name.
      #
      #   @param cardholder_middle_name [String] The cardholder's middle name.
      #
      #   @param cardholder_postal_code [String] The postal code of the cardholder's address.
      #
      #   @param cardholder_street_address [String] The cardholder's street address.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
