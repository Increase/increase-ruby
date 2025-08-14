# typed: strong

module Increase
  module Models
    class CardValidationCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardValidationCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Account from which to send the validation.
      sig { returns(String) }
      attr_accessor :account_id

      # The Increase identifier for the Card Token that represents the card number
      # you're validating.
      sig { returns(String) }
      attr_accessor :card_token_id

      # A four-digit code (MCC) identifying the type of business or service provided by
      # the merchant.
      sig { returns(String) }
      attr_accessor :merchant_category_code

      # The city where the merchant (typically your business) is located.
      sig { returns(String) }
      attr_accessor :merchant_city_name

      # The merchant name that will appear in the cardholder’s statement descriptor.
      # Typically your business name.
      sig { returns(String) }
      attr_accessor :merchant_name

      # The postal code for the merchant’s (typically your business’s) location.
      sig { returns(String) }
      attr_accessor :merchant_postal_code

      # The U.S. state where the merchant (typically your business) is located.
      sig { returns(String) }
      attr_accessor :merchant_state

      # The cardholder's first name.
      sig { returns(T.nilable(String)) }
      attr_reader :cardholder_first_name

      sig { params(cardholder_first_name: String).void }
      attr_writer :cardholder_first_name

      # The cardholder's last name.
      sig { returns(T.nilable(String)) }
      attr_reader :cardholder_last_name

      sig { params(cardholder_last_name: String).void }
      attr_writer :cardholder_last_name

      # The cardholder's middle name.
      sig { returns(T.nilable(String)) }
      attr_reader :cardholder_middle_name

      sig { params(cardholder_middle_name: String).void }
      attr_writer :cardholder_middle_name

      # The postal code of the cardholder's address.
      sig { returns(T.nilable(String)) }
      attr_reader :cardholder_postal_code

      sig { params(cardholder_postal_code: String).void }
      attr_writer :cardholder_postal_code

      # The cardholder's street address.
      sig { returns(T.nilable(String)) }
      attr_reader :cardholder_street_address

      sig { params(cardholder_street_address: String).void }
      attr_writer :cardholder_street_address

      sig do
        params(
          account_id: String,
          card_token_id: String,
          merchant_category_code: String,
          merchant_city_name: String,
          merchant_name: String,
          merchant_postal_code: String,
          merchant_state: String,
          cardholder_first_name: String,
          cardholder_last_name: String,
          cardholder_middle_name: String,
          cardholder_postal_code: String,
          cardholder_street_address: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Account from which to send the validation.
        account_id:,
        # The Increase identifier for the Card Token that represents the card number
        # you're validating.
        card_token_id:,
        # A four-digit code (MCC) identifying the type of business or service provided by
        # the merchant.
        merchant_category_code:,
        # The city where the merchant (typically your business) is located.
        merchant_city_name:,
        # The merchant name that will appear in the cardholder’s statement descriptor.
        # Typically your business name.
        merchant_name:,
        # The postal code for the merchant’s (typically your business’s) location.
        merchant_postal_code:,
        # The U.S. state where the merchant (typically your business) is located.
        merchant_state:,
        # The cardholder's first name.
        cardholder_first_name: nil,
        # The cardholder's last name.
        cardholder_last_name: nil,
        # The cardholder's middle name.
        cardholder_middle_name: nil,
        # The postal code of the cardholder's address.
        cardholder_postal_code: nil,
        # The cardholder's street address.
        cardholder_street_address: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            card_token_id: String,
            merchant_category_code: String,
            merchant_city_name: String,
            merchant_name: String,
            merchant_postal_code: String,
            merchant_state: String,
            cardholder_first_name: String,
            cardholder_last_name: String,
            cardholder_middle_name: String,
            cardholder_postal_code: String,
            cardholder_street_address: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
