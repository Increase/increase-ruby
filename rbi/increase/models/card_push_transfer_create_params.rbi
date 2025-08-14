# typed: strong

module Increase
  module Models
    class CardPushTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardPushTransferCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The transfer amount in USD cents. For Card Push transfers, must be positive.
      sig { returns(Integer) }
      attr_accessor :amount

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      sig do
        returns(
          Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::OrSymbol
        )
      end
      attr_accessor :business_application_identifier

      # The Increase identifier for the Card Token that represents the card number
      # you're pushing funds to.
      sig { returns(String) }
      attr_accessor :card_token_id

      # The merchant category code (MCC) of the merchant (generally your business)
      # sending the transfer. This is a four-digit code that describes the type of
      # business or service provided by the merchant. Your program must be approved for
      # the specified MCC in order to use it.
      sig { returns(String) }
      attr_accessor :merchant_category_code

      # The city name of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_city_name

      # The merchant name shows up as the statement descriptor for the transfer. This is
      # typically the name of your business or organization.
      sig { returns(String) }
      attr_accessor :merchant_name

      # For certain Business Application Identifiers, the statement descriptor is
      # `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
      # four character prefix that identifies the merchant.
      sig { returns(String) }
      attr_accessor :merchant_name_prefix

      # The postal code of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_postal_code

      # The state of the merchant (generally your business) sending the transfer.
      sig { returns(String) }
      attr_accessor :merchant_state

      # The name of the funds recipient.
      sig { returns(String) }
      attr_accessor :recipient_name

      # The city of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_city

      # The address line 1 of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_line1

      # The postal code of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_postal_code

      # The state of the sender.
      sig { returns(String) }
      attr_accessor :sender_address_state

      # The name of the funds originator.
      sig { returns(String) }
      attr_accessor :sender_name

      # The identifier of the Account Number from which to send the transfer.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      sig do
        params(
          amount: Integer,
          business_application_identifier:
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::OrSymbol,
          card_token_id: String,
          merchant_category_code: String,
          merchant_city_name: String,
          merchant_name: String,
          merchant_name_prefix: String,
          merchant_postal_code: String,
          merchant_state: String,
          recipient_name: String,
          sender_address_city: String,
          sender_address_line1: String,
          sender_address_postal_code: String,
          sender_address_state: String,
          sender_name: String,
          source_account_number_id: String,
          require_approval: T::Boolean,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The transfer amount in USD cents. For Card Push transfers, must be positive.
        amount:,
        # The Business Application Identifier describes the type of transaction being
        # performed. Your program must be approved for the specified Business Application
        # Identifier in order to use it.
        business_application_identifier:,
        # The Increase identifier for the Card Token that represents the card number
        # you're pushing funds to.
        card_token_id:,
        # The merchant category code (MCC) of the merchant (generally your business)
        # sending the transfer. This is a four-digit code that describes the type of
        # business or service provided by the merchant. Your program must be approved for
        # the specified MCC in order to use it.
        merchant_category_code:,
        # The city name of the merchant (generally your business) sending the transfer.
        merchant_city_name:,
        # The merchant name shows up as the statement descriptor for the transfer. This is
        # typically the name of your business or organization.
        merchant_name:,
        # For certain Business Application Identifiers, the statement descriptor is
        # `merchant_name_prefix*sender_name`, where the `merchant_name_prefix` is a one to
        # four character prefix that identifies the merchant.
        merchant_name_prefix:,
        # The postal code of the merchant (generally your business) sending the transfer.
        merchant_postal_code:,
        # The state of the merchant (generally your business) sending the transfer.
        merchant_state:,
        # The name of the funds recipient.
        recipient_name:,
        # The city of the sender.
        sender_address_city:,
        # The address line 1 of the sender.
        sender_address_line1:,
        # The postal code of the sender.
        sender_address_postal_code:,
        # The state of the sender.
        sender_address_state:,
        # The name of the funds originator.
        sender_name:,
        # The identifier of the Account Number from which to send the transfer.
        source_account_number_id:,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            amount: Integer,
            business_application_identifier:
              Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::OrSymbol,
            card_token_id: String,
            merchant_category_code: String,
            merchant_city_name: String,
            merchant_name: String,
            merchant_name_prefix: String,
            merchant_postal_code: String,
            merchant_state: String,
            recipient_name: String,
            sender_address_city: String,
            sender_address_line1: String,
            sender_address_postal_code: String,
            sender_address_state: String,
            sender_name: String,
            source_account_number_id: String,
            require_approval: T::Boolean,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The Business Application Identifier describes the type of transaction being
      # performed. Your program must be approved for the specified Business Application
      # Identifier in order to use it.
      module BusinessApplicationIdentifier
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Account to Account
        ACCOUNT_TO_ACCOUNT =
          T.let(
            :account_to_account,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Business to Business
        BUSINESS_TO_BUSINESS =
          T.let(
            :business_to_business,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Money Transfer Bank Initiated
        MONEY_TRANSFER_BANK_INITIATED =
          T.let(
            :money_transfer_bank_initiated,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Non-Card Bill Payment
        NON_CARD_BILL_PAYMENT =
          T.let(
            :non_card_bill_payment,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Consumer Bill Payment
        CONSUMER_BILL_PAYMENT =
          T.let(
            :consumer_bill_payment,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Card Bill Payment
        CARD_BILL_PAYMENT =
          T.let(
            :card_bill_payment,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Funds Disbursement
        FUNDS_DISBURSEMENT =
          T.let(
            :funds_disbursement,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Funds Transfer
        FUNDS_TRANSFER =
          T.let(
            :funds_transfer,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Loyalty and Offers
        LOYALTY_AND_OFFERS =
          T.let(
            :loyalty_and_offers,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Merchant Disbursement
        MERCHANT_DISBURSEMENT =
          T.let(
            :merchant_disbursement,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Merchant Payment
        MERCHANT_PAYMENT =
          T.let(
            :merchant_payment,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Person to Person
        PERSON_TO_PERSON =
          T.let(
            :person_to_person,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Top Up
        TOP_UP =
          T.let(
            :top_up,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        # Wallet Transfer
        WALLET_TRANSFER =
          T.let(
            :wallet_transfer,
            Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::CardPushTransferCreateParams::BusinessApplicationIdentifier::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
