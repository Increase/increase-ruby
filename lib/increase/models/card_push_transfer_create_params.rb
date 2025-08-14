# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardPushTransfers#create
    class CardPushTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute amount
      #   The transfer amount in USD cents. For Card Push transfers, must be positive.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute business_application_identifier
      #   The Business Application Identifier describes the type of transaction being
      #   performed. Your program must be approved for the specified Business Application
      #   Identifier in order to use it.
      #
      #   @return [Symbol, Increase::Models::CardPushTransferCreateParams::BusinessApplicationIdentifier]
      required :business_application_identifier,
               enum: -> { Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier }

      # @!attribute card_token_id
      #   The Increase identifier for the Card Token that represents the card number
      #   you're pushing funds to.
      #
      #   @return [String]
      required :card_token_id, String

      # @!attribute merchant_category_code
      #   The merchant category code (MCC) of the merchant (generally your business)
      #   sending the transfer. This is a four-digit code that describes the type of
      #   business or service provided by the merchant. Your program must be approved for
      #   the specified MCC in order to use it.
      #
      #   @return [String]
      required :merchant_category_code, String

      # @!attribute merchant_city_name
      #   The city name of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_city_name, String

      # @!attribute merchant_name
      #   The merchant name shows up as the statement descriptor for the transfer. This is
      #   typically the name of your business or organization.
      #
      #   @return [String]
      required :merchant_name, String

      # @!attribute merchant_name_prefix
      #   For certain Business Application Identifiers, the statement descriptor is
      #   `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
      #   four character prefix that identifies the merchant.
      #
      #   @return [String]
      required :merchant_name_prefix, String

      # @!attribute merchant_postal_code
      #   The postal code of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_postal_code, String

      # @!attribute merchant_state
      #   The state of the merchant (generally your business) sending the transfer.
      #
      #   @return [String]
      required :merchant_state, String

      # @!attribute recipient_name
      #   The name of the funds recipient.
      #
      #   @return [String]
      required :recipient_name, String

      # @!attribute sender_address_city
      #   The city of the sender.
      #
      #   @return [String]
      required :sender_address_city, String

      # @!attribute sender_address_line1
      #   The address line 1 of the sender.
      #
      #   @return [String]
      required :sender_address_line1, String

      # @!attribute sender_address_postal_code
      #   The postal code of the sender.
      #
      #   @return [String]
      required :sender_address_postal_code, String

      # @!attribute sender_address_state
      #   The state of the sender.
      #
      #   @return [String]
      required :sender_address_state, String

      # @!attribute sender_name
      #   The name of the funds originator.
      #
      #   @return [String]
      required :sender_name, String

      # @!attribute source_account_number_id
      #   The identifier of the Account Number from which to send the transfer.
      #
      #   @return [String]
      required :source_account_number_id, String

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!method initialize(amount:, business_application_identifier:, card_token_id:, merchant_category_code:, merchant_city_name:, merchant_name:, merchant_name_prefix:, merchant_postal_code:, merchant_state:, recipient_name:, sender_address_city:, sender_address_line1:, sender_address_postal_code:, sender_address_state:, sender_name:, source_account_number_id:, require_approval: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardPushTransferCreateParams} for more details.
      #
      #   @param amount [Integer] The transfer amount in USD cents. For Card Push transfers, must be positive.
      #
      #   @param business_application_identifier [Symbol, Increase::Models::CardPushTransferCreateParams::BusinessApplicationIdentifier] The Business Application Identifier describes the type of transaction being perf
      #
      #   @param card_token_id [String] The Increase identifier for the Card Token that represents the card number you'r
      #
      #   @param merchant_category_code [String] The merchant category code (MCC) of the merchant (generally your business) sendi
      #
      #   @param merchant_city_name [String] The city name of the merchant (generally your business) sending the transfer.
      #
      #   @param merchant_name [String] The merchant name shows up as the statement descriptor for the transfer. This is
      #
      #   @param merchant_name_prefix [String] For certain Business Application Identifiers, the statement descriptor is `merch
      #
      #   @param merchant_postal_code [String] The postal code of the merchant (generally your business) sending the transfer.
      #
      #   @param merchant_state [String] The state of the merchant (generally your business) sending the transfer.
      #
      #   @param recipient_name [String] The name of the funds recipient.
      #
      #   @param sender_address_city [String] The city of the sender.
      #
      #   @param sender_address_line1 [String] The address line 1 of the sender.
      #
      #   @param sender_address_postal_code [String] The postal code of the sender.
      #
      #   @param sender_address_state [String] The state of the sender.
      #
      #   @param sender_name [String] The name of the funds originator.
      #
      #   @param source_account_number_id [String] The identifier of the Account Number from which to send the transfer.
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      module BusinessApplicationIdentifier
        extend Increase::Internal::Type::Enum

        # Account to Account
        ACCOUNT_TO_ACCOUNT = :account_to_account

        # Business to Business
        BUSINESS_TO_BUSINESS = :business_to_business

        # Money Transfer Bank Initiated
        MONEY_TRANSFER_BANK_INITIATED = :money_transfer_bank_initiated

        # Non-Card Bill Payment
        NON_CARD_BILL_PAYMENT = :non_card_bill_payment

        # Consumer Bill Payment
        CONSUMER_BILL_PAYMENT = :consumer_bill_payment

        # Card Bill Payment
        CARD_BILL_PAYMENT = :card_bill_payment

        # Funds Disbursement
        FUNDS_DISBURSEMENT = :funds_disbursement

        # Funds Transfer
        FUNDS_TRANSFER = :funds_transfer

        # Loyalty and Offers
        LOYALTY_AND_OFFERS = :loyalty_and_offers

        # Merchant Disbursement
        MERCHANT_DISBURSEMENT = :merchant_disbursement

        # Merchant Payment
        MERCHANT_PAYMENT = :merchant_payment

        # Person to Person
        PERSON_TO_PERSON = :person_to_person

        # Top Up
        TOP_UP = :top_up

        # Wallet Transfer
        WALLET_TRANSFER = :wallet_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
