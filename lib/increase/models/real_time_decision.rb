# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimeDecisions#retrieve
    class RealTimeDecision < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Real-Time Decision identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute card_authentication
      #   Fields related to a 3DS authentication attempt.
      #
      #   @return [Increase::Models::RealTimeDecision::CardAuthentication, nil]
      required :card_authentication, -> { Increase::RealTimeDecision::CardAuthentication }, nil?: true

      # @!attribute card_authentication_challenge
      #   Fields related to a 3DS authentication attempt.
      #
      #   @return [Increase::Models::RealTimeDecision::CardAuthenticationChallenge, nil]
      required :card_authentication_challenge,
               -> { Increase::RealTimeDecision::CardAuthenticationChallenge },
               nil?: true

      # @!attribute card_authorization
      #   Fields related to a card authorization.
      #
      #   @return [Increase::Models::RealTimeDecision::CardAuthorization, nil]
      required :card_authorization, -> { Increase::RealTimeDecision::CardAuthorization }, nil?: true

      # @!attribute category
      #   The category of the Real-Time Decision.
      #
      #   @return [Symbol, Increase::Models::RealTimeDecision::Category]
      required :category, enum: -> { Increase::RealTimeDecision::Category }

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Real-Time Decision was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute digital_wallet_authentication
      #   Fields related to a digital wallet authentication attempt.
      #
      #   @return [Increase::Models::RealTimeDecision::DigitalWalletAuthentication, nil]
      required :digital_wallet_authentication,
               -> { Increase::RealTimeDecision::DigitalWalletAuthentication },
               nil?: true

      # @!attribute digital_wallet_token
      #   Fields related to a digital wallet token provisioning attempt.
      #
      #   @return [Increase::Models::RealTimeDecision::DigitalWalletToken, nil]
      required :digital_wallet_token, -> { Increase::RealTimeDecision::DigitalWalletToken }, nil?: true

      # @!attribute status
      #   The status of the Real-Time Decision.
      #
      #   @return [Symbol, Increase::Models::RealTimeDecision::Status]
      required :status, enum: -> { Increase::RealTimeDecision::Status }

      # @!attribute timeout_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   your application can no longer respond to the Real-Time Decision.
      #
      #   @return [Time]
      required :timeout_at, Time

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `real_time_decision`.
      #
      #   @return [Symbol, Increase::Models::RealTimeDecision::Type]
      required :type, enum: -> { Increase::RealTimeDecision::Type }

      # @!method initialize(id:, card_authentication:, card_authentication_challenge:, card_authorization:, category:, created_at:, digital_wallet_authentication:, digital_wallet_token:, status:, timeout_at:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::RealTimeDecision} for more details.
      #
      #   Real Time Decisions are created when your application needs to take action in
      #   real-time to some event such as a card authorization. For more information, see
      #   our
      #   [Real-Time Decisions guide](https://increase.com/documentation/real-time-decisions).
      #
      #   @param id [String] The Real-Time Decision identifier.
      #
      #   @param card_authentication [Increase::Models::RealTimeDecision::CardAuthentication, nil] Fields related to a 3DS authentication attempt.
      #
      #   @param card_authentication_challenge [Increase::Models::RealTimeDecision::CardAuthenticationChallenge, nil] Fields related to a 3DS authentication attempt.
      #
      #   @param card_authorization [Increase::Models::RealTimeDecision::CardAuthorization, nil] Fields related to a card authorization.
      #
      #   @param category [Symbol, Increase::Models::RealTimeDecision::Category] The category of the Real-Time Decision.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param digital_wallet_authentication [Increase::Models::RealTimeDecision::DigitalWalletAuthentication, nil] Fields related to a digital wallet authentication attempt.
      #
      #   @param digital_wallet_token [Increase::Models::RealTimeDecision::DigitalWalletToken, nil] Fields related to a digital wallet token provisioning attempt.
      #
      #   @param status [Symbol, Increase::Models::RealTimeDecision::Status] The status of the Real-Time Decision.
      #
      #   @param timeout_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which yo
      #
      #   @param type [Symbol, Increase::Models::RealTimeDecision::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::RealTimeDecision#card_authentication
      class CardAuthentication < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The identifier of the Account the card belongs to.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute card_id
        #   The identifier of the Card that is being tokenized.
        #
        #   @return [String]
        required :card_id, String

        # @!attribute decision
        #   Whether or not the authentication attempt was approved.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthentication::Decision, nil]
        required :decision, enum: -> { Increase::RealTimeDecision::CardAuthentication::Decision }, nil?: true

        # @!attribute upcoming_card_payment_id
        #   The identifier of the Card Payment this authentication attempt will belong to.
        #   Available in the API once the card authentication has completed.
        #
        #   @return [String]
        required :upcoming_card_payment_id, String

        # @!method initialize(account_id:, card_id:, decision:, upcoming_card_payment_id:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RealTimeDecision::CardAuthentication} for more details.
        #
        #   Fields related to a 3DS authentication attempt.
        #
        #   @param account_id [String] The identifier of the Account the card belongs to.
        #
        #   @param card_id [String] The identifier of the Card that is being tokenized.
        #
        #   @param decision [Symbol, Increase::Models::RealTimeDecision::CardAuthentication::Decision, nil] Whether or not the authentication attempt was approved.
        #
        #   @param upcoming_card_payment_id [String] The identifier of the Card Payment this authentication attempt will belong to. A

        # Whether or not the authentication attempt was approved.
        #
        # @see Increase::Models::RealTimeDecision::CardAuthentication#decision
        module Decision
          extend Increase::Internal::Type::Enum

          # Approve the authentication attempt without triggering a challenge.
          APPROVE = :approve

          # Request further validation before approving the authentication attempt.
          CHALLENGE = :challenge

          # Deny the authentication attempt.
          DENY = :deny

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::RealTimeDecision#card_authentication_challenge
      class CardAuthenticationChallenge < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The identifier of the Account the card belongs to.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute card_id
        #   The identifier of the Card that is being tokenized.
        #
        #   @return [String]
        required :card_id, String

        # @!attribute card_payment_id
        #   The identifier of the Card Payment this authentication challenge attempt belongs
        #   to.
        #
        #   @return [String]
        required :card_payment_id, String

        # @!attribute one_time_code
        #   The one-time code delivered to the cardholder.
        #
        #   @return [String]
        required :one_time_code, String

        # @!attribute result
        #   Whether or not the challenge was delivered to the cardholder.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthenticationChallenge::Result, nil]
        required :result,
                 enum: -> {
                   Increase::RealTimeDecision::CardAuthenticationChallenge::Result
                 },
                 nil?: true

        # @!method initialize(account_id:, card_id:, card_payment_id:, one_time_code:, result:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RealTimeDecision::CardAuthenticationChallenge} for more
        #   details.
        #
        #   Fields related to a 3DS authentication attempt.
        #
        #   @param account_id [String] The identifier of the Account the card belongs to.
        #
        #   @param card_id [String] The identifier of the Card that is being tokenized.
        #
        #   @param card_payment_id [String] The identifier of the Card Payment this authentication challenge attempt belongs
        #
        #   @param one_time_code [String] The one-time code delivered to the cardholder.
        #
        #   @param result [Symbol, Increase::Models::RealTimeDecision::CardAuthenticationChallenge::Result, nil] Whether or not the challenge was delivered to the cardholder.

        # Whether or not the challenge was delivered to the cardholder.
        #
        # @see Increase::Models::RealTimeDecision::CardAuthenticationChallenge#result
        module Result
          extend Increase::Internal::Type::Enum

          # Your application successfully delivered the one-time code to the cardholder.
          SUCCESS = :success

          # Your application was unable to deliver the one-time code to the cardholder.
          FAILURE = :failure

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::RealTimeDecision#card_authorization
      class CardAuthorization < Increase::Internal::Type::BaseModel
        # @!attribute account_id
        #   The identifier of the Account the authorization will debit.
        #
        #   @return [String]
        required :account_id, String

        # @!attribute additional_amounts
        #   Additional amounts associated with the card authorization, such as ATM
        #   surcharges fees. These are usually a subset of the `amount` field and are used
        #   to provide more detailed information about the transaction.
        #
        #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts]
        required :additional_amounts, -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts }

        # @!attribute card_id
        #   The identifier of the Card that is being authorized.
        #
        #   @return [String]
        required :card_id, String

        # @!attribute decision
        #   Whether or not the authorization was approved.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Decision, nil]
        required :decision, enum: -> { Increase::RealTimeDecision::CardAuthorization::Decision }, nil?: true

        # @!attribute decline
        #   Present if and only if `decision` is `decline`. Contains information related to
        #   the reason the authorization was declined.
        #
        #   @return [Increase::Models::RealTimeDecision::CardAuthorization::Decline, nil]
        required :decline, -> { Increase::RealTimeDecision::CardAuthorization::Decline }, nil?: true

        # @!attribute digital_wallet_token_id
        #   If the authorization was made via a Digital Wallet Token (such as an Apple Pay
        #   purchase), the identifier of the token that was used.
        #
        #   @return [String, nil]
        required :digital_wallet_token_id, String, nil?: true

        # @!attribute direction
        #   The direction describes the direction the funds will move, either from the
        #   cardholder to the merchant or from the merchant to the cardholder.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Direction]
        required :direction, enum: -> { Increase::RealTimeDecision::CardAuthorization::Direction }

        # @!attribute merchant_acceptor_id
        #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
        #   is transacting with.
        #
        #   @return [String]
        required :merchant_acceptor_id, String

        # @!attribute merchant_category_code
        #   The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        #   card is transacting with.
        #
        #   @return [String]
        required :merchant_category_code, String

        # @!attribute merchant_city
        #   The city the merchant resides in.
        #
        #   @return [String, nil]
        required :merchant_city, String, nil?: true

        # @!attribute merchant_country
        #   The country the merchant resides in.
        #
        #   @return [String]
        required :merchant_country, String

        # @!attribute merchant_descriptor
        #   The merchant descriptor of the merchant the card is transacting with.
        #
        #   @return [String]
        required :merchant_descriptor, String

        # @!attribute merchant_postal_code
        #   The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
        #   ZIP code, where the first 5 and last 4 are separated by a dash.
        #
        #   @return [String, nil]
        required :merchant_postal_code, String, nil?: true

        # @!attribute merchant_state
        #   The state the merchant resides in.
        #
        #   @return [String, nil]
        required :merchant_state, String, nil?: true

        # @!attribute network_details
        #   Fields specific to the `network`.
        #
        #   @return [Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails]
        required :network_details, -> { Increase::RealTimeDecision::CardAuthorization::NetworkDetails }

        # @!attribute network_identifiers
        #   Network-specific identifiers for a specific request or transaction.
        #
        #   @return [Increase::Models::RealTimeDecision::CardAuthorization::NetworkIdentifiers]
        required :network_identifiers, -> { Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers }

        # @!attribute network_risk_score
        #   The risk score generated by the card network. For Visa this is the Visa Advanced
        #   Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
        #   score is from 0 to 999, where 999 is the riskiest.
        #
        #   @return [Integer, nil]
        required :network_risk_score, Integer, nil?: true

        # @!attribute physical_card_id
        #   If the authorization was made in-person with a physical card, the Physical Card
        #   that was used.
        #
        #   @return [String, nil]
        required :physical_card_id, String, nil?: true

        # @!attribute presentment_amount
        #   The amount of the attempted authorization in the currency the card user sees at
        #   the time of purchase, in the minor unit of that currency. For dollars, for
        #   example, this is cents.
        #
        #   @return [Integer]
        required :presentment_amount, Integer

        # @!attribute presentment_currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
        #   user sees at the time of purchase.
        #
        #   @return [String]
        required :presentment_currency, String

        # @!attribute processing_category
        #   The processing category describes the intent behind the authorization, such as
        #   whether it was used for bill payments or an automatic fuel dispenser.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::ProcessingCategory]
        required :processing_category,
                 enum: -> { Increase::RealTimeDecision::CardAuthorization::ProcessingCategory }

        # @!attribute request_details
        #   Fields specific to the type of request, such as an incremental authorization.
        #
        #   @return [Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails]
        required :request_details, -> { Increase::RealTimeDecision::CardAuthorization::RequestDetails }

        # @!attribute settlement_amount
        #   The amount of the attempted authorization in the currency it will be settled in.
        #   This currency is the same as that of the Account the card belongs to.
        #
        #   @return [Integer]
        required :settlement_amount, Integer

        # @!attribute settlement_currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
        #   transaction will be settled in.
        #
        #   @return [String]
        required :settlement_currency, String

        # @!attribute terminal_id
        #   The terminal identifier (commonly abbreviated as TID) of the terminal the card
        #   is transacting with.
        #
        #   @return [String, nil]
        required :terminal_id, String, nil?: true

        # @!attribute upcoming_card_payment_id
        #   The identifier of the Card Payment this authorization will belong to. Available
        #   in the API once the card authorization has completed.
        #
        #   @return [String]
        required :upcoming_card_payment_id, String

        # @!attribute verification
        #   Fields related to verification of cardholder-provided values.
        #
        #   @return [Increase::Models::RealTimeDecision::CardAuthorization::Verification]
        required :verification, -> { Increase::RealTimeDecision::CardAuthorization::Verification }

        # @!method initialize(account_id:, additional_amounts:, card_id:, decision:, decline:, digital_wallet_token_id:, direction:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_descriptor:, merchant_postal_code:, merchant_state:, network_details:, network_identifiers:, network_risk_score:, physical_card_id:, presentment_amount:, presentment_currency:, processing_category:, request_details:, settlement_amount:, settlement_currency:, terminal_id:, upcoming_card_payment_id:, verification:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RealTimeDecision::CardAuthorization} for more details.
        #
        #   Fields related to a card authorization.
        #
        #   @param account_id [String] The identifier of the Account the authorization will debit.
        #
        #   @param additional_amounts [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts] Additional amounts associated with the card authorization, such as ATM surcharge
        #
        #   @param card_id [String] The identifier of the Card that is being authorized.
        #
        #   @param decision [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Decision, nil] Whether or not the authorization was approved.
        #
        #   @param decline [Increase::Models::RealTimeDecision::CardAuthorization::Decline, nil] Present if and only if `decision` is `decline`. Contains information related to
        #
        #   @param digital_wallet_token_id [String, nil] If the authorization was made via a Digital Wallet Token (such as an Apple Pay p
        #
        #   @param direction [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Direction] The direction describes the direction the funds will move, either from the cardh
        #
        #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
        #
        #   @param merchant_category_code [String] The Merchant Category Code (commonly abbreviated as MCC) of the merchant the car
        #
        #   @param merchant_city [String, nil] The city the merchant resides in.
        #
        #   @param merchant_country [String] The country the merchant resides in.
        #
        #   @param merchant_descriptor [String] The merchant descriptor of the merchant the card is transacting with.
        #
        #   @param merchant_postal_code [String, nil] The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
        #
        #   @param merchant_state [String, nil] The state the merchant resides in.
        #
        #   @param network_details [Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails] Fields specific to the `network`.
        #
        #   @param network_identifiers [Increase::Models::RealTimeDecision::CardAuthorization::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
        #
        #   @param network_risk_score [Integer, nil] The risk score generated by the card network. For Visa this is the Visa Advanced
        #
        #   @param physical_card_id [String, nil] If the authorization was made in-person with a physical card, the Physical Card
        #
        #   @param presentment_amount [Integer] The amount of the attempted authorization in the currency the card user sees at
        #
        #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
        #
        #   @param processing_category [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::ProcessingCategory] The processing category describes the intent behind the authorization, such as w
        #
        #   @param request_details [Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails] Fields specific to the type of request, such as an incremental authorization.
        #
        #   @param settlement_amount [Integer] The amount of the attempted authorization in the currency it will be settled in.
        #
        #   @param settlement_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
        #
        #   @param terminal_id [String, nil] The terminal identifier (commonly abbreviated as TID) of the terminal the card i
        #
        #   @param upcoming_card_payment_id [String] The identifier of the Card Payment this authorization will belong to. Available
        #
        #   @param verification [Increase::Models::RealTimeDecision::CardAuthorization::Verification] Fields related to verification of cardholder-provided values.

        # @see Increase::Models::RealTimeDecision::CardAuthorization#additional_amounts
        class AdditionalAmounts < Increase::Internal::Type::BaseModel
          # @!attribute clinic
          #   The part of this transaction amount that was for clinic-related services.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic, nil]
          required :clinic,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic },
                   nil?: true

          # @!attribute dental
          #   The part of this transaction amount that was for dental-related services.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental, nil]
          required :dental,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental },
                   nil?: true

          # @!attribute original
          #   The original pre-authorized amount.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original, nil]
          required :original,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original },
                   nil?: true

          # @!attribute prescription
          #   The part of this transaction amount that was for healthcare prescriptions.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription, nil]
          required :prescription,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription },
                   nil?: true

          # @!attribute surcharge
          #   The surcharge amount charged for this transaction by the merchant.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge, nil]
          required :surcharge,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge },
                   nil?: true

          # @!attribute total_cumulative
          #   The total amount of a series of incremental authorizations, optionally provided.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative, nil]
          required :total_cumulative,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative },
                   nil?: true

          # @!attribute total_healthcare
          #   The total amount of healthcare-related additional amounts.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare, nil]
          required :total_healthcare,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare },
                   nil?: true

          # @!attribute transit
          #   The part of this transaction amount that was for transit-related services.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit, nil]
          required :transit,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit },
                   nil?: true

          # @!attribute unknown
          #   An unknown additional amount.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown, nil]
          required :unknown,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown },
                   nil?: true

          # @!attribute vision
          #   The part of this transaction amount that was for vision-related services.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision, nil]
          required :vision,
                   -> { Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision },
                   nil?: true

          # @!method initialize(clinic:, dental:, original:, prescription:, surcharge:, total_cumulative:, total_healthcare:, transit:, unknown:, vision:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts} for
          #   more details.
          #
          #   Additional amounts associated with the card authorization, such as ATM
          #   surcharges fees. These are usually a subset of the `amount` field and are used
          #   to provide more detailed information about the transaction.
          #
          #   @param clinic [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic, nil] The part of this transaction amount that was for clinic-related services.
          #
          #   @param dental [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental, nil] The part of this transaction amount that was for dental-related services.
          #
          #   @param original [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original, nil] The original pre-authorized amount.
          #
          #   @param prescription [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription, nil] The part of this transaction amount that was for healthcare prescriptions.
          #
          #   @param surcharge [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge, nil] The surcharge amount charged for this transaction by the merchant.
          #
          #   @param total_cumulative [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative, nil] The total amount of a series of incremental authorizations, optionally provided.
          #
          #   @param total_healthcare [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare, nil] The total amount of healthcare-related additional amounts.
          #
          #   @param transit [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit, nil] The part of this transaction amount that was for transit-related services.
          #
          #   @param unknown [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown, nil] An unknown additional amount.
          #
          #   @param vision [Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision, nil] The part of this transaction amount that was for vision-related services.

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#clinic
          class Clinic < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic}
            #   for more details.
            #
            #   The part of this transaction amount that was for clinic-related services.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#dental
          class Dental < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental}
            #   for more details.
            #
            #   The part of this transaction amount that was for dental-related services.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#original
          class Original < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original}
            #   for more details.
            #
            #   The original pre-authorized amount.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#prescription
          class Prescription < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription}
            #   for more details.
            #
            #   The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#surcharge
          class Surcharge < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge}
            #   for more details.
            #
            #   The surcharge amount charged for this transaction by the merchant.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#total_cumulative
          class TotalCumulative < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative}
            #   for more details.
            #
            #   The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#total_healthcare
          class TotalHealthcare < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare}
            #   for more details.
            #
            #   The total amount of healthcare-related additional amounts.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#transit
          class Transit < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit}
            #   for more details.
            #
            #   The part of this transaction amount that was for transit-related services.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#unknown
          class Unknown < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown}
            #   for more details.
            #
            #   An unknown additional amount.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts#vision
          class Vision < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The amount in minor units of the `currency` field. The amount is positive if it
            #   is added to the amount (such as an ATM surcharge fee) and negative if it is
            #   subtracted from the amount (such as a discount).
            #
            #   @return [Integer]
            required :amount, Integer

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            #   amount's currency.
            #
            #   @return [String]
            required :currency, String

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision}
            #   for more details.
            #
            #   The part of this transaction amount that was for vision-related services.
            #
            #   @param amount [Integer] The amount in minor units of the `currency` field. The amount is positive if it
            #
            #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
          end
        end

        # Whether or not the authorization was approved.
        #
        # @see Increase::Models::RealTimeDecision::CardAuthorization#decision
        module Decision
          extend Increase::Internal::Type::Enum

          # Approve the authorization.
          APPROVE = :approve

          # Decline the authorization.
          DECLINE = :decline

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::RealTimeDecision::CardAuthorization#decline
        class Decline < Increase::Internal::Type::BaseModel
          # @!attribute reason
          #   The reason the authorization was declined.
          #
          #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Decline::Reason]
          required :reason, enum: -> { Increase::RealTimeDecision::CardAuthorization::Decline::Reason }

          # @!method initialize(reason:)
          #   Present if and only if `decision` is `decline`. Contains information related to
          #   the reason the authorization was declined.
          #
          #   @param reason [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Decline::Reason] The reason the authorization was declined.

          # The reason the authorization was declined.
          #
          # @see Increase::Models::RealTimeDecision::CardAuthorization::Decline#reason
          module Reason
            extend Increase::Internal::Type::Enum

            # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
            INSUFFICIENT_FUNDS = :insufficient_funds

            # This type of transaction is not allowed for this card. This transaction should not be retried.
            TRANSACTION_NEVER_ALLOWED = :transaction_never_allowed

            # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
            EXCEEDS_APPROVAL_LIMIT = :exceeds_approval_limit

            # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
            CARD_TEMPORARILY_DISABLED = :card_temporarily_disabled

            # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
            SUSPECTED_FRAUD = :suspected_fraud

            # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The direction describes the direction the funds will move, either from the
        # cardholder to the merchant or from the merchant to the cardholder.
        #
        # @see Increase::Models::RealTimeDecision::CardAuthorization#direction
        module Direction
          extend Increase::Internal::Type::Enum

          # A regular card authorization where funds are debited from the cardholder.
          SETTLEMENT = :settlement

          # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
          REFUND = :refund

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::RealTimeDecision::CardAuthorization#network_details
        class NetworkDetails < Increase::Internal::Type::BaseModel
          # @!attribute category
          #   The payment network used to process this card authorization.
          #
          #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Category]
          required :category, enum: -> { Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category }

          # @!attribute pulse
          #   Fields specific to the `pulse` network.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Pulse, nil]
          required :pulse,
                   -> {
                     Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Pulse
                   },
                   nil?: true

          # @!attribute visa
          #   Fields specific to the `visa` network.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa, nil]
          required :visa,
                   -> {
                     Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa
                   },
                   nil?: true

          # @!method initialize(category:, pulse:, visa:)
          #   Fields specific to the `network`.
          #
          #   @param category [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Category] The payment network used to process this card authorization.
          #
          #   @param pulse [Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Pulse, nil] Fields specific to the `pulse` network.
          #
          #   @param visa [Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa, nil] Fields specific to the `visa` network.

          # The payment network used to process this card authorization.
          #
          # @see Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails#category
          module Category
            extend Increase::Internal::Type::Enum

            # Visa
            VISA = :visa

            # Pulse
            PULSE = :pulse

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails#pulse
          class Pulse < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Fields specific to the `pulse` network.
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails#visa
          class Visa < Increase::Internal::Type::BaseModel
            # @!attribute electronic_commerce_indicator
            #   For electronic commerce transactions, this identifies the level of security used
            #   in obtaining the customer's payment credential. For mail or telephone order
            #   transactions, identifies the type of mail or telephone order.
            #
            #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator, nil]
            required :electronic_commerce_indicator,
                     enum: -> {
                       Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator
                     },
                     nil?: true

            # @!attribute point_of_service_entry_mode
            #   The method used to enter the cardholder's primary account number and card
            #   expiration date.
            #
            #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode, nil]
            required :point_of_service_entry_mode,
                     enum: -> {
                       Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode
                     },
                     nil?: true

            # @!attribute stand_in_processing_reason
            #   Only present when `actioner: network`. Describes why a card authorization was
            #   approved or declined by Visa through stand-in processing.
            #
            #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason, nil]
            required :stand_in_processing_reason,
                     enum: -> {
                       Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason
                     },
                     nil?: true

            # @!method initialize(electronic_commerce_indicator:, point_of_service_entry_mode:, stand_in_processing_reason:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa}
            #   for more details.
            #
            #   Fields specific to the `visa` network.
            #
            #   @param electronic_commerce_indicator [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator, nil] For electronic commerce transactions, this identifies the level of security used
            #
            #   @param point_of_service_entry_mode [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode, nil] The method used to enter the cardholder's primary account number and card expira
            #
            #   @param stand_in_processing_reason [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason, nil] Only present when `actioner: network`. Describes why a card authorization was ap

            # For electronic commerce transactions, this identifies the level of security used
            # in obtaining the customer's payment credential. For mail or telephone order
            # transactions, identifies the type of mail or telephone order.
            #
            # @see Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa#electronic_commerce_indicator
            module ElectronicCommerceIndicator
              extend Increase::Internal::Type::Enum

              # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
              MAIL_PHONE_ORDER = :mail_phone_order

              # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
              RECURRING = :recurring

              # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
              INSTALLMENT = :installment

              # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
              UNKNOWN_MAIL_PHONE_ORDER = :unknown_mail_phone_order

              # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
              SECURE_ELECTRONIC_COMMERCE = :secure_electronic_commerce

              # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
              NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                :non_authenticated_security_transaction_at_3ds_capable_merchant

              # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
              NON_AUTHENTICATED_SECURITY_TRANSACTION = :non_authenticated_security_transaction

              # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
              NON_SECURE_TRANSACTION = :non_secure_transaction

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # The method used to enter the cardholder's primary account number and card
            # expiration date.
            #
            # @see Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa#point_of_service_entry_mode
            module PointOfServiceEntryMode
              extend Increase::Internal::Type::Enum

              # Unknown
              UNKNOWN = :unknown

              # Manual key entry
              MANUAL = :manual

              # Magnetic stripe read, without card verification value
              MAGNETIC_STRIPE_NO_CVV = :magnetic_stripe_no_cvv

              # Optical code
              OPTICAL_CODE = :optical_code

              # Contact chip card
              INTEGRATED_CIRCUIT_CARD = :integrated_circuit_card

              # Contactless read of chip card
              CONTACTLESS = :contactless

              # Transaction initiated using a credential that has previously been stored on file
              CREDENTIAL_ON_FILE = :credential_on_file

              # Magnetic stripe read
              MAGNETIC_STRIPE = :magnetic_stripe

              # Contactless read of magnetic stripe data
              CONTACTLESS_MAGNETIC_STRIPE = :contactless_magnetic_stripe

              # Contact chip card, without card verification value
              INTEGRATED_CIRCUIT_CARD_NO_CVV = :integrated_circuit_card_no_cvv

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Only present when `actioner: network`. Describes why a card authorization was
            # approved or declined by Visa through stand-in processing.
            #
            # @see Increase::Models::RealTimeDecision::CardAuthorization::NetworkDetails::Visa#stand_in_processing_reason
            module StandInProcessingReason
              extend Increase::Internal::Type::Enum

              # Increase failed to process the authorization in a timely manner.
              ISSUER_ERROR = :issuer_error

              # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
              INVALID_PHYSICAL_CARD = :invalid_physical_card

              # The 3DS cardholder authentication verification value was invalid.
              INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                :invalid_cardholder_authentication_verification_value

              # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
              INTERNAL_VISA_ERROR = :internal_visa_error

              # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
              MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                :merchant_transaction_advisory_service_authentication_required

              # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
              PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK = :payment_fraud_disruption_acquirer_block

              # An unspecific reason for stand-in processing.
              OTHER = :other

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # @see Increase::Models::RealTimeDecision::CardAuthorization#network_identifiers
        class NetworkIdentifiers < Increase::Internal::Type::BaseModel
          # @!attribute authorization_identification_response
          #   The randomly generated 6-character Authorization Identification Response code
          #   sent back to the acquirer in an approved response.
          #
          #   @return [String, nil]
          required :authorization_identification_response, String, nil?: true

          # @!attribute retrieval_reference_number
          #   A life-cycle identifier used across e.g., an authorization and a reversal.
          #   Expected to be unique per acquirer within a window of time. For some card
          #   networks the retrieval reference number includes the trace counter.
          #
          #   @return [String, nil]
          required :retrieval_reference_number, String, nil?: true

          # @!attribute trace_number
          #   A counter used to verify an individual authorization. Expected to be unique per
          #   acquirer within a window of time.
          #
          #   @return [String, nil]
          required :trace_number, String, nil?: true

          # @!attribute transaction_id
          #   A globally unique transaction identifier provided by the card network, used
          #   across multiple life-cycle requests.
          #
          #   @return [String, nil]
          required :transaction_id, String, nil?: true

          # @!method initialize(authorization_identification_response:, retrieval_reference_number:, trace_number:, transaction_id:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::RealTimeDecision::CardAuthorization::NetworkIdentifiers} for
          #   more details.
          #
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @param authorization_identification_response [String, nil] The randomly generated 6-character Authorization Identification Response code se
          #
          #   @param retrieval_reference_number [String, nil] A life-cycle identifier used across e.g., an authorization and a reversal. Expec
          #
          #   @param trace_number [String, nil] A counter used to verify an individual authorization. Expected to be unique per
          #
          #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
        end

        # The processing category describes the intent behind the authorization, such as
        # whether it was used for bill payments or an automatic fuel dispenser.
        #
        # @see Increase::Models::RealTimeDecision::CardAuthorization#processing_category
        module ProcessingCategory
          extend Increase::Internal::Type::Enum

          # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
          ACCOUNT_FUNDING = :account_funding

          # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
          AUTOMATIC_FUEL_DISPENSER = :automatic_fuel_dispenser

          # A transaction used to pay a bill.
          BILL_PAYMENT = :bill_payment

          # Original credit transactions are used to send money to a cardholder.
          ORIGINAL_CREDIT = :original_credit

          # A regular purchase.
          PURCHASE = :purchase

          # Quasi-cash transactions represent purchases of items which may be convertible to cash.
          QUASI_CASH = :quasi_cash

          # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
          REFUND = :refund

          # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
          CASH_DISBURSEMENT = :cash_disbursement

          # The processing category is unknown.
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::RealTimeDecision::CardAuthorization#request_details
        class RequestDetails < Increase::Internal::Type::BaseModel
          # @!attribute category
          #   The type of this request (e.g., an initial authorization or an incremental
          #   authorization).
          #
          #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails::Category]
          required :category, enum: -> { Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category }

          # @!attribute incremental_authorization
          #   Fields specific to the category `incremental_authorization`.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization, nil]
          required :incremental_authorization,
                   -> {
                     Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization
                   },
                   nil?: true

          # @!attribute initial_authorization
          #   Fields specific to the category `initial_authorization`.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails::InitialAuthorization, nil]
          required :initial_authorization,
                   -> { Increase::RealTimeDecision::CardAuthorization::RequestDetails::InitialAuthorization },
                   nil?: true

          # @!method initialize(category:, incremental_authorization:, initial_authorization:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails} for more
          #   details.
          #
          #   Fields specific to the type of request, such as an incremental authorization.
          #
          #   @param category [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails::Category] The type of this request (e.g., an initial authorization or an incremental autho
          #
          #   @param incremental_authorization [Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization, nil] Fields specific to the category `incremental_authorization`.
          #
          #   @param initial_authorization [Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails::InitialAuthorization, nil] Fields specific to the category `initial_authorization`.

          # The type of this request (e.g., an initial authorization or an incremental
          # authorization).
          #
          # @see Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails#category
          module Category
            extend Increase::Internal::Type::Enum

            # A regular, standalone authorization.
            INITIAL_AUTHORIZATION = :initial_authorization

            # An incremental request to increase the amount of an existing authorization.
            INCREMENTAL_AUTHORIZATION = :incremental_authorization

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails#incremental_authorization
          class IncrementalAuthorization < Increase::Internal::Type::BaseModel
            # @!attribute card_payment_id
            #   The card payment for this authorization and increment.
            #
            #   @return [String]
            required :card_payment_id, String

            # @!attribute original_card_authorization_id
            #   The identifier of the card authorization this request is attempting to
            #   increment.
            #
            #   @return [String]
            required :original_card_authorization_id, String

            # @!method initialize(card_payment_id:, original_card_authorization_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization}
            #   for more details.
            #
            #   Fields specific to the category `incremental_authorization`.
            #
            #   @param card_payment_id [String] The card payment for this authorization and increment.
            #
            #   @param original_card_authorization_id [String] The identifier of the card authorization this request is attempting to increment
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::RequestDetails#initial_authorization
          class InitialAuthorization < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Fields specific to the category `initial_authorization`.
          end
        end

        # @see Increase::Models::RealTimeDecision::CardAuthorization#verification
        class Verification < Increase::Internal::Type::BaseModel
          # @!attribute card_verification_code
          #   Fields related to verification of the Card Verification Code, a 3-digit code on
          #   the back of the card.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode]
          required :card_verification_code,
                   -> { Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode }

          # @!attribute cardholder_address
          #   Cardholder address provided in the authorization request and the address on file
          #   we verified it against.
          #
          #   @return [Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardholderAddress]
          required :cardholder_address,
                   -> { Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress }

          # @!method initialize(card_verification_code:, cardholder_address:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::RealTimeDecision::CardAuthorization::Verification} for more
          #   details.
          #
          #   Fields related to verification of cardholder-provided values.
          #
          #   @param card_verification_code [Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode] Fields related to verification of the Card Verification Code, a 3-digit code on
          #
          #   @param cardholder_address [Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardholderAddress] Cardholder address provided in the authorization request and the address on file

          # @see Increase::Models::RealTimeDecision::CardAuthorization::Verification#card_verification_code
          class CardVerificationCode < Increase::Internal::Type::BaseModel
            # @!attribute result
            #   The result of verifying the Card Verification Code.
            #
            #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result]
            required :result,
                     enum: -> { Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result }

            # @!method initialize(result:)
            #   Fields related to verification of the Card Verification Code, a 3-digit code on
            #   the back of the card.
            #
            #   @param result [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result] The result of verifying the Card Verification Code.

            # The result of verifying the Card Verification Code.
            #
            # @see Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode#result
            module Result
              extend Increase::Internal::Type::Enum

              # No card verification code was provided in the authorization request.
              NOT_CHECKED = :not_checked

              # The card verification code matched the one on file.
              MATCH = :match

              # The card verification code did not match the one on file.
              NO_MATCH = :no_match

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::RealTimeDecision::CardAuthorization::Verification#cardholder_address
          class CardholderAddress < Increase::Internal::Type::BaseModel
            # @!attribute actual_line1
            #   Line 1 of the address on file for the cardholder.
            #
            #   @return [String, nil]
            required :actual_line1, String, nil?: true

            # @!attribute actual_postal_code
            #   The postal code of the address on file for the cardholder.
            #
            #   @return [String, nil]
            required :actual_postal_code, String, nil?: true

            # @!attribute provided_line1
            #   The cardholder address line 1 provided for verification in the authorization
            #   request.
            #
            #   @return [String, nil]
            required :provided_line1, String, nil?: true

            # @!attribute provided_postal_code
            #   The postal code provided for verification in the authorization request.
            #
            #   @return [String, nil]
            required :provided_postal_code, String, nil?: true

            # @!attribute result
            #   The address verification result returned to the card network.
            #
            #   @return [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result]
            required :result,
                     enum: -> { Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result }

            # @!method initialize(actual_line1:, actual_postal_code:, provided_line1:, provided_postal_code:, result:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardholderAddress}
            #   for more details.
            #
            #   Cardholder address provided in the authorization request and the address on file
            #   we verified it against.
            #
            #   @param actual_line1 [String, nil] Line 1 of the address on file for the cardholder.
            #
            #   @param actual_postal_code [String, nil] The postal code of the address on file for the cardholder.
            #
            #   @param provided_line1 [String, nil] The cardholder address line 1 provided for verification in the authorization req
            #
            #   @param provided_postal_code [String, nil] The postal code provided for verification in the authorization request.
            #
            #   @param result [Symbol, Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result] The address verification result returned to the card network.

            # The address verification result returned to the card network.
            #
            # @see Increase::Models::RealTimeDecision::CardAuthorization::Verification::CardholderAddress#result
            module Result
              extend Increase::Internal::Type::Enum

              # No address information was provided in the authorization request.
              NOT_CHECKED = :not_checked

              # Postal code matches, but the street address does not match or was not provided.
              POSTAL_CODE_MATCH_ADDRESS_NO_MATCH = :postal_code_match_address_no_match

              # Postal code does not match, but the street address matches or was not provided.
              POSTAL_CODE_NO_MATCH_ADDRESS_MATCH = :postal_code_no_match_address_match

              # Postal code and street address match.
              MATCH = :match

              # Postal code and street address do not match.
              NO_MATCH = :no_match

              # Postal code matches, but the street address was not verified. (deprecated)
              POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED = :postal_code_match_address_not_checked

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end

      # The category of the Real-Time Decision.
      #
      # @see Increase::Models::RealTimeDecision#category
      module Category
        extend Increase::Internal::Type::Enum

        # A card is being authorized.
        CARD_AUTHORIZATION_REQUESTED = :card_authorization_requested

        # 3DS authentication is requested.
        CARD_AUTHENTICATION_REQUESTED = :card_authentication_requested

        # 3DS authentication challenge requires cardholder involvement.
        CARD_AUTHENTICATION_CHALLENGE_REQUESTED = :card_authentication_challenge_requested

        # A card is being loaded into a digital wallet.
        DIGITAL_WALLET_TOKEN_REQUESTED = :digital_wallet_token_requested

        # A card is being loaded into a digital wallet and requires cardholder authentication.
        DIGITAL_WALLET_AUTHENTICATION_REQUESTED = :digital_wallet_authentication_requested

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::RealTimeDecision#digital_wallet_authentication
      class DigitalWalletAuthentication < Increase::Internal::Type::BaseModel
        # @!attribute card_id
        #   The identifier of the Card that is being tokenized.
        #
        #   @return [String]
        required :card_id, String

        # @!attribute channel
        #   The channel to send the card user their one-time passcode.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::DigitalWalletAuthentication::Channel]
        required :channel, enum: -> { Increase::RealTimeDecision::DigitalWalletAuthentication::Channel }

        # @!attribute digital_wallet
        #   The digital wallet app being used.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet]
        required :digital_wallet,
                 enum: -> { Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet }

        # @!attribute email
        #   The email to send the one-time passcode to if `channel` is equal to `email`.
        #
        #   @return [String, nil]
        required :email, String, nil?: true

        # @!attribute one_time_passcode
        #   The one-time passcode to send the card user.
        #
        #   @return [String]
        required :one_time_passcode, String

        # @!attribute phone
        #   The phone number to send the one-time passcode to if `channel` is equal to
        #   `sms`.
        #
        #   @return [String, nil]
        required :phone, String, nil?: true

        # @!attribute result
        #   Whether your application successfully delivered the one-time passcode.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::DigitalWalletAuthentication::Result, nil]
        required :result,
                 enum: -> {
                   Increase::RealTimeDecision::DigitalWalletAuthentication::Result
                 },
                 nil?: true

        # @!method initialize(card_id:, channel:, digital_wallet:, email:, one_time_passcode:, phone:, result:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RealTimeDecision::DigitalWalletAuthentication} for more
        #   details.
        #
        #   Fields related to a digital wallet authentication attempt.
        #
        #   @param card_id [String] The identifier of the Card that is being tokenized.
        #
        #   @param channel [Symbol, Increase::Models::RealTimeDecision::DigitalWalletAuthentication::Channel] The channel to send the card user their one-time passcode.
        #
        #   @param digital_wallet [Symbol, Increase::Models::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet] The digital wallet app being used.
        #
        #   @param email [String, nil] The email to send the one-time passcode to if `channel` is equal to `email`.
        #
        #   @param one_time_passcode [String] The one-time passcode to send the card user.
        #
        #   @param phone [String, nil] The phone number to send the one-time passcode to if `channel` is equal to `sms`
        #
        #   @param result [Symbol, Increase::Models::RealTimeDecision::DigitalWalletAuthentication::Result, nil] Whether your application successfully delivered the one-time passcode.

        # The channel to send the card user their one-time passcode.
        #
        # @see Increase::Models::RealTimeDecision::DigitalWalletAuthentication#channel
        module Channel
          extend Increase::Internal::Type::Enum

          # Send one-time passcodes over SMS.
          SMS = :sms

          # Send one-time passcodes over email.
          EMAIL = :email

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The digital wallet app being used.
        #
        # @see Increase::Models::RealTimeDecision::DigitalWalletAuthentication#digital_wallet
        module DigitalWallet
          extend Increase::Internal::Type::Enum

          # Apple Pay
          APPLE_PAY = :apple_pay

          # Google Pay
          GOOGLE_PAY = :google_pay

          # Samsung Pay
          SAMSUNG_PAY = :samsung_pay

          # Unknown
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Whether your application successfully delivered the one-time passcode.
        #
        # @see Increase::Models::RealTimeDecision::DigitalWalletAuthentication#result
        module Result
          extend Increase::Internal::Type::Enum

          # Your application successfully delivered the one-time passcode to the cardholder.
          SUCCESS = :success

          # Your application failed to deliver the one-time passcode to the cardholder.
          FAILURE = :failure

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::RealTimeDecision#digital_wallet_token
      class DigitalWalletToken < Increase::Internal::Type::BaseModel
        # @!attribute card_id
        #   The identifier of the Card that is being tokenized.
        #
        #   @return [String]
        required :card_id, String

        # @!attribute decision
        #   Whether or not the provisioning request was approved. This will be null until
        #   the real time decision is responded to.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::DigitalWalletToken::Decision, nil]
        required :decision, enum: -> { Increase::RealTimeDecision::DigitalWalletToken::Decision }, nil?: true

        # @!attribute device
        #   Device that is being used to provision the digital wallet token.
        #
        #   @return [Increase::Models::RealTimeDecision::DigitalWalletToken::Device]
        required :device, -> { Increase::RealTimeDecision::DigitalWalletToken::Device }

        # @!attribute digital_wallet
        #   The digital wallet app being used.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecision::DigitalWalletToken::DigitalWallet]
        required :digital_wallet, enum: -> { Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet }

        # @!method initialize(card_id:, decision:, device:, digital_wallet:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RealTimeDecision::DigitalWalletToken} for more details.
        #
        #   Fields related to a digital wallet token provisioning attempt.
        #
        #   @param card_id [String] The identifier of the Card that is being tokenized.
        #
        #   @param decision [Symbol, Increase::Models::RealTimeDecision::DigitalWalletToken::Decision, nil] Whether or not the provisioning request was approved. This will be null until th
        #
        #   @param device [Increase::Models::RealTimeDecision::DigitalWalletToken::Device] Device that is being used to provision the digital wallet token.
        #
        #   @param digital_wallet [Symbol, Increase::Models::RealTimeDecision::DigitalWalletToken::DigitalWallet] The digital wallet app being used.

        # Whether or not the provisioning request was approved. This will be null until
        # the real time decision is responded to.
        #
        # @see Increase::Models::RealTimeDecision::DigitalWalletToken#decision
        module Decision
          extend Increase::Internal::Type::Enum

          # Approve the provisioning request.
          APPROVE = :approve

          # Decline the provisioning request.
          DECLINE = :decline

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::RealTimeDecision::DigitalWalletToken#device
        class Device < Increase::Internal::Type::BaseModel
          # @!attribute identifier
          #   ID assigned to the device by the digital wallet provider.
          #
          #   @return [String, nil]
          required :identifier, String, nil?: true

          # @!method initialize(identifier:)
          #   Device that is being used to provision the digital wallet token.
          #
          #   @param identifier [String, nil] ID assigned to the device by the digital wallet provider.
        end

        # The digital wallet app being used.
        #
        # @see Increase::Models::RealTimeDecision::DigitalWalletToken#digital_wallet
        module DigitalWallet
          extend Increase::Internal::Type::Enum

          # Apple Pay
          APPLE_PAY = :apple_pay

          # Google Pay
          GOOGLE_PAY = :google_pay

          # Samsung Pay
          SAMSUNG_PAY = :samsung_pay

          # Unknown
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The status of the Real-Time Decision.
      #
      # @see Increase::Models::RealTimeDecision#status
      module Status
        extend Increase::Internal::Type::Enum

        # The decision is pending action via real-time webhook.
        PENDING = :pending

        # Your webhook actioned the real-time decision.
        RESPONDED = :responded

        # Your webhook failed to respond to the authorization in time.
        TIMED_OUT = :timed_out

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `real_time_decision`.
      #
      # @see Increase::Models::RealTimeDecision#type
      module Type
        extend Increase::Internal::Type::Enum

        REAL_TIME_DECISION = :real_time_decision

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
