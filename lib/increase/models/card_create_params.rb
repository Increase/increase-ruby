# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Cards#create
    class CardCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Account the card should belong to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute authorization_controls
      #   Controls that restrict how this card can be used.
      #
      #   @return [Increase::Models::CardCreateParams::AuthorizationControls, nil]
      optional :authorization_controls, -> { Increase::CardCreateParams::AuthorizationControls }

      # @!attribute billing_address
      #   The card's billing address.
      #
      #   @return [Increase::Models::CardCreateParams::BillingAddress, nil]
      optional :billing_address, -> { Increase::CardCreateParams::BillingAddress }

      # @!attribute description
      #   The description you choose to give the card.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute digital_wallet
      #   The contact information used in the two-factor steps for digital wallet card
      #   creation. To add the card to a digital wallet, you may supply an email or phone
      #   number with this request. Otherwise, subscribe and then action a Real Time
      #   Decision with the category `digital_wallet_token_requested` or
      #   `digital_wallet_authentication_requested`.
      #
      #   @return [Increase::Models::CardCreateParams::DigitalWallet, nil]
      optional :digital_wallet, -> { Increase::CardCreateParams::DigitalWallet }

      # @!attribute entity_id
      #   The Entity the card belongs to. You only need to supply this in rare situations
      #   when the card is not for the Account holder.
      #
      #   @return [String, nil]
      optional :entity_id, String

      # @!method initialize(account_id:, authorization_controls: nil, billing_address: nil, description: nil, digital_wallet: nil, entity_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardCreateParams} for more details.
      #
      #   @param account_id [String] The Account the card should belong to.
      #
      #   @param authorization_controls [Increase::Models::CardCreateParams::AuthorizationControls] Controls that restrict how this card can be used.
      #
      #   @param billing_address [Increase::Models::CardCreateParams::BillingAddress] The card's billing address.
      #
      #   @param description [String] The description you choose to give the card.
      #
      #   @param digital_wallet [Increase::Models::CardCreateParams::DigitalWallet] The contact information used in the two-factor steps for digital wallet card cre
      #
      #   @param entity_id [String] The Entity the card belongs to. You only need to supply this in rare situations
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class AuthorizationControls < Increase::Internal::Type::BaseModel
        # @!attribute maximum_authorization_count
        #   Limits the number of authorizations that can be approved on this card.
        #
        #   @return [Increase::Models::CardCreateParams::AuthorizationControls::MaximumAuthorizationCount, nil]
        optional :maximum_authorization_count,
                 -> { Increase::CardCreateParams::AuthorizationControls::MaximumAuthorizationCount }

        # @!attribute merchant_acceptor_identifier
        #   Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
        #   on this card.
        #
        #   @return [Increase::Models::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier, nil]
        optional :merchant_acceptor_identifier,
                 -> { Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier }

        # @!attribute merchant_category_code
        #   Restricts which Merchant Category Codes are allowed or blocked for
        #   authorizations on this card.
        #
        #   @return [Increase::Models::CardCreateParams::AuthorizationControls::MerchantCategoryCode, nil]
        optional :merchant_category_code,
                 -> { Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode }

        # @!attribute merchant_country
        #   Restricts which merchant countries are allowed or blocked for authorizations on
        #   this card.
        #
        #   @return [Increase::Models::CardCreateParams::AuthorizationControls::MerchantCountry, nil]
        optional :merchant_country, -> { Increase::CardCreateParams::AuthorizationControls::MerchantCountry }

        # @!attribute spending_limits
        #   Spending limits for this card. The most restrictive limit applies if multiple
        #   limits match.
        #
        #   @return [Array<Increase::Models::CardCreateParams::AuthorizationControls::SpendingLimit>, nil]
        optional :spending_limits,
                 -> { Increase::Internal::Type::ArrayOf[Increase::CardCreateParams::AuthorizationControls::SpendingLimit] }

        # @!method initialize(maximum_authorization_count: nil, merchant_acceptor_identifier: nil, merchant_category_code: nil, merchant_country: nil, spending_limits: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardCreateParams::AuthorizationControls} for more details.
        #
        #   Controls that restrict how this card can be used.
        #
        #   @param maximum_authorization_count [Increase::Models::CardCreateParams::AuthorizationControls::MaximumAuthorizationCount] Limits the number of authorizations that can be approved on this card.
        #
        #   @param merchant_acceptor_identifier [Increase::Models::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier] Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
        #
        #   @param merchant_category_code [Increase::Models::CardCreateParams::AuthorizationControls::MerchantCategoryCode] Restricts which Merchant Category Codes are allowed or blocked for authorization
        #
        #   @param merchant_country [Increase::Models::CardCreateParams::AuthorizationControls::MerchantCountry] Restricts which merchant countries are allowed or blocked for authorizations on
        #
        #   @param spending_limits [Array<Increase::Models::CardCreateParams::AuthorizationControls::SpendingLimit>] Spending limits for this card. The most restrictive limit applies if multiple li

        # @see Increase::Models::CardCreateParams::AuthorizationControls#maximum_authorization_count
        class MaximumAuthorizationCount < Increase::Internal::Type::BaseModel
          # @!attribute all_time
          #   The maximum number of authorizations that can be approved on this card over its
          #   lifetime.
          #
          #   @return [Integer]
          required :all_time, Integer

          # @!method initialize(all_time:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardCreateParams::AuthorizationControls::MaximumAuthorizationCount}
          #   for more details.
          #
          #   Limits the number of authorizations that can be approved on this card.
          #
          #   @param all_time [Integer] The maximum number of authorizations that can be approved on this card over its
        end

        # @see Increase::Models::CardCreateParams::AuthorizationControls#merchant_acceptor_identifier
        class MerchantAcceptorIdentifier < Increase::Internal::Type::BaseModel
          # @!attribute allowed
          #   The Merchant Acceptor IDs that are allowed for authorizations on this card.
          #   Authorizations with Merchant Acceptor IDs not in this list will be declined.
          #
          #   @return [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed>, nil]
          optional :allowed,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed] }

          # @!attribute blocked
          #   The Merchant Acceptor IDs that are blocked for authorizations on this card.
          #   Authorizations with Merchant Acceptor IDs in this list will be declined.
          #
          #   @return [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked>, nil]
          optional :blocked,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked] }

          # @!method initialize(allowed: nil, blocked: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier}
          #   for more details.
          #
          #   Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
          #   on this card.
          #
          #   @param allowed [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed>] The Merchant Acceptor IDs that are allowed for authorizations on this card. Auth
          #
          #   @param blocked [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked>] The Merchant Acceptor IDs that are blocked for authorizations on this card. Auth

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

        # @see Increase::Models::CardCreateParams::AuthorizationControls#merchant_category_code
        class MerchantCategoryCode < Increase::Internal::Type::BaseModel
          # @!attribute allowed
          #   The Merchant Category Codes that are allowed for authorizations on this card.
          #   Authorizations with Merchant Category Codes not in this list will be declined.
          #
          #   @return [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Allowed>, nil]
          optional :allowed,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Allowed] }

          # @!attribute blocked
          #   The Merchant Category Codes that are blocked for authorizations on this card.
          #   Authorizations with Merchant Category Codes in this list will be declined.
          #
          #   @return [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Blocked>, nil]
          optional :blocked,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Blocked] }

          # @!method initialize(allowed: nil, blocked: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardCreateParams::AuthorizationControls::MerchantCategoryCode}
          #   for more details.
          #
          #   Restricts which Merchant Category Codes are allowed or blocked for
          #   authorizations on this card.
          #
          #   @param allowed [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Allowed>] The Merchant Category Codes that are allowed for authorizations on this card. Au
          #
          #   @param blocked [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Blocked>] The Merchant Category Codes that are blocked for authorizations on this card. Au

          class Allowed < Increase::Internal::Type::BaseModel
            # @!attribute code
            #   The Merchant Category Code.
            #
            #   @return [String]
            required :code, String

            # @!method initialize(code:)
            #   @param code [String] The Merchant Category Code.
          end

          class Blocked < Increase::Internal::Type::BaseModel
            # @!attribute code
            #   The Merchant Category Code.
            #
            #   @return [String]
            required :code, String

            # @!method initialize(code:)
            #   @param code [String] The Merchant Category Code.
          end
        end

        # @see Increase::Models::CardCreateParams::AuthorizationControls#merchant_country
        class MerchantCountry < Increase::Internal::Type::BaseModel
          # @!attribute allowed
          #   The merchant countries that are allowed for authorizations on this card.
          #   Authorizations with merchant countries not in this list will be declined.
          #
          #   @return [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantCountry::Allowed>, nil]
          optional :allowed,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Allowed] }

          # @!attribute blocked
          #   The merchant countries that are blocked for authorizations on this card.
          #   Authorizations with merchant countries in this list will be declined.
          #
          #   @return [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantCountry::Blocked>, nil]
          optional :blocked,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Blocked] }

          # @!method initialize(allowed: nil, blocked: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardCreateParams::AuthorizationControls::MerchantCountry} for
          #   more details.
          #
          #   Restricts which merchant countries are allowed or blocked for authorizations on
          #   this card.
          #
          #   @param allowed [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantCountry::Allowed>] The merchant countries that are allowed for authorizations on this card. Authori
          #
          #   @param blocked [Array<Increase::Models::CardCreateParams::AuthorizationControls::MerchantCountry::Blocked>] The merchant countries that are blocked for authorizations on this card. Authori

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
          #   @return [Symbol, Increase::Models::CardCreateParams::AuthorizationControls::SpendingLimit::Interval]
          required :interval,
                   enum: -> { Increase::CardCreateParams::AuthorizationControls::SpendingLimit::Interval }

          # @!attribute settlement_amount
          #   The maximum settlement amount permitted in the given interval.
          #
          #   @return [Integer]
          required :settlement_amount, Integer

          # @!attribute merchant_category_codes
          #   The Merchant Category Codes this spending limit applies to. If not set, the
          #   limit applies to all transactions.
          #
          #   @return [Array<Increase::Models::CardCreateParams::AuthorizationControls::SpendingLimit::MerchantCategoryCode>, nil]
          optional :merchant_category_codes,
                   -> { Increase::Internal::Type::ArrayOf[Increase::CardCreateParams::AuthorizationControls::SpendingLimit::MerchantCategoryCode] }

          # @!method initialize(interval:, settlement_amount:, merchant_category_codes: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardCreateParams::AuthorizationControls::SpendingLimit} for
          #   more details.
          #
          #   @param interval [Symbol, Increase::Models::CardCreateParams::AuthorizationControls::SpendingLimit::Interval] The interval at which the spending limit is enforced.
          #
          #   @param settlement_amount [Integer] The maximum settlement amount permitted in the given interval.
          #
          #   @param merchant_category_codes [Array<Increase::Models::CardCreateParams::AuthorizationControls::SpendingLimit::MerchantCategoryCode>] The Merchant Category Codes this spending limit applies to. If not set, the limi

          # The interval at which the spending limit is enforced.
          #
          # @see Increase::Models::CardCreateParams::AuthorizationControls::SpendingLimit#interval
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
            #   The Merchant Category Code.
            #
            #   @return [String]
            required :code, String

            # @!method initialize(code:)
            #   @param code [String] The Merchant Category Code.
          end
        end
      end

      class BillingAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the billing address.
        #
        #   @return [String]
        required :city, String

        # @!attribute line1
        #   The first line of the billing address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute postal_code
        #   The postal code of the billing address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The US state of the billing address.
        #
        #   @return [String]
        required :state, String

        # @!attribute line2
        #   The second line of the billing address.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!method initialize(city:, line1:, postal_code:, state:, line2: nil)
        #   The card's billing address.
        #
        #   @param city [String] The city of the billing address.
        #
        #   @param line1 [String] The first line of the billing address.
        #
        #   @param postal_code [String] The postal code of the billing address.
        #
        #   @param state [String] The US state of the billing address.
        #
        #   @param line2 [String] The second line of the billing address.
      end

      class DigitalWallet < Increase::Internal::Type::BaseModel
        # @!attribute digital_card_profile_id
        #   The digital card profile assigned to this digital card.
        #
        #   @return [String, nil]
        optional :digital_card_profile_id, String

        # @!attribute email
        #   An email address that can be used to contact and verify the cardholder via
        #   one-time passcode over email.
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute phone
        #   A phone number that can be used to contact and verify the cardholder via
        #   one-time passcode over SMS.
        #
        #   @return [String, nil]
        optional :phone, String

        # @!method initialize(digital_card_profile_id: nil, email: nil, phone: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardCreateParams::DigitalWallet} for more details.
        #
        #   The contact information used in the two-factor steps for digital wallet card
        #   creation. To add the card to a digital wallet, you may supply an email or phone
        #   number with this request. Otherwise, subscribe and then action a Real Time
        #   Decision with the category `digital_wallet_token_requested` or
        #   `digital_wallet_authentication_requested`.
        #
        #   @param digital_card_profile_id [String] The digital card profile assigned to this digital card.
        #
        #   @param email [String] An email address that can be used to contact and verify the cardholder via one-t
        #
        #   @param phone [String] A phone number that can be used to contact and verify the cardholder via one-tim
      end
    end
  end
end
