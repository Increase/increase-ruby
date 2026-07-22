# frozen_string_literal: true

module Increase
  module Resources
    class CardValidations
      # Create a Card Validation
      #
      # @overload create(account_id:, card_token_id:, merchant_category_code:, merchant_city_name:, merchant_name:, merchant_postal_code:, merchant_state:, cardholder_first_name: nil, cardholder_last_name: nil, cardholder_middle_name: nil, cardholder_postal_code: nil, cardholder_street_address: nil, request_options: {})
      #
      # @param account_id [String] The identifier of the Account from which to send the validation.
      #
      # @param card_token_id [String]
      #   The Increase identifier for the Card Token that represents the card number
      #   you're validating.
      #
      # @param merchant_category_code [String]
      #   A four-digit code (MCC) identifying the type of business or service provided by
      #   the merchant.
      #
      # @param merchant_city_name [String] The city where the merchant (typically your business) is located.
      #
      # @param merchant_name [String]
      #   The merchant name that will appear in the cardholder’s statement descriptor.
      #   Typically your business name.
      #
      # @param merchant_postal_code [String]
      #   The postal code for the merchant’s (typically your business’s) location.
      #
      # @param merchant_state [String] The U.S. state where the merchant (typically your business) is located.
      #
      # @param cardholder_first_name [String] The cardholder's first name.
      #
      # @param cardholder_last_name [String] The cardholder's last name.
      #
      # @param cardholder_middle_name [String] The cardholder's middle name.
      #
      # @param cardholder_postal_code [String] The postal code of the cardholder's address.
      #
      # @param cardholder_street_address [String] The cardholder's street address.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardValidation]
      #
      # @see Increase::Models::CardValidationCreateParams
      def create(params)
        parsed, options = Increase::CardValidationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "card_validations",
          body: parsed,
          model: Increase::CardValidation,
          options: options
        )
      end

      # Retrieve a Card Validation
      #
      # @overload retrieve(card_validation_id, request_options: {})
      #
      # @param card_validation_id [String] The identifier of the Card Validation.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardValidation]
      #
      # @see Increase::Models::CardValidationRetrieveParams
      def retrieve(card_validation_id, params = {})
        @client.request(
          method: :get,
          path: ["card_validations/%1$s", card_validation_id],
          model: Increase::CardValidation,
          options: params[:request_options]
        )
      end

      # List Card Validations
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Card Validations to ones belonging to the specified Account.
      #
      # @param created_at [Increase::Models::CardValidationListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String]
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
      #
      # @param status [Increase::Models::CardValidationListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::CardValidation>]
      #
      # @see Increase::Models::CardValidationListParams
      def list(params = {})
        parsed, options = Increase::CardValidationListParams.dump_request(params)
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "card_validations",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::CardValidation,
          options: options
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
