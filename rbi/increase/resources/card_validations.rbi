# typed: strong

module Increase
  module Resources
    class CardValidations
      # Create a Card Validation
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
        ).returns(Increase::CardValidation)
      end
      def create(
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

      # Retrieve a Card Validation
      sig do
        params(
          card_validation_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardValidation)
      end
      def retrieve(
        # The identifier of the Card Validation.
        card_validation_id,
        request_options: {}
      )
      end

      # List Card Validations
      sig do
        params(
          account_id: String,
          created_at: Increase::CardValidationListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::CardValidationListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::CardValidationListResponse)
      end
      def list(
        # Filter Card Validations to ones belonging to the specified Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
