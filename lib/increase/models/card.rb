# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#create
    class Card < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The card identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the account this card belongs to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute authorization_controls
      #   Controls that restrict how this card can be used.
      #
      #   @return [Increase::Models::Card::AuthorizationControls, nil]
      required :authorization_controls, -> { Increase::Card::AuthorizationControls }, nil?: true

      # @!attribute billing_address
      #   The Card's billing address.
      #
      #   @return [Increase::Models::Card::BillingAddress]
      required :billing_address, -> { Increase::Card::BillingAddress }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Card was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute description
      #   The card's description for display purposes.
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute digital_wallet
      #   The contact information used in the two-factor steps for digital wallet card
      #   creation. At least one field must be present to complete the digital wallet
      #   steps.
      #
      #   @return [Increase::Models::Card::DigitalWallet, nil]
      required :digital_wallet, -> { Increase::Card::DigitalWallet }, nil?: true

      # @!attribute entity_id
      #   The identifier for the entity associated with this card.
      #
      #   @return [String, nil]
      required :entity_id, String, nil?: true

      # @!attribute expiration_month
      #   The month the card expires in M format (e.g., August is 8).
      #
      #   @return [Integer]
      required :expiration_month, Integer

      # @!attribute expiration_year
      #   The year the card expires in YYYY format (e.g., 2025).
      #
      #   @return [Integer]
      required :expiration_year, Integer

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute last4
      #   The last 4 digits of the Card's Primary Account Number.
      #
      #   @return [String]
      required :last4, String

      # @!attribute status
      #   This indicates if payments can be made with the card.
      #
      #   @return [Symbol, Increase::Models::Card::Status]
      required :status, enum: -> { Increase::Card::Status }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card`.
      #
      #   @return [Symbol, Increase::Models::Card::Type]
      required :type, enum: -> { Increase::Card::Type }

      # @!method initialize(id:, account_id:, authorization_controls:, billing_address:, created_at:, description:, digital_wallet:, entity_id:, expiration_month:, expiration_year:, idempotency_key:, last4:, status:, type:)
      #   Some parameter documentations has been truncated, see {Increase::Models::Card}
      #   for more details.
      #
      #   Cards are commercial credit cards. They'll immediately work for online purchases
      #   after you create them. All cards maintain a credit limit of 100% of the
      #   Account’s available balance at the time of transaction. Funds are deducted from
      #   the Account upon transaction settlement.
      #
      #   @param id [String] The card identifier.
      #
      #   @param account_id [String] The identifier for the account this card belongs to.
      #
      #   @param authorization_controls [Increase::Models::Card::AuthorizationControls, nil] Controls that restrict how this card can be used.
      #
      #   @param billing_address [Increase::Models::Card::BillingAddress] The Card's billing address.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param description [String, nil] The card's description for display purposes.
      #
      #   @param digital_wallet [Increase::Models::Card::DigitalWallet, nil] The contact information used in the two-factor steps for digital wallet card cre
      #
      #   @param entity_id [String, nil] The identifier for the entity associated with this card.
      #
      #   @param expiration_month [Integer] The month the card expires in M format (e.g., August is 8).
      #
      #   @param expiration_year [Integer] The year the card expires in YYYY format (e.g., 2025).
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param last4 [String] The last 4 digits of the Card's Primary Account Number.
      #
      #   @param status [Symbol, Increase::Models::Card::Status] This indicates if payments can be made with the card.
      #
      #   @param type [Symbol, Increase::Models::Card::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::Card#authorization_controls
      class AuthorizationControls < Increase::Internal::Type::BaseModel
        # @!attribute maximum_authorization_count
        #   Limits the number of authorizations that can be approved on this card.
        #
        #   @return [Increase::Models::Card::AuthorizationControls::MaximumAuthorizationCount, nil]
        required :maximum_authorization_count,
                 -> { Increase::Card::AuthorizationControls::MaximumAuthorizationCount },
                 nil?: true

        # @!attribute merchant_acceptor_identifier
        #   Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
        #   on this card.
        #
        #   @return [Increase::Models::Card::AuthorizationControls::MerchantAcceptorIdentifier, nil]
        required :merchant_acceptor_identifier,
                 -> { Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier },
                 nil?: true

        # @!attribute merchant_category_code
        #   Restricts which Merchant Category Codes are allowed or blocked for
        #   authorizations on this card.
        #
        #   @return [Increase::Models::Card::AuthorizationControls::MerchantCategoryCode, nil]
        required :merchant_category_code,
                 -> { Increase::Card::AuthorizationControls::MerchantCategoryCode },
                 nil?: true

        # @!attribute merchant_country
        #   Restricts which merchant countries are allowed or blocked for authorizations on
        #   this card.
        #
        #   @return [Increase::Models::Card::AuthorizationControls::MerchantCountry, nil]
        required :merchant_country, -> { Increase::Card::AuthorizationControls::MerchantCountry }, nil?: true

        # @!attribute spending_limits
        #   Spending limits for this card. The most restrictive limit applies if multiple
        #   limits match.
        #
        #   @return [Array<Increase::Models::Card::AuthorizationControls::SpendingLimit>, nil]
        required :spending_limits,
                 -> {
                   Increase::Internal::Type::ArrayOf[Increase::Card::AuthorizationControls::SpendingLimit]
                 },
                 nil?: true

        # @!method initialize(maximum_authorization_count:, merchant_acceptor_identifier:, merchant_category_code:, merchant_country:, spending_limits:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Card::AuthorizationControls} for more details.
        #
        #   Controls that restrict how this card can be used.
        #
        #   @param maximum_authorization_count [Increase::Models::Card::AuthorizationControls::MaximumAuthorizationCount, nil] Limits the number of authorizations that can be approved on this card.
        #
        #   @param merchant_acceptor_identifier [Increase::Models::Card::AuthorizationControls::MerchantAcceptorIdentifier, nil] Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
        #
        #   @param merchant_category_code [Increase::Models::Card::AuthorizationControls::MerchantCategoryCode, nil] Restricts which Merchant Category Codes are allowed or blocked for authorization
        #
        #   @param merchant_country [Increase::Models::Card::AuthorizationControls::MerchantCountry, nil] Restricts which merchant countries are allowed or blocked for authorizations on
        #
        #   @param spending_limits [Array<Increase::Models::Card::AuthorizationControls::SpendingLimit>, nil] Spending limits for this card. The most restrictive limit applies if multiple li

        # @see Increase::Models::Card::AuthorizationControls#maximum_authorization_count
        class MaximumAuthorizationCount < Increase::Internal::Type::BaseModel
          # @!attribute all_time
          #   The maximum number of authorizations that can be approved on this card over its
          #   lifetime.
          #
          #   @return [Integer, nil]
          required :all_time, Integer, nil?: true

          # @!method initialize(all_time:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Card::AuthorizationControls::MaximumAuthorizationCount} for
          #   more details.
          #
          #   Limits the number of authorizations that can be approved on this card.
          #
          #   @param all_time [Integer, nil] The maximum number of authorizations that can be approved on this card over its
        end

        # @see Increase::Models::Card::AuthorizationControls#merchant_acceptor_identifier
        class MerchantAcceptorIdentifier < Increase::Internal::Type::BaseModel
          # @!attribute allowed
          #   The Merchant Acceptor IDs that are allowed for authorizations on this card.
          #
          #   @return [Array<Increase::Models::Card::AuthorizationControls::MerchantAcceptorIdentifier::Allowed>, nil]
          required :allowed,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Allowed]
                   },
                   nil?: true

          # @!attribute blocked
          #   The Merchant Acceptor IDs that are blocked for authorizations on this card.
          #
          #   @return [Array<Increase::Models::Card::AuthorizationControls::MerchantAcceptorIdentifier::Blocked>, nil]
          required :blocked,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Blocked]
                   },
                   nil?: true

          # @!method initialize(allowed:, blocked:)
          #   Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
          #   on this card.
          #
          #   @param allowed [Array<Increase::Models::Card::AuthorizationControls::MerchantAcceptorIdentifier::Allowed>, nil] The Merchant Acceptor IDs that are allowed for authorizations on this card.
          #
          #   @param blocked [Array<Increase::Models::Card::AuthorizationControls::MerchantAcceptorIdentifier::Blocked>, nil] The Merchant Acceptor IDs that are blocked for authorizations on this card.

          class Allowed < Increase::Internal::Type::BaseModel
            # @!attribute identifier
            #   The Merchant Acceptor ID.
            #
            #   @return [String]
            required :identifier, String

            # @!method initialize(identifier:)
            #   @param identifier [String] The Merchant Acceptor ID.
          end

          class Blocked < Increase::Internal::Type::BaseModel
            # @!attribute identifier
            #   The Merchant Acceptor ID.
            #
            #   @return [String]
            required :identifier, String

            # @!method initialize(identifier:)
            #   @param identifier [String] The Merchant Acceptor ID.
          end
        end

        # @see Increase::Models::Card::AuthorizationControls#merchant_category_code
        class MerchantCategoryCode < Increase::Internal::Type::BaseModel
          # @!attribute allowed
          #   The Merchant Category Codes that are allowed for authorizations on this card.
          #
          #   @return [Array<Increase::Models::Card::AuthorizationControls::MerchantCategoryCode::Allowed>, nil]
          required :allowed,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::Card::AuthorizationControls::MerchantCategoryCode::Allowed]
                   },
                   nil?: true

          # @!attribute blocked
          #   The Merchant Category Codes that are blocked for authorizations on this card.
          #
          #   @return [Array<Increase::Models::Card::AuthorizationControls::MerchantCategoryCode::Blocked>, nil]
          required :blocked,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::Card::AuthorizationControls::MerchantCategoryCode::Blocked]
                   },
                   nil?: true

          # @!method initialize(allowed:, blocked:)
          #   Restricts which Merchant Category Codes are allowed or blocked for
          #   authorizations on this card.
          #
          #   @param allowed [Array<Increase::Models::Card::AuthorizationControls::MerchantCategoryCode::Allowed>, nil] The Merchant Category Codes that are allowed for authorizations on this card.
          #
          #   @param blocked [Array<Increase::Models::Card::AuthorizationControls::MerchantCategoryCode::Blocked>, nil] The Merchant Category Codes that are blocked for authorizations on this card.

          class Allowed < Increase::Internal::Type::BaseModel
            # @!attribute code
            #   The Merchant Category Code (MCC).
            #
            #   @return [String]
            required :code, String

            # @!method initialize(code:)
            #   @param code [String] The Merchant Category Code (MCC).
          end

          class Blocked < Increase::Internal::Type::BaseModel
            # @!attribute code
            #   The Merchant Category Code (MCC).
            #
            #   @return [String]
            required :code, String

            # @!method initialize(code:)
            #   @param code [String] The Merchant Category Code (MCC).
          end
        end

        # @see Increase::Models::Card::AuthorizationControls#merchant_country
        class MerchantCountry < Increase::Internal::Type::BaseModel
          # @!attribute allowed
          #   The merchant countries that are allowed for authorizations on this card.
          #
          #   @return [Array<Increase::Models::Card::AuthorizationControls::MerchantCountry::Allowed>, nil]
          required :allowed,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::Card::AuthorizationControls::MerchantCountry::Allowed]
                   },
                   nil?: true

          # @!attribute blocked
          #   The merchant countries that are blocked for authorizations on this card.
          #
          #   @return [Array<Increase::Models::Card::AuthorizationControls::MerchantCountry::Blocked>, nil]
          required :blocked,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::Card::AuthorizationControls::MerchantCountry::Blocked]
                   },
                   nil?: true

          # @!method initialize(allowed:, blocked:)
          #   Restricts which merchant countries are allowed or blocked for authorizations on
          #   this card.
          #
          #   @param allowed [Array<Increase::Models::Card::AuthorizationControls::MerchantCountry::Allowed>, nil] The merchant countries that are allowed for authorizations on this card.
          #
          #   @param blocked [Array<Increase::Models::Card::AuthorizationControls::MerchantCountry::Blocked>, nil] The merchant countries that are blocked for authorizations on this card.

          class Allowed < Increase::Internal::Type::BaseModel
            # @!attribute country
            #   The ISO 3166-1 alpha-2 country code.
            #
            #   @return [String]
            required :country, String

            # @!method initialize(country:)
            #   @param country [String] The ISO 3166-1 alpha-2 country code.
          end

          class Blocked < Increase::Internal::Type::BaseModel
            # @!attribute country
            #   The ISO 3166-1 alpha-2 country code.
            #
            #   @return [String]
            required :country, String

            # @!method initialize(country:)
            #   @param country [String] The ISO 3166-1 alpha-2 country code.
          end
        end

        class SpendingLimit < Increase::Internal::Type::BaseModel
          # @!attribute interval
          #   The interval at which the spending limit is enforced.
          #
          #   @return [Symbol, Increase::Models::Card::AuthorizationControls::SpendingLimit::Interval]
          required :interval, enum: -> { Increase::Card::AuthorizationControls::SpendingLimit::Interval }

          # @!attribute merchant_category_codes
          #   The Merchant Category Codes (MCCs) this spending limit applies to. If not set,
          #   the limit applies to all transactions.
          #
          #   @return [Array<Increase::Models::Card::AuthorizationControls::SpendingLimit::MerchantCategoryCode>, nil]
          required :merchant_category_codes,
                   -> {
                     Increase::Internal::Type::ArrayOf[Increase::Card::AuthorizationControls::SpendingLimit::MerchantCategoryCode]
                   },
                   nil?: true

          # @!attribute settlement_amount
          #   The maximum settlement amount permitted in the given interval.
          #
          #   @return [Integer]
          required :settlement_amount, Integer

          # @!method initialize(interval:, merchant_category_codes:, settlement_amount:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::Card::AuthorizationControls::SpendingLimit} for more details.
          #
          #   @param interval [Symbol, Increase::Models::Card::AuthorizationControls::SpendingLimit::Interval] The interval at which the spending limit is enforced.
          #
          #   @param merchant_category_codes [Array<Increase::Models::Card::AuthorizationControls::SpendingLimit::MerchantCategoryCode>, nil] The Merchant Category Codes (MCCs) this spending limit applies to. If not set, t
          #
          #   @param settlement_amount [Integer] The maximum settlement amount permitted in the given interval.

          # The interval at which the spending limit is enforced.
          #
          # @see Increase::Models::Card::AuthorizationControls::SpendingLimit#interval
          module Interval
            extend Increase::Internal::Type::Enum

            # The spending limit applies over the lifetime of the card.
            ALL_TIME = :all_time

            # The spending limit applies per transaction.
            PER_TRANSACTION = :per_transaction

            # The spending limit applies per day. Resets nightly at midnight UTC.
            PER_DAY = :per_day

            # The spending limit applies per week. Resets weekly on Mondays at midnight UTC.
            PER_WEEK = :per_week

            # The spending limit applies per month. Resets on the first of the month, midnight UTC.
            PER_MONTH = :per_month

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class MerchantCategoryCode < Increase::Internal::Type::BaseModel
            # @!attribute code
            #   The Merchant Category Code (MCC).
            #
            #   @return [String]
            required :code, String

            # @!method initialize(code:)
            #   @param code [String] The Merchant Category Code (MCC).
          end
        end
      end

      # @see Increase::Models::Card#billing_address
      class BillingAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the billing address.
        #
        #   @return [String, nil]
        required :city, String, nil?: true

        # @!attribute line1
        #   The first line of the billing address.
        #
        #   @return [String, nil]
        required :line1, String, nil?: true

        # @!attribute line2
        #   The second line of the billing address.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute postal_code
        #   The postal code of the billing address.
        #
        #   @return [String, nil]
        required :postal_code, String, nil?: true

        # @!attribute state
        #   The US state of the billing address.
        #
        #   @return [String, nil]
        required :state, String, nil?: true

        # @!method initialize(city:, line1:, line2:, postal_code:, state:)
        #   The Card's billing address.
        #
        #   @param city [String, nil] The city of the billing address.
        #
        #   @param line1 [String, nil] The first line of the billing address.
        #
        #   @param line2 [String, nil] The second line of the billing address.
        #
        #   @param postal_code [String, nil] The postal code of the billing address.
        #
        #   @param state [String, nil] The US state of the billing address.
      end

      # @see Increase::Models::Card#digital_wallet
      class DigitalWallet < Increase::Internal::Type::BaseModel
        # @!attribute digital_card_profile_id
        #   The digital card profile assigned to this digital card. Card profiles may also
        #   be assigned at the program level.
        #
        #   @return [String, nil]
        required :digital_card_profile_id, String, nil?: true

        # @!attribute email
        #   An email address that can be used to verify the cardholder via one-time passcode
        #   over email.
        #
        #   @return [String, nil]
        required :email, String, nil?: true

        # @!attribute phone
        #   A phone number that can be used to verify the cardholder via one-time passcode
        #   over SMS.
        #
        #   @return [String, nil]
        required :phone, String, nil?: true

        # @!method initialize(digital_card_profile_id:, email:, phone:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::Card::DigitalWallet} for more details.
        #
        #   The contact information used in the two-factor steps for digital wallet card
        #   creation. At least one field must be present to complete the digital wallet
        #   steps.
        #
        #   @param digital_card_profile_id [String, nil] The digital card profile assigned to this digital card. Card profiles may also b
        #
        #   @param email [String, nil] An email address that can be used to verify the cardholder via one-time passcode
        #
        #   @param phone [String, nil] A phone number that can be used to verify the cardholder via one-time passcode o
      end

      # This indicates if payments can be made with the card.
      #
      # @see Increase::Models::Card#status
      module Status
        extend Increase::Internal::Type::Enum

        # The card is active.
        ACTIVE = :active

        # The card is temporarily disabled.
        DISABLED = :disabled

        # The card is permanently canceled.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `card`.
      #
      # @see Increase::Models::Card#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD = :card

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
