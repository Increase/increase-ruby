# frozen_string_literal: true

module Increase
  module Models
    module Simulations
      # @see Increase::Resources::Simulations::CardAuthorizations#create
      class CardAuthorizationCreateParams < Increase::Internal::Type::BaseModel
        # @!parse
        #   extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        # @!attribute amount
        #   The authorization amount in cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute [r] authenticated_card_payment_id
        #   The identifier of a Card Payment with a `card_authentication` if you want to
        #     simulate an authenticated authorization.
        #
        #   @return [String, nil]
        optional :authenticated_card_payment_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :authenticated_card_payment_id

        # @!attribute [r] card_id
        #   The identifier of the Card to be authorized.
        #
        #   @return [String, nil]
        optional :card_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :card_id

        # @!attribute [r] decline_reason
        #   Forces a card decline with a specific reason. No real time decision will be
        #     sent.
        #
        #   @return [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::DeclineReason, nil]
        optional :decline_reason,
                 enum: -> { Increase::Models::Simulations::CardAuthorizationCreateParams::DeclineReason }

        # @!parse
        #   # @return [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::DeclineReason]
        #   attr_writer :decline_reason

        # @!attribute [r] digital_wallet_token_id
        #   The identifier of the Digital Wallet Token to be authorized.
        #
        #   @return [String, nil]
        optional :digital_wallet_token_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :digital_wallet_token_id

        # @!attribute [r] direction
        #   The direction describes the direction the funds will move, either from the
        #     cardholder to the merchant or from the merchant to the cardholder.
        #
        #   @return [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::Direction, nil]
        optional :direction, enum: -> { Increase::Models::Simulations::CardAuthorizationCreateParams::Direction }

        # @!parse
        #   # @return [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::Direction]
        #   attr_writer :direction

        # @!attribute [r] event_subscription_id
        #   The identifier of the Event Subscription to use. If provided, will override the
        #     default real time event subscription. Because you can only create one real time
        #     decision event subscription, you can use this field to route events to any
        #     specified event subscription for testing purposes.
        #
        #   @return [String, nil]
        optional :event_subscription_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :event_subscription_id

        # @!attribute [r] merchant_acceptor_id
        #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
        #     is transacting with.
        #
        #   @return [String, nil]
        optional :merchant_acceptor_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :merchant_acceptor_id

        # @!attribute [r] merchant_category_code
        #   The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        #     card is transacting with.
        #
        #   @return [String, nil]
        optional :merchant_category_code, String

        # @!parse
        #   # @return [String]
        #   attr_writer :merchant_category_code

        # @!attribute [r] merchant_city
        #   The city the merchant resides in.
        #
        #   @return [String, nil]
        optional :merchant_city, String

        # @!parse
        #   # @return [String]
        #   attr_writer :merchant_city

        # @!attribute [r] merchant_country
        #   The country the merchant resides in.
        #
        #   @return [String, nil]
        optional :merchant_country, String

        # @!parse
        #   # @return [String]
        #   attr_writer :merchant_country

        # @!attribute [r] merchant_descriptor
        #   The merchant descriptor of the merchant the card is transacting with.
        #
        #   @return [String, nil]
        optional :merchant_descriptor, String

        # @!parse
        #   # @return [String]
        #   attr_writer :merchant_descriptor

        # @!attribute [r] merchant_state
        #   The state the merchant resides in.
        #
        #   @return [String, nil]
        optional :merchant_state, String

        # @!parse
        #   # @return [String]
        #   attr_writer :merchant_state

        # @!attribute [r] network_details
        #   Fields specific to a given card network.
        #
        #   @return [Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails, nil]
        optional :network_details,
                 -> { Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails }

        # @!parse
        #   # @return [Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails]
        #   attr_writer :network_details

        # @!attribute [r] network_risk_score
        #   The risk score generated by the card network. For Visa this is the Visa Advanced
        #     Authorization risk score, from 0 to 99, where 99 is the riskiest.
        #
        #   @return [Integer, nil]
        optional :network_risk_score, Integer

        # @!parse
        #   # @return [Integer]
        #   attr_writer :network_risk_score

        # @!attribute [r] physical_card_id
        #   The identifier of the Physical Card to be authorized.
        #
        #   @return [String, nil]
        optional :physical_card_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :physical_card_id

        # @!attribute [r] terminal_id
        #   The terminal identifier (commonly abbreviated as TID) of the terminal the card
        #     is transacting with.
        #
        #   @return [String, nil]
        optional :terminal_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :terminal_id

        # @!parse
        #   # @param amount [Integer]
        #   # @param authenticated_card_payment_id [String]
        #   # @param card_id [String]
        #   # @param decline_reason [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::DeclineReason]
        #   # @param digital_wallet_token_id [String]
        #   # @param direction [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::Direction]
        #   # @param event_subscription_id [String]
        #   # @param merchant_acceptor_id [String]
        #   # @param merchant_category_code [String]
        #   # @param merchant_city [String]
        #   # @param merchant_country [String]
        #   # @param merchant_descriptor [String]
        #   # @param merchant_state [String]
        #   # @param network_details [Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails]
        #   # @param network_risk_score [Integer]
        #   # @param physical_card_id [String]
        #   # @param terminal_id [String]
        #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(
        #     amount:,
        #     authenticated_card_payment_id: nil,
        #     card_id: nil,
        #     decline_reason: nil,
        #     digital_wallet_token_id: nil,
        #     direction: nil,
        #     event_subscription_id: nil,
        #     merchant_acceptor_id: nil,
        #     merchant_category_code: nil,
        #     merchant_city: nil,
        #     merchant_country: nil,
        #     merchant_descriptor: nil,
        #     merchant_state: nil,
        #     network_details: nil,
        #     network_risk_score: nil,
        #     physical_card_id: nil,
        #     terminal_id: nil,
        #     request_options: {},
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # Forces a card decline with a specific reason. No real time decision will be
        #   sent.
        module DeclineReason
          extend Increase::Internal::Type::Enum

          # The account has been closed.
          ACCOUNT_CLOSED = :account_closed

          # The Card was not active.
          CARD_NOT_ACTIVE = :card_not_active

          # The Card has been canceled.
          CARD_CANCELED = :card_canceled

          # The Physical Card was not active.
          PHYSICAL_CARD_NOT_ACTIVE = :physical_card_not_active

          # The account's entity was not active.
          ENTITY_NOT_ACTIVE = :entity_not_active

          # The account was inactive.
          GROUP_LOCKED = :group_locked

          # The Card's Account did not have a sufficient available balance.
          INSUFFICIENT_FUNDS = :insufficient_funds

          # The given CVV2 did not match the card's value.
          CVV2_MISMATCH = :cvv2_mismatch

          # The given expiration date did not match the card's value. Only applies when a CVV2 is present.
          CARD_EXPIRATION_MISMATCH = :card_expiration_mismatch

          # The attempted card transaction is not allowed per Increase's terms.
          TRANSACTION_NOT_ALLOWED = :transaction_not_allowed

          # The transaction was blocked by a Limit.
          BREACHES_LIMIT = :breaches_limit

          # Your application declined the transaction via webhook.
          WEBHOOK_DECLINED = :webhook_declined

          # Your application webhook did not respond without the required timeout.
          WEBHOOK_TIMED_OUT = :webhook_timed_out

          # Declined by stand-in processing.
          DECLINED_BY_STAND_IN_PROCESSING = :declined_by_stand_in_processing

          # The card read had an invalid CVV, dCVV, or authorization request cryptogram.
          INVALID_PHYSICAL_CARD = :invalid_physical_card

          # The original card authorization for this incremental authorization does not exist.
          MISSING_ORIGINAL_AUTHORIZATION = :missing_original_authorization

          # The transaction was suspected to be fraudulent. Please reach out to support@increase.com for more information.
          SUSPECTED_FRAUD = :suspected_fraud

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        # The direction describes the direction the funds will move, either from the
        #   cardholder to the merchant or from the merchant to the cardholder.
        module Direction
          extend Increase::Internal::Type::Enum

          # A regular card authorization where funds are debited from the cardholder.
          SETTLEMENT = :settlement

          # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
          REFUND = :refund

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        class NetworkDetails < Increase::Internal::Type::BaseModel
          # @!attribute visa
          #   Fields specific to the Visa network.
          #
          #   @return [Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa]
          required :visa, -> { Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa }

          # @!parse
          #   # Fields specific to a given card network.
          #   #
          #   # @param visa [Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa]
          #   #
          #   def initialize(visa:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # @see Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails#visa
          class Visa < Increase::Internal::Type::BaseModel
            # @!attribute [r] stand_in_processing_reason
            #   The reason code for the stand-in processing.
            #
            #   @return [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason, nil]
            optional :stand_in_processing_reason,
                     enum: -> { Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason }

            # @!parse
            #   # @return [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason]
            #   attr_writer :stand_in_processing_reason

            # @!parse
            #   # Fields specific to the Visa network.
            #   #
            #   # @param stand_in_processing_reason [Symbol, Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason]
            #   #
            #   def initialize(stand_in_processing_reason: nil, **) = super

            # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

            # The reason code for the stand-in processing.
            #
            # @see Increase::Models::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa#stand_in_processing_reason
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

              finalize!

              # @!parse
              #   # @return [Array<Symbol>]
              #   def self.values; end
            end
          end
        end
      end
    end
  end
end
