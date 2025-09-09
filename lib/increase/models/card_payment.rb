# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardPayments#retrieve
    class CardPayment < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Card Payment identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier for the Account the Transaction belongs to.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute card_id
      #   The Card identifier for this payment.
      #
      #   @return [String]
      required :card_id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
      #   Payment was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute digital_wallet_token_id
      #   The Digital Wallet Token identifier for this payment.
      #
      #   @return [String, nil]
      required :digital_wallet_token_id, String, nil?: true

      # @!attribute elements
      #   The interactions related to this card payment.
      #
      #   @return [Array<Increase::Models::CardPayment::Element>]
      required :elements, -> { Increase::Internal::Type::ArrayOf[Increase::CardPayment::Element] }

      # @!attribute physical_card_id
      #   The Physical Card identifier for this payment.
      #
      #   @return [String, nil]
      required :physical_card_id, String, nil?: true

      # @!attribute state
      #   The summarized state of this card payment.
      #
      #   @return [Increase::Models::CardPayment::State]
      required :state, -> { Increase::CardPayment::State }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `card_payment`.
      #
      #   @return [Symbol, Increase::Models::CardPayment::Type]
      required :type, enum: -> { Increase::CardPayment::Type }

      # @!method initialize(id:, account_id:, card_id:, created_at:, digital_wallet_token_id:, elements:, physical_card_id:, state:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardPayment} for more details.
      #
      #   Card Payments group together interactions related to a single card payment, such
      #   as an authorization and its corresponding settlement.
      #
      #   @param id [String] The Card Payment identifier.
      #
      #   @param account_id [String] The identifier for the Account the Transaction belongs to.
      #
      #   @param card_id [String] The Card identifier for this payment.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card Pa
      #
      #   @param digital_wallet_token_id [String, nil] The Digital Wallet Token identifier for this payment.
      #
      #   @param elements [Array<Increase::Models::CardPayment::Element>] The interactions related to this card payment.
      #
      #   @param physical_card_id [String, nil] The Physical Card identifier for this payment.
      #
      #   @param state [Increase::Models::CardPayment::State] The summarized state of this card payment.
      #
      #   @param type [Symbol, Increase::Models::CardPayment::Type] A constant representing the object's type. For this resource it will always be `

      class Element < Increase::Internal::Type::BaseModel
        # @!attribute card_authentication
        #   A Card Authentication object. This field will be present in the JSON response if
        #   and only if `category` is equal to `card_authentication`. Card Authentications
        #   are attempts to authenticate a transaction or a card with 3DS.
        #
        #   @return [Increase::Models::CardPayment::Element::CardAuthentication, nil]
        required :card_authentication, -> { Increase::CardPayment::Element::CardAuthentication }, nil?: true

        # @!attribute card_authorization
        #   A Card Authorization object. This field will be present in the JSON response if
        #   and only if `category` is equal to `card_authorization`. Card Authorizations are
        #   temporary holds placed on a customers funds with the intent to later clear a
        #   transaction.
        #
        #   @return [Increase::Models::CardPayment::Element::CardAuthorization, nil]
        required :card_authorization, -> { Increase::CardPayment::Element::CardAuthorization }, nil?: true

        # @!attribute card_authorization_expiration
        #   A Card Authorization Expiration object. This field will be present in the JSON
        #   response if and only if `category` is equal to `card_authorization_expiration`.
        #   Card Authorization Expirations are cancellations of authorizations that were
        #   never settled by the acquirer.
        #
        #   @return [Increase::Models::CardPayment::Element::CardAuthorizationExpiration, nil]
        required :card_authorization_expiration,
                 -> { Increase::CardPayment::Element::CardAuthorizationExpiration },
                 nil?: true

        # @!attribute card_decline
        #   A Card Decline object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_decline`.
        #
        #   @return [Increase::Models::CardPayment::Element::CardDecline, nil]
        required :card_decline, -> { Increase::CardPayment::Element::CardDecline }, nil?: true

        # @!attribute card_fuel_confirmation
        #   A Card Fuel Confirmation object. This field will be present in the JSON response
        #   if and only if `category` is equal to `card_fuel_confirmation`. Card Fuel
        #   Confirmations update the amount of a Card Authorization after a fuel pump
        #   transaction is completed.
        #
        #   @return [Increase::Models::CardPayment::Element::CardFuelConfirmation, nil]
        required :card_fuel_confirmation,
                 -> {
                   Increase::CardPayment::Element::CardFuelConfirmation
                 },
                 nil?: true

        # @!attribute card_increment
        #   A Card Increment object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_increment`. Card Increments increase the
        #   pending amount of an authorized transaction.
        #
        #   @return [Increase::Models::CardPayment::Element::CardIncrement, nil]
        required :card_increment, -> { Increase::CardPayment::Element::CardIncrement }, nil?: true

        # @!attribute card_refund
        #   A Card Refund object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_refund`. Card Refunds move money back to
        #   the cardholder. While they are usually connected to a Card Settlement an
        #   acquirer can also refund money directly to a card without relation to a
        #   transaction.
        #
        #   @return [Increase::Models::CardPayment::Element::CardRefund, nil]
        required :card_refund, -> { Increase::CardPayment::Element::CardRefund }, nil?: true

        # @!attribute card_reversal
        #   A Card Reversal object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_reversal`. Card Reversals cancel parts of
        #   or the entirety of an existing Card Authorization.
        #
        #   @return [Increase::Models::CardPayment::Element::CardReversal, nil]
        required :card_reversal, -> { Increase::CardPayment::Element::CardReversal }, nil?: true

        # @!attribute card_settlement
        #   A Card Settlement object. This field will be present in the JSON response if and
        #   only if `category` is equal to `card_settlement`. Card Settlements are card
        #   transactions that have cleared and settled. While a settlement is usually
        #   preceded by an authorization, an acquirer can also directly clear a transaction
        #   without first authorizing it.
        #
        #   @return [Increase::Models::CardPayment::Element::CardSettlement, nil]
        required :card_settlement, -> { Increase::CardPayment::Element::CardSettlement }, nil?: true

        # @!attribute card_validation
        #   An Inbound Card Validation object. This field will be present in the JSON
        #   response if and only if `category` is equal to `card_validation`. Inbound Card
        #   Validations are requests from a merchant to verify that a card number and
        #   optionally its address and/or Card Verification Value are valid.
        #
        #   @return [Increase::Models::CardPayment::Element::CardValidation, nil]
        required :card_validation, -> { Increase::CardPayment::Element::CardValidation }, nil?: true

        # @!attribute category
        #   The type of the resource. We may add additional possible values for this enum
        #   over time; your application should be able to handle such additions gracefully.
        #
        #   @return [Symbol, Increase::Models::CardPayment::Element::Category]
        required :category, enum: -> { Increase::CardPayment::Element::Category }

        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the card payment element was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute other
        #   If the category of this Transaction source is equal to `other`, this field will
        #   contain an empty object, otherwise it will contain null.
        #
        #   @return [Object, nil]
        required :other, Increase::Internal::Type::Unknown, nil?: true

        # @!method initialize(card_authentication:, card_authorization:, card_authorization_expiration:, card_decline:, card_fuel_confirmation:, card_increment:, card_refund:, card_reversal:, card_settlement:, card_validation:, category:, created_at:, other:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardPayment::Element} for more details.
        #
        #   @param card_authentication [Increase::Models::CardPayment::Element::CardAuthentication, nil] A Card Authentication object. This field will be present in the JSON response if
        #
        #   @param card_authorization [Increase::Models::CardPayment::Element::CardAuthorization, nil] A Card Authorization object. This field will be present in the JSON response if
        #
        #   @param card_authorization_expiration [Increase::Models::CardPayment::Element::CardAuthorizationExpiration, nil] A Card Authorization Expiration object. This field will be present in the JSON r
        #
        #   @param card_decline [Increase::Models::CardPayment::Element::CardDecline, nil] A Card Decline object. This field will be present in the JSON response if and on
        #
        #   @param card_fuel_confirmation [Increase::Models::CardPayment::Element::CardFuelConfirmation, nil] A Card Fuel Confirmation object. This field will be present in the JSON response
        #
        #   @param card_increment [Increase::Models::CardPayment::Element::CardIncrement, nil] A Card Increment object. This field will be present in the JSON response if and
        #
        #   @param card_refund [Increase::Models::CardPayment::Element::CardRefund, nil] A Card Refund object. This field will be present in the JSON response if and onl
        #
        #   @param card_reversal [Increase::Models::CardPayment::Element::CardReversal, nil] A Card Reversal object. This field will be present in the JSON response if and o
        #
        #   @param card_settlement [Increase::Models::CardPayment::Element::CardSettlement, nil] A Card Settlement object. This field will be present in the JSON response if and
        #
        #   @param card_validation [Increase::Models::CardPayment::Element::CardValidation, nil] An Inbound Card Validation object. This field will be present in the JSON respon
        #
        #   @param category [Symbol, Increase::Models::CardPayment::Element::Category] The type of the resource. We may add additional possible values for this enum ov
        #
        #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param other [Object, nil] If the category of this Transaction source is equal to `other`, this field will

        # @see Increase::Models::CardPayment::Element#card_authentication
        class CardAuthentication < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Authentication identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute card_id
          #   The identifier of the Card.
          #
          #   @return [String]
          required :card_id, String

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute category
          #   The category of the card authentication attempt.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Category, nil]
          required :category,
                   enum: -> {
                     Increase::CardPayment::Element::CardAuthentication::Category
                   },
                   nil?: true

          # @!attribute challenge
          #   Details about the challenge, if one was requested.
          #
          #   @return [Increase::Models::CardPayment::Element::CardAuthentication::Challenge, nil]
          required :challenge,
                   -> {
                     Increase::CardPayment::Element::CardAuthentication::Challenge
                   },
                   nil?: true

          # @!attribute created_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
          #   Authentication was attempted.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute deny_reason
          #   The reason why this authentication attempt was denied, if it was.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::DenyReason, nil]
          required :deny_reason,
                   enum: -> { Increase::CardPayment::Element::CardAuthentication::DenyReason },
                   nil?: true

          # @!attribute device_channel
          #   The device channel of the card authentication attempt.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::DeviceChannel, nil]
          required :device_channel,
                   enum: -> { Increase::CardPayment::Element::CardAuthentication::DeviceChannel },
                   nil?: true

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

          # @!attribute merchant_country
          #   The country the merchant resides in.
          #
          #   @return [String]
          required :merchant_country, String

          # @!attribute merchant_name
          #   The name of the merchant.
          #
          #   @return [String]
          required :merchant_name, String

          # @!attribute purchase_amount
          #   The purchase amount in minor units.
          #
          #   @return [Integer, nil]
          required :purchase_amount, Integer, nil?: true

          # @!attribute purchase_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   authentication attempt's purchase currency.
          #
          #   @return [String, nil]
          required :purchase_currency, String, nil?: true

          # @!attribute real_time_decision_id
          #   The identifier of the Real-Time Decision sent to approve or decline this
          #   authentication attempt.
          #
          #   @return [String, nil]
          required :real_time_decision_id, String, nil?: true

          # @!attribute status
          #   The status of the card authentication.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Status]
          required :status, enum: -> { Increase::CardPayment::Element::CardAuthentication::Status }

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_authentication`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardAuthentication::Type }

          # @!method initialize(id:, card_id:, card_payment_id:, category:, challenge:, created_at:, deny_reason:, device_channel:, merchant_acceptor_id:, merchant_category_code:, merchant_country:, merchant_name:, purchase_amount:, purchase_currency:, real_time_decision_id:, status:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardAuthentication} for more details.
          #
          #   A Card Authentication object. This field will be present in the JSON response if
          #   and only if `category` is equal to `card_authentication`. Card Authentications
          #   are attempts to authenticate a transaction or a card with 3DS.
          #
          #   @param id [String] The Card Authentication identifier.
          #
          #   @param card_id [String] The identifier of the Card.
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param category [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Category, nil] The category of the card authentication attempt.
          #
          #   @param challenge [Increase::Models::CardPayment::Element::CardAuthentication::Challenge, nil] Details about the challenge, if one was requested.
          #
          #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card Au
          #
          #   @param deny_reason [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::DenyReason, nil] The reason why this authentication attempt was denied, if it was.
          #
          #   @param device_channel [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::DeviceChannel, nil] The device channel of the card authentication attempt.
          #
          #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
          #
          #   @param merchant_category_code [String] The Merchant Category Code (commonly abbreviated as MCC) of the merchant the car
          #
          #   @param merchant_country [String] The country the merchant resides in.
          #
          #   @param merchant_name [String] The name of the merchant.
          #
          #   @param purchase_amount [Integer, nil] The purchase amount in minor units.
          #
          #   @param purchase_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the authenticati
          #
          #   @param real_time_decision_id [String, nil] The identifier of the Real-Time Decision sent to approve or decline this authent
          #
          #   @param status [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Status] The status of the card authentication.
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Type] A constant representing the object's type. For this resource it will always be `

          # The category of the card authentication attempt.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthentication#category
          module Category
            extend Increase::Internal::Type::Enum

            # The authentication attempt is for a payment.
            PAYMENT_AUTHENTICATION = :payment_authentication

            # The authentication attempt is not for a payment.
            NON_PAYMENT_AUTHENTICATION = :non_payment_authentication

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardAuthentication#challenge
          class Challenge < Increase::Internal::Type::BaseModel
            # @!attribute attempts
            #   Details about the challenge verification attempts, if any happened.
            #
            #   @return [Array<Increase::Models::CardPayment::Element::CardAuthentication::Challenge::Attempt>]
            required :attempts,
                     -> { Increase::Internal::Type::ArrayOf[Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt] }

            # @!attribute created_at
            #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
            #   Authentication Challenge was started.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute one_time_code
            #   The one-time code used for the Card Authentication Challenge.
            #
            #   @return [String]
            required :one_time_code, String

            # @!attribute verification_method
            #   The method used to verify the Card Authentication Challenge.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod]
            required :verification_method,
                     enum: -> { Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod }

            # @!attribute verification_value
            #   E.g., the email address or phone number used for the Card Authentication
            #   Challenge.
            #
            #   @return [String, nil]
            required :verification_value, String, nil?: true

            # @!method initialize(attempts:, created_at:, one_time_code:, verification_method:, verification_value:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardAuthentication::Challenge} for more
            #   details.
            #
            #   Details about the challenge, if one was requested.
            #
            #   @param attempts [Array<Increase::Models::CardPayment::Element::CardAuthentication::Challenge::Attempt>] Details about the challenge verification attempts, if any happened.
            #
            #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card Au
            #
            #   @param one_time_code [String] The one-time code used for the Card Authentication Challenge.
            #
            #   @param verification_method [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod] The method used to verify the Card Authentication Challenge.
            #
            #   @param verification_value [String, nil] E.g., the email address or phone number used for the Card Authentication Challen

            class Attempt < Increase::Internal::Type::BaseModel
              # @!attribute created_at
              #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time of the Card
              #   Authentication Challenge Attempt.
              #
              #   @return [Time]
              required :created_at, Time

              # @!attribute outcome
              #   The outcome of the Card Authentication Challenge Attempt.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome]
              required :outcome,
                       enum: -> { Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome }

              # @!method initialize(created_at:, outcome:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardAuthentication::Challenge::Attempt}
              #   for more details.
              #
              #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time of the Card Authenti
              #
              #   @param outcome [Symbol, Increase::Models::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome] The outcome of the Card Authentication Challenge Attempt.

              # The outcome of the Card Authentication Challenge Attempt.
              #
              # @see Increase::Models::CardPayment::Element::CardAuthentication::Challenge::Attempt#outcome
              module Outcome
                extend Increase::Internal::Type::Enum

                # The attempt was successful.
                SUCCESSFUL = :successful

                # The attempt was unsuccessful.
                FAILED = :failed

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # The method used to verify the Card Authentication Challenge.
            #
            # @see Increase::Models::CardPayment::Element::CardAuthentication::Challenge#verification_method
            module VerificationMethod
              extend Increase::Internal::Type::Enum

              # The one-time code was sent via text message.
              TEXT_MESSAGE = :text_message

              # The one-time code was sent via email.
              EMAIL = :email

              # The one-time code was not successfully delivered.
              NONE_AVAILABLE = :none_available

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # The reason why this authentication attempt was denied, if it was.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthentication#deny_reason
          module DenyReason
            extend Increase::Internal::Type::Enum

            # The group was locked.
            GROUP_LOCKED = :group_locked

            # The card was not active.
            CARD_NOT_ACTIVE = :card_not_active

            # The entity was not active.
            ENTITY_NOT_ACTIVE = :entity_not_active

            # The transaction was not allowed.
            TRANSACTION_NOT_ALLOWED = :transaction_not_allowed

            # The webhook was denied.
            WEBHOOK_DENIED = :webhook_denied

            # The webhook timed out.
            WEBHOOK_TIMED_OUT = :webhook_timed_out

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The device channel of the card authentication attempt.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthentication#device_channel
          module DeviceChannel
            extend Increase::Internal::Type::Enum

            # The authentication attempt was made from an app.
            APP = :app

            # The authentication attempt was made from a browser.
            BROWSER = :browser

            # The authentication attempt was initiated by the 3DS Requestor.
            THREE_DS_REQUESTOR_INITIATED = :three_ds_requestor_initiated

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The status of the card authentication.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthentication#status
          module Status
            extend Increase::Internal::Type::Enum

            # The authentication attempt was denied.
            DENIED = :denied

            # The authentication attempt was authenticated with a challenge.
            AUTHENTICATED_WITH_CHALLENGE = :authenticated_with_challenge

            # The authentication attempt was authenticated without a challenge.
            AUTHENTICATED_WITHOUT_CHALLENGE = :authenticated_without_challenge

            # The authentication attempt is awaiting a challenge.
            AWAITING_CHALLENGE = :awaiting_challenge

            # The authentication attempt is validating a challenge.
            VALIDATING_CHALLENGE = :validating_challenge

            # The authentication attempt was canceled.
            CANCELED = :canceled

            # The authentication attempt timed out while awaiting a challenge.
            TIMED_OUT_AWAITING_CHALLENGE = :timed_out_awaiting_challenge

            # The authentication attempt errored.
            ERRORED = :errored

            # The authentication attempt exceeded the attempt threshold.
            EXCEEDED_ATTEMPT_THRESHOLD = :exceeded_attempt_threshold

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_authentication`.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthentication#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_AUTHENTICATION = :card_authentication

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::CardPayment::Element#card_authorization
        class CardAuthorization < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Authorization identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute actioner
          #   Whether this authorization was approved by Increase, the card network through
          #   stand-in processing, or the user through a real-time decision.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Actioner]
          required :actioner, enum: -> { Increase::CardPayment::Element::CardAuthorization::Actioner }

          # @!attribute additional_amounts
          #   Additional amounts associated with the card authorization, such as ATM
          #   surcharges fees. These are usually a subset of the `amount` field and are used
          #   to provide more detailed information about the transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts]
          required :additional_amounts, -> { Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts }

          # @!attribute amount
          #   The pending amount in the minor unit of the transaction's currency. For dollars,
          #   for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardAuthorization::Currency }

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
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Direction]
          required :direction, enum: -> { Increase::CardPayment::Element::CardAuthorization::Direction }

          # @!attribute expires_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) when this authorization
          #   will expire and the pending transaction will be released.
          #
          #   @return [Time]
          required :expires_at, Time

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
          #   @return [Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails]
          required :network_details, -> { Increase::CardPayment::Element::CardAuthorization::NetworkDetails }

          # @!attribute network_identifiers
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardAuthorization::NetworkIdentifiers]
          required :network_identifiers,
                   -> { Increase::CardPayment::Element::CardAuthorization::NetworkIdentifiers }

          # @!attribute network_risk_score
          #   The risk score generated by the card network. For Visa this is the Visa Advanced
          #   Authorization risk score, from 0 to 99, where 99 is the riskiest.
          #
          #   @return [Integer, nil]
          required :network_risk_score, Integer, nil?: true

          # @!attribute pending_transaction_id
          #   The identifier of the Pending Transaction associated with this Transaction.
          #
          #   @return [String, nil]
          required :pending_transaction_id, String, nil?: true

          # @!attribute physical_card_id
          #   If the authorization was made in-person with a physical card, the Physical Card
          #   that was used.
          #
          #   @return [String, nil]
          required :physical_card_id, String, nil?: true

          # @!attribute presentment_amount
          #   The pending amount in the minor unit of the transaction's presentment currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute processing_category
          #   The processing category describes the intent behind the authorization, such as
          #   whether it was used for bill payments or an automatic fuel dispenser.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::ProcessingCategory]
          required :processing_category,
                   enum: -> { Increase::CardPayment::Element::CardAuthorization::ProcessingCategory }

          # @!attribute real_time_decision_id
          #   The identifier of the Real-Time Decision sent to approve or decline this
          #   transaction.
          #
          #   @return [String, nil]
          required :real_time_decision_id, String, nil?: true

          # @!attribute terminal_id
          #   The terminal identifier (commonly abbreviated as TID) of the terminal the card
          #   is transacting with.
          #
          #   @return [String, nil]
          required :terminal_id, String, nil?: true

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_authorization`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardAuthorization::Type }

          # @!attribute verification
          #   Fields related to verification of cardholder-provided values.
          #
          #   @return [Increase::Models::CardPayment::Element::CardAuthorization::Verification]
          required :verification, -> { Increase::CardPayment::Element::CardAuthorization::Verification }

          # @!method initialize(id:, actioner:, additional_amounts:, amount:, card_payment_id:, currency:, digital_wallet_token_id:, direction:, expires_at:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_descriptor:, merchant_postal_code:, merchant_state:, network_details:, network_identifiers:, network_risk_score:, pending_transaction_id:, physical_card_id:, presentment_amount:, presentment_currency:, processing_category:, real_time_decision_id:, terminal_id:, type:, verification:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardAuthorization} for more details.
          #
          #   A Card Authorization object. This field will be present in the JSON response if
          #   and only if `category` is equal to `card_authorization`. Card Authorizations are
          #   temporary holds placed on a customers funds with the intent to later clear a
          #   transaction.
          #
          #   @param id [String] The Card Authorization identifier.
          #
          #   @param actioner [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Actioner] Whether this authorization was approved by Increase, the card network through st
          #
          #   @param additional_amounts [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts] Additional amounts associated with the card authorization, such as ATM surcharge
          #
          #   @param amount [Integer] The pending amount in the minor unit of the transaction's currency. For dollars,
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param digital_wallet_token_id [String, nil] If the authorization was made via a Digital Wallet Token (such as an Apple Pay p
          #
          #   @param direction [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Direction] The direction describes the direction the funds will move, either from the cardh
          #
          #   @param expires_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) when this authorization w
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
          #   @param network_details [Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails] Fields specific to the `network`.
          #
          #   @param network_identifiers [Increase::Models::CardPayment::Element::CardAuthorization::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
          #
          #   @param network_risk_score [Integer, nil] The risk score generated by the card network. For Visa this is the Visa Advanced
          #
          #   @param pending_transaction_id [String, nil] The identifier of the Pending Transaction associated with this Transaction.
          #
          #   @param physical_card_id [String, nil] If the authorization was made in-person with a physical card, the Physical Card
          #
          #   @param presentment_amount [Integer] The pending amount in the minor unit of the transaction's presentment currency.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param processing_category [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::ProcessingCategory] The processing category describes the intent behind the authorization, such as w
          #
          #   @param real_time_decision_id [String, nil] The identifier of the Real-Time Decision sent to approve or decline this transac
          #
          #   @param terminal_id [String, nil] The terminal identifier (commonly abbreviated as TID) of the terminal the card i
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Type] A constant representing the object's type. For this resource it will always be `
          #
          #   @param verification [Increase::Models::CardPayment::Element::CardAuthorization::Verification] Fields related to verification of cardholder-provided values.

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthorization#actioner
          module Actioner
            extend Increase::Internal::Type::Enum

            # This object was actioned by the user through a real-time decision.
            USER = :user

            # This object was actioned by Increase without user intervention.
            INCREASE = :increase

            # This object was actioned by the network, through stand-in processing.
            NETWORK = :network

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardAuthorization#additional_amounts
          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            # @!attribute clinic
            #   The part of this transaction amount that was for clinic-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic, nil]
            required :clinic,
                     -> { Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic },
                     nil?: true

            # @!attribute dental
            #   The part of this transaction amount that was for dental-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental, nil]
            required :dental,
                     -> { Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental },
                     nil?: true

            # @!attribute prescription
            #   The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription, nil]
            required :prescription,
                     -> {
                       Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription
                     },
                     nil?: true

            # @!attribute surcharge
            #   The surcharge amount charged for this transaction by the merchant.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge, nil]
            required :surcharge,
                     -> { Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge },
                     nil?: true

            # @!attribute total_cumulative
            #   The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative, nil]
            required :total_cumulative,
                     -> {
                       Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative
                     },
                     nil?: true

            # @!attribute total_healthcare
            #   The total amount of healthcare-related additional amounts.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare, nil]
            required :total_healthcare,
                     -> {
                       Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare
                     },
                     nil?: true

            # @!attribute transit
            #   The part of this transaction amount that was for transit-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit, nil]
            required :transit,
                     -> { Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit },
                     nil?: true

            # @!attribute unknown
            #   An unknown additional amount.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown, nil]
            required :unknown,
                     -> { Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown },
                     nil?: true

            # @!attribute vision
            #   The part of this transaction amount that was for vision-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision, nil]
            required :vision,
                     -> { Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision },
                     nil?: true

            # @!method initialize(clinic:, dental:, prescription:, surcharge:, total_cumulative:, total_healthcare:, transit:, unknown:, vision:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts}
            #   for more details.
            #
            #   Additional amounts associated with the card authorization, such as ATM
            #   surcharges fees. These are usually a subset of the `amount` field and are used
            #   to provide more detailed information about the transaction.
            #
            #   @param clinic [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic, nil] The part of this transaction amount that was for clinic-related services.
            #
            #   @param dental [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental, nil] The part of this transaction amount that was for dental-related services.
            #
            #   @param prescription [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription, nil] The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @param surcharge [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge, nil] The surcharge amount charged for this transaction by the merchant.
            #
            #   @param total_cumulative [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative, nil] The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @param total_healthcare [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare, nil] The total amount of healthcare-related additional amounts.
            #
            #   @param transit [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit, nil] The part of this transaction amount that was for transit-related services.
            #
            #   @param unknown [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown, nil] An unknown additional amount.
            #
            #   @param vision [Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision, nil] The part of this transaction amount that was for vision-related services.

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#clinic
            class Clinic < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic}
              #   for more details.
              #
              #   The part of this transaction amount that was for clinic-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#dental
            class Dental < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental}
              #   for more details.
              #
              #   The part of this transaction amount that was for dental-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#prescription
            class Prescription < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription}
              #   for more details.
              #
              #   The part of this transaction amount that was for healthcare prescriptions.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#surcharge
            class Surcharge < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge}
              #   for more details.
              #
              #   The surcharge amount charged for this transaction by the merchant.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#total_cumulative
            class TotalCumulative < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative}
              #   for more details.
              #
              #   The total amount of a series of incremental authorizations, optionally provided.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#total_healthcare
            class TotalHealthcare < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare}
              #   for more details.
              #
              #   The total amount of healthcare-related additional amounts.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#transit
            class Transit < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit}
              #   for more details.
              #
              #   The part of this transaction amount that was for transit-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#unknown
            class Unknown < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown}
              #   for more details.
              #
              #   An unknown additional amount.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts#vision
            class Vision < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision}
              #   for more details.
              #
              #   The part of this transaction amount that was for vision-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthorization#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthorization#direction
          module Direction
            extend Increase::Internal::Type::Enum

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT = :settlement

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND = :refund

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardAuthorization#network_details
          class NetworkDetails < Increase::Internal::Type::BaseModel
            # @!attribute category
            #   The payment network used to process this card authorization.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Category]
            required :category,
                     enum: -> { Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Category }

            # @!attribute visa
            #   Fields specific to the `visa` network.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa, nil]
            required :visa,
                     -> {
                       Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa
                     },
                     nil?: true

            # @!method initialize(category:, visa:)
            #   Fields specific to the `network`.
            #
            #   @param category [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Category] The payment network used to process this card authorization.
            #
            #   @param visa [Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa, nil] Fields specific to the `visa` network.

            # The payment network used to process this card authorization.
            #
            # @see Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails#category
            module Category
              extend Increase::Internal::Type::Enum

              # Visa
              VISA = :visa

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails#visa
            class Visa < Increase::Internal::Type::BaseModel
              # @!attribute electronic_commerce_indicator
              #   For electronic commerce transactions, this identifies the level of security used
              #   in obtaining the customer's payment credential. For mail or telephone order
              #   transactions, identifies the type of mail or telephone order.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator, nil]
              required :electronic_commerce_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator
                       },
                       nil?: true

              # @!attribute point_of_service_entry_mode
              #   The method used to enter the cardholder's primary account number and card
              #   expiration date.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode, nil]
              required :point_of_service_entry_mode,
                       enum: -> {
                         Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode
                       },
                       nil?: true

              # @!attribute stand_in_processing_reason
              #   Only present when `actioner: network`. Describes why a card authorization was
              #   approved or declined by Visa through stand-in processing.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason, nil]
              required :stand_in_processing_reason,
                       enum: -> {
                         Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason
                       },
                       nil?: true

              # @!method initialize(electronic_commerce_indicator:, point_of_service_entry_mode:, stand_in_processing_reason:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa}
              #   for more details.
              #
              #   Fields specific to the `visa` network.
              #
              #   @param electronic_commerce_indicator [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator, nil] For electronic commerce transactions, this identifies the level of security used
              #
              #   @param point_of_service_entry_mode [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode, nil] The method used to enter the cardholder's primary account number and card expira
              #
              #   @param stand_in_processing_reason [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason, nil] Only present when `actioner: network`. Describes why a card authorization was ap

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              #
              # @see Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa#electronic_commerce_indicator
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

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however , cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION = :non_authenticated_security_transaction

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION = :non_secure_transaction

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              #
              # @see Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa#point_of_service_entry_mode
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
              # @see Increase::Models::CardPayment::Element::CardAuthorization::NetworkDetails::Visa#stand_in_processing_reason
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

          # @see Increase::Models::CardPayment::Element::CardAuthorization#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
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

            # @!method initialize(retrieval_reference_number:, trace_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardAuthorization::NetworkIdentifiers}
            #   for more details.
            #
            #   Network-specific identifiers for a specific request or transaction.
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
          # @see Increase::Models::CardPayment::Element::CardAuthorization#processing_category
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

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization`.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthorization#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_AUTHORIZATION = :card_authorization

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardAuthorization#verification
          class Verification < Increase::Internal::Type::BaseModel
            # @!attribute card_verification_code
            #   Fields related to verification of the Card Verification Code, a 3-digit code on
            #   the back of the card.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode]
            required :card_verification_code,
                     -> { Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode }

            # @!attribute cardholder_address
            #   Cardholder address provided in the authorization request and the address on file
            #   we verified it against.
            #
            #   @return [Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardholderAddress]
            required :cardholder_address,
                     -> { Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress }

            # @!method initialize(card_verification_code:, cardholder_address:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardAuthorization::Verification} for
            #   more details.
            #
            #   Fields related to verification of cardholder-provided values.
            #
            #   @param card_verification_code [Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode] Fields related to verification of the Card Verification Code, a 3-digit code on
            #
            #   @param cardholder_address [Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardholderAddress] Cardholder address provided in the authorization request and the address on file

            # @see Increase::Models::CardPayment::Element::CardAuthorization::Verification#card_verification_code
            class CardVerificationCode < Increase::Internal::Type::BaseModel
              # @!attribute result
              #   The result of verifying the Card Verification Code.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result]
              required :result,
                       enum: -> { Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result }

              # @!method initialize(result:)
              #   Fields related to verification of the Card Verification Code, a 3-digit code on
              #   the back of the card.
              #
              #   @param result [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result] The result of verifying the Card Verification Code.

              # The result of verifying the Card Verification Code.
              #
              # @see Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode#result
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

            # @see Increase::Models::CardPayment::Element::CardAuthorization::Verification#cardholder_address
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
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result]
              required :result,
                       enum: -> { Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result }

              # @!method initialize(actual_line1:, actual_postal_code:, provided_line1:, provided_postal_code:, result:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardholderAddress}
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
              #   @param result [Symbol, Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result] The address verification result returned to the card network.

              # The address verification result returned to the card network.
              #
              # @see Increase::Models::CardPayment::Element::CardAuthorization::Verification::CardholderAddress#result
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

        # @see Increase::Models::CardPayment::Element#card_authorization_expiration
        class CardAuthorizationExpiration < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Authorization Expiration identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute card_authorization_id
          #   The identifier for the Card Authorization this reverses.
          #
          #   @return [String]
          required :card_authorization_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          #   currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorizationExpiration::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardAuthorizationExpiration::Currency }

          # @!attribute expired_amount
          #   The amount of this authorization expiration in the minor unit of the
          #   transaction's currency. For dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :expired_amount, Integer

          # @!attribute network
          #   The card network used to process this card authorization.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorizationExpiration::Network]
          required :network, enum: -> { Increase::CardPayment::Element::CardAuthorizationExpiration::Network }

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_authorization_expiration`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardAuthorizationExpiration::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardAuthorizationExpiration::Type }

          # @!method initialize(id:, card_authorization_id:, currency:, expired_amount:, network:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardAuthorizationExpiration} for more
          #   details.
          #
          #   A Card Authorization Expiration object. This field will be present in the JSON
          #   response if and only if `category` is equal to `card_authorization_expiration`.
          #   Card Authorization Expirations are cancellations of authorizations that were
          #   never settled by the acquirer.
          #
          #   @param id [String] The Card Authorization Expiration identifier.
          #
          #   @param card_authorization_id [String] The identifier for the Card Authorization this reverses.
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardAuthorizationExpiration::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's c
          #
          #   @param expired_amount [Integer] The amount of this authorization expiration in the minor unit of the transaction
          #
          #   @param network [Symbol, Increase::Models::CardPayment::Element::CardAuthorizationExpiration::Network] The card network used to process this card authorization.
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardAuthorizationExpiration::Type] A constant representing the object's type. For this resource it will always be `

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          # currency.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthorizationExpiration#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The card network used to process this card authorization.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthorizationExpiration#network
          module Network
            extend Increase::Internal::Type::Enum

            # Visa
            VISA = :visa

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization_expiration`.
          #
          # @see Increase::Models::CardPayment::Element::CardAuthorizationExpiration#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_AUTHORIZATION_EXPIRATION = :card_authorization_expiration

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::CardPayment::Element#card_decline
        class CardDecline < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Decline identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute actioner
          #   Whether this authorization was approved by Increase, the card network through
          #   stand-in processing, or the user through a real-time decision.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::Actioner]
          required :actioner, enum: -> { Increase::CardPayment::Element::CardDecline::Actioner }

          # @!attribute additional_amounts
          #   Additional amounts associated with the card authorization, such as ATM
          #   surcharges fees. These are usually a subset of the `amount` field and are used
          #   to provide more detailed information about the transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts]
          required :additional_amounts, -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts }

          # @!attribute amount
          #   The declined amount in the minor unit of the destination account currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #   account currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardDecline::Currency }

          # @!attribute declined_transaction_id
          #   The identifier of the declined transaction created for this Card Decline.
          #
          #   @return [String]
          required :declined_transaction_id, String

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
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::Direction]
          required :direction, enum: -> { Increase::CardPayment::Element::CardDecline::Direction }

          # @!attribute incremented_card_authorization_id
          #   The identifier of the card authorization this request attempted to incrementally
          #   authorize.
          #
          #   @return [String, nil]
          required :incremented_card_authorization_id, String, nil?: true

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
          #   @return [Increase::Models::CardPayment::Element::CardDecline::NetworkDetails]
          required :network_details, -> { Increase::CardPayment::Element::CardDecline::NetworkDetails }

          # @!attribute network_identifiers
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardDecline::NetworkIdentifiers]
          required :network_identifiers, -> { Increase::CardPayment::Element::CardDecline::NetworkIdentifiers }

          # @!attribute network_risk_score
          #   The risk score generated by the card network. For Visa this is the Visa Advanced
          #   Authorization risk score, from 0 to 99, where 99 is the riskiest.
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
          #   The declined amount in the minor unit of the transaction's presentment currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute processing_category
          #   The processing category describes the intent behind the authorization, such as
          #   whether it was used for bill payments or an automatic fuel dispenser.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::ProcessingCategory]
          required :processing_category,
                   enum: -> { Increase::CardPayment::Element::CardDecline::ProcessingCategory }

          # @!attribute real_time_decision_id
          #   The identifier of the Real-Time Decision sent to approve or decline this
          #   transaction.
          #
          #   @return [String, nil]
          required :real_time_decision_id, String, nil?: true

          # @!attribute real_time_decision_reason
          #   This is present if a specific decline reason was given in the real-time
          #   decision.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::RealTimeDecisionReason, nil]
          required :real_time_decision_reason,
                   enum: -> { Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason },
                   nil?: true

          # @!attribute reason
          #   Why the transaction was declined.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::Reason]
          required :reason, enum: -> { Increase::CardPayment::Element::CardDecline::Reason }

          # @!attribute terminal_id
          #   The terminal identifier (commonly abbreviated as TID) of the terminal the card
          #   is transacting with.
          #
          #   @return [String, nil]
          required :terminal_id, String, nil?: true

          # @!attribute verification
          #   Fields related to verification of cardholder-provided values.
          #
          #   @return [Increase::Models::CardPayment::Element::CardDecline::Verification]
          required :verification, -> { Increase::CardPayment::Element::CardDecline::Verification }

          # @!method initialize(id:, actioner:, additional_amounts:, amount:, card_payment_id:, currency:, declined_transaction_id:, digital_wallet_token_id:, direction:, incremented_card_authorization_id:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_descriptor:, merchant_postal_code:, merchant_state:, network_details:, network_identifiers:, network_risk_score:, physical_card_id:, presentment_amount:, presentment_currency:, processing_category:, real_time_decision_id:, real_time_decision_reason:, reason:, terminal_id:, verification:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardDecline} for more details.
          #
          #   A Card Decline object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_decline`.
          #
          #   @param id [String] The Card Decline identifier.
          #
          #   @param actioner [Symbol, Increase::Models::CardPayment::Element::CardDecline::Actioner] Whether this authorization was approved by Increase, the card network through st
          #
          #   @param additional_amounts [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts] Additional amounts associated with the card authorization, such as ATM surcharge
          #
          #   @param amount [Integer] The declined amount in the minor unit of the destination account currency. For d
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardDecline::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          #
          #   @param declined_transaction_id [String] The identifier of the declined transaction created for this Card Decline.
          #
          #   @param digital_wallet_token_id [String, nil] If the authorization was made via a Digital Wallet Token (such as an Apple Pay p
          #
          #   @param direction [Symbol, Increase::Models::CardPayment::Element::CardDecline::Direction] The direction describes the direction the funds will move, either from the cardh
          #
          #   @param incremented_card_authorization_id [String, nil] The identifier of the card authorization this request attempted to incrementally
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
          #   @param network_details [Increase::Models::CardPayment::Element::CardDecline::NetworkDetails] Fields specific to the `network`.
          #
          #   @param network_identifiers [Increase::Models::CardPayment::Element::CardDecline::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
          #
          #   @param network_risk_score [Integer, nil] The risk score generated by the card network. For Visa this is the Visa Advanced
          #
          #   @param physical_card_id [String, nil] If the authorization was made in-person with a physical card, the Physical Card
          #
          #   @param presentment_amount [Integer] The declined amount in the minor unit of the transaction's presentment currency.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param processing_category [Symbol, Increase::Models::CardPayment::Element::CardDecline::ProcessingCategory] The processing category describes the intent behind the authorization, such as w
          #
          #   @param real_time_decision_id [String, nil] The identifier of the Real-Time Decision sent to approve or decline this transac
          #
          #   @param real_time_decision_reason [Symbol, Increase::Models::CardPayment::Element::CardDecline::RealTimeDecisionReason, nil] This is present if a specific decline reason was given in the real-time decision
          #
          #   @param reason [Symbol, Increase::Models::CardPayment::Element::CardDecline::Reason] Why the transaction was declined.
          #
          #   @param terminal_id [String, nil] The terminal identifier (commonly abbreviated as TID) of the terminal the card i
          #
          #   @param verification [Increase::Models::CardPayment::Element::CardDecline::Verification] Fields related to verification of cardholder-provided values.

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          #
          # @see Increase::Models::CardPayment::Element::CardDecline#actioner
          module Actioner
            extend Increase::Internal::Type::Enum

            # This object was actioned by the user through a real-time decision.
            USER = :user

            # This object was actioned by Increase without user intervention.
            INCREASE = :increase

            # This object was actioned by the network, through stand-in processing.
            NETWORK = :network

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardDecline#additional_amounts
          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            # @!attribute clinic
            #   The part of this transaction amount that was for clinic-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic, nil]
            required :clinic,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic },
                     nil?: true

            # @!attribute dental
            #   The part of this transaction amount that was for dental-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Dental, nil]
            required :dental,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Dental },
                     nil?: true

            # @!attribute prescription
            #   The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription, nil]
            required :prescription,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription },
                     nil?: true

            # @!attribute surcharge
            #   The surcharge amount charged for this transaction by the merchant.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge, nil]
            required :surcharge,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge },
                     nil?: true

            # @!attribute total_cumulative
            #   The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative, nil]
            required :total_cumulative,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative },
                     nil?: true

            # @!attribute total_healthcare
            #   The total amount of healthcare-related additional amounts.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare, nil]
            required :total_healthcare,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare },
                     nil?: true

            # @!attribute transit
            #   The part of this transaction amount that was for transit-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Transit, nil]
            required :transit,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Transit },
                     nil?: true

            # @!attribute unknown
            #   An unknown additional amount.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown, nil]
            required :unknown,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown },
                     nil?: true

            # @!attribute vision
            #   The part of this transaction amount that was for vision-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Vision, nil]
            required :vision,
                     -> { Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Vision },
                     nil?: true

            # @!method initialize(clinic:, dental:, prescription:, surcharge:, total_cumulative:, total_healthcare:, transit:, unknown:, vision:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts} for
            #   more details.
            #
            #   Additional amounts associated with the card authorization, such as ATM
            #   surcharges fees. These are usually a subset of the `amount` field and are used
            #   to provide more detailed information about the transaction.
            #
            #   @param clinic [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic, nil] The part of this transaction amount that was for clinic-related services.
            #
            #   @param dental [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Dental, nil] The part of this transaction amount that was for dental-related services.
            #
            #   @param prescription [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription, nil] The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @param surcharge [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge, nil] The surcharge amount charged for this transaction by the merchant.
            #
            #   @param total_cumulative [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative, nil] The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @param total_healthcare [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare, nil] The total amount of healthcare-related additional amounts.
            #
            #   @param transit [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Transit, nil] The part of this transaction amount that was for transit-related services.
            #
            #   @param unknown [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown, nil] An unknown additional amount.
            #
            #   @param vision [Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Vision, nil] The part of this transaction amount that was for vision-related services.

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#clinic
            class Clinic < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic}
              #   for more details.
              #
              #   The part of this transaction amount that was for clinic-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#dental
            class Dental < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Dental}
              #   for more details.
              #
              #   The part of this transaction amount that was for dental-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#prescription
            class Prescription < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription}
              #   for more details.
              #
              #   The part of this transaction amount that was for healthcare prescriptions.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#surcharge
            class Surcharge < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge}
              #   for more details.
              #
              #   The surcharge amount charged for this transaction by the merchant.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#total_cumulative
            class TotalCumulative < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative}
              #   for more details.
              #
              #   The total amount of a series of incremental authorizations, optionally provided.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#total_healthcare
            class TotalHealthcare < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare}
              #   for more details.
              #
              #   The total amount of healthcare-related additional amounts.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#transit
            class Transit < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Transit}
              #   for more details.
              #
              #   The part of this transaction amount that was for transit-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#unknown
            class Unknown < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown}
              #   for more details.
              #
              #   An unknown additional amount.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts#vision
            class Vision < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardDecline::AdditionalAmounts::Vision}
              #   for more details.
              #
              #   The part of this transaction amount that was for vision-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          #
          # @see Increase::Models::CardPayment::Element::CardDecline#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          #
          # @see Increase::Models::CardPayment::Element::CardDecline#direction
          module Direction
            extend Increase::Internal::Type::Enum

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT = :settlement

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND = :refund

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardDecline#network_details
          class NetworkDetails < Increase::Internal::Type::BaseModel
            # @!attribute category
            #   The payment network used to process this card authorization.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Category]
            required :category, enum: -> { Increase::CardPayment::Element::CardDecline::NetworkDetails::Category }

            # @!attribute visa
            #   Fields specific to the `visa` network.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa, nil]
            required :visa,
                     -> {
                       Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa
                     },
                     nil?: true

            # @!method initialize(category:, visa:)
            #   Fields specific to the `network`.
            #
            #   @param category [Symbol, Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Category] The payment network used to process this card authorization.
            #
            #   @param visa [Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa, nil] Fields specific to the `visa` network.

            # The payment network used to process this card authorization.
            #
            # @see Increase::Models::CardPayment::Element::CardDecline::NetworkDetails#category
            module Category
              extend Increase::Internal::Type::Enum

              # Visa
              VISA = :visa

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardPayment::Element::CardDecline::NetworkDetails#visa
            class Visa < Increase::Internal::Type::BaseModel
              # @!attribute electronic_commerce_indicator
              #   For electronic commerce transactions, this identifies the level of security used
              #   in obtaining the customer's payment credential. For mail or telephone order
              #   transactions, identifies the type of mail or telephone order.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator, nil]
              required :electronic_commerce_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator
                       },
                       nil?: true

              # @!attribute point_of_service_entry_mode
              #   The method used to enter the cardholder's primary account number and card
              #   expiration date.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode, nil]
              required :point_of_service_entry_mode,
                       enum: -> {
                         Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode
                       },
                       nil?: true

              # @!attribute stand_in_processing_reason
              #   Only present when `actioner: network`. Describes why a card authorization was
              #   approved or declined by Visa through stand-in processing.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason, nil]
              required :stand_in_processing_reason,
                       enum: -> {
                         Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason
                       },
                       nil?: true

              # @!method initialize(electronic_commerce_indicator:, point_of_service_entry_mode:, stand_in_processing_reason:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa} for
              #   more details.
              #
              #   Fields specific to the `visa` network.
              #
              #   @param electronic_commerce_indicator [Symbol, Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator, nil] For electronic commerce transactions, this identifies the level of security used
              #
              #   @param point_of_service_entry_mode [Symbol, Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode, nil] The method used to enter the cardholder's primary account number and card expira
              #
              #   @param stand_in_processing_reason [Symbol, Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason, nil] Only present when `actioner: network`. Describes why a card authorization was ap

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              #
              # @see Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa#electronic_commerce_indicator
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

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however , cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION = :non_authenticated_security_transaction

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION = :non_secure_transaction

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              #
              # @see Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa#point_of_service_entry_mode
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
              # @see Increase::Models::CardPayment::Element::CardDecline::NetworkDetails::Visa#stand_in_processing_reason
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

          # @see Increase::Models::CardPayment::Element::CardDecline#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
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

            # @!method initialize(retrieval_reference_number:, trace_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardDecline::NetworkIdentifiers} for
            #   more details.
            #
            #   Network-specific identifiers for a specific request or transaction.
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
          # @see Increase::Models::CardPayment::Element::CardDecline#processing_category
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

          # This is present if a specific decline reason was given in the real-time
          # decision.
          #
          # @see Increase::Models::CardPayment::Element::CardDecline#real_time_decision_reason
          module RealTimeDecisionReason
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

          # Why the transaction was declined.
          #
          # @see Increase::Models::CardPayment::Element::CardDecline#reason
          module Reason
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

            # The given PIN did not match the card's value.
            PIN_MISMATCH = :pin_mismatch

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

            # The transaction was declined because the 3DS authentication failed.
            FAILED_3DS_AUTHENTICATION = :failed_3ds_authentication

            # The transaction was suspected to be used by a card tester to test for valid card numbers.
            SUSPECTED_CARD_TESTING = :suspected_card_testing

            # The transaction was suspected to be fraudulent. Please reach out to support@increase.com for more information.
            SUSPECTED_FRAUD = :suspected_fraud

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardDecline#verification
          class Verification < Increase::Internal::Type::BaseModel
            # @!attribute card_verification_code
            #   Fields related to verification of the Card Verification Code, a 3-digit code on
            #   the back of the card.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::Verification::CardVerificationCode]
            required :card_verification_code,
                     -> { Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode }

            # @!attribute cardholder_address
            #   Cardholder address provided in the authorization request and the address on file
            #   we verified it against.
            #
            #   @return [Increase::Models::CardPayment::Element::CardDecline::Verification::CardholderAddress]
            required :cardholder_address,
                     -> { Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress }

            # @!method initialize(card_verification_code:, cardholder_address:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardDecline::Verification} for more
            #   details.
            #
            #   Fields related to verification of cardholder-provided values.
            #
            #   @param card_verification_code [Increase::Models::CardPayment::Element::CardDecline::Verification::CardVerificationCode] Fields related to verification of the Card Verification Code, a 3-digit code on
            #
            #   @param cardholder_address [Increase::Models::CardPayment::Element::CardDecline::Verification::CardholderAddress] Cardholder address provided in the authorization request and the address on file

            # @see Increase::Models::CardPayment::Element::CardDecline::Verification#card_verification_code
            class CardVerificationCode < Increase::Internal::Type::BaseModel
              # @!attribute result
              #   The result of verifying the Card Verification Code.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result]
              required :result,
                       enum: -> { Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result }

              # @!method initialize(result:)
              #   Fields related to verification of the Card Verification Code, a 3-digit code on
              #   the back of the card.
              #
              #   @param result [Symbol, Increase::Models::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result] The result of verifying the Card Verification Code.

              # The result of verifying the Card Verification Code.
              #
              # @see Increase::Models::CardPayment::Element::CardDecline::Verification::CardVerificationCode#result
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

            # @see Increase::Models::CardPayment::Element::CardDecline::Verification#cardholder_address
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
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result]
              required :result,
                       enum: -> { Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result }

              # @!method initialize(actual_line1:, actual_postal_code:, provided_line1:, provided_postal_code:, result:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardDecline::Verification::CardholderAddress}
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
              #   @param result [Symbol, Increase::Models::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result] The address verification result returned to the card network.

              # The address verification result returned to the card network.
              #
              # @see Increase::Models::CardPayment::Element::CardDecline::Verification::CardholderAddress#result
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

        # @see Increase::Models::CardPayment::Element#card_fuel_confirmation
        class CardFuelConfirmation < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Fuel Confirmation identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute card_authorization_id
          #   The identifier for the Card Authorization this updates.
          #
          #   @return [String]
          required :card_authorization_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          #   currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardFuelConfirmation::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardFuelConfirmation::Currency }

          # @!attribute network
          #   The card network used to process this card authorization.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardFuelConfirmation::Network]
          required :network, enum: -> { Increase::CardPayment::Element::CardFuelConfirmation::Network }

          # @!attribute network_identifiers
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers]
          required :network_identifiers,
                   -> { Increase::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers }

          # @!attribute pending_transaction_id
          #   The identifier of the Pending Transaction associated with this Card Fuel
          #   Confirmation.
          #
          #   @return [String, nil]
          required :pending_transaction_id, String, nil?: true

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_fuel_confirmation`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardFuelConfirmation::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardFuelConfirmation::Type }

          # @!attribute updated_authorization_amount
          #   The updated authorization amount after this fuel confirmation, in the minor unit
          #   of the transaction's currency. For dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :updated_authorization_amount, Integer

          # @!method initialize(id:, card_authorization_id:, currency:, network:, network_identifiers:, pending_transaction_id:, type:, updated_authorization_amount:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardFuelConfirmation} for more details.
          #
          #   A Card Fuel Confirmation object. This field will be present in the JSON response
          #   if and only if `category` is equal to `card_fuel_confirmation`. Card Fuel
          #   Confirmations update the amount of a Card Authorization after a fuel pump
          #   transaction is completed.
          #
          #   @param id [String] The Card Fuel Confirmation identifier.
          #
          #   @param card_authorization_id [String] The identifier for the Card Authorization this updates.
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardFuelConfirmation::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          #
          #   @param network [Symbol, Increase::Models::CardPayment::Element::CardFuelConfirmation::Network] The card network used to process this card authorization.
          #
          #   @param network_identifiers [Increase::Models::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
          #
          #   @param pending_transaction_id [String, nil] The identifier of the Pending Transaction associated with this Card Fuel Confirm
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardFuelConfirmation::Type] A constant representing the object's type. For this resource it will always be `
          #
          #   @param updated_authorization_amount [Integer] The updated authorization amount after this fuel confirmation, in the minor unit

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          # currency.
          #
          # @see Increase::Models::CardPayment::Element::CardFuelConfirmation#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The card network used to process this card authorization.
          #
          # @see Increase::Models::CardPayment::Element::CardFuelConfirmation#network
          module Network
            extend Increase::Internal::Type::Enum

            # Visa
            VISA = :visa

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardFuelConfirmation#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
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

            # @!method initialize(retrieval_reference_number:, trace_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers}
            #   for more details.
            #
            #   Network-specific identifiers for a specific request or transaction.
            #
            #   @param retrieval_reference_number [String, nil] A life-cycle identifier used across e.g., an authorization and a reversal. Expec
            #
            #   @param trace_number [String, nil] A counter used to verify an individual authorization. Expected to be unique per
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_fuel_confirmation`.
          #
          # @see Increase::Models::CardPayment::Element::CardFuelConfirmation#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_FUEL_CONFIRMATION = :card_fuel_confirmation

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::CardPayment::Element#card_increment
        class CardIncrement < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Increment identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute actioner
          #   Whether this authorization was approved by Increase, the card network through
          #   stand-in processing, or the user through a real-time decision.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardIncrement::Actioner]
          required :actioner, enum: -> { Increase::CardPayment::Element::CardIncrement::Actioner }

          # @!attribute additional_amounts
          #   Additional amounts associated with the card authorization, such as ATM
          #   surcharges fees. These are usually a subset of the `amount` field and are used
          #   to provide more detailed information about the transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts]
          required :additional_amounts, -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts }

          # @!attribute amount
          #   The amount of this increment in the minor unit of the transaction's currency.
          #   For dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_authorization_id
          #   The identifier for the Card Authorization this increments.
          #
          #   @return [String]
          required :card_authorization_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          #   currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardIncrement::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardIncrement::Currency }

          # @!attribute network
          #   The card network used to process this card authorization.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardIncrement::Network]
          required :network, enum: -> { Increase::CardPayment::Element::CardIncrement::Network }

          # @!attribute network_identifiers
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardIncrement::NetworkIdentifiers]
          required :network_identifiers, -> { Increase::CardPayment::Element::CardIncrement::NetworkIdentifiers }

          # @!attribute network_risk_score
          #   The risk score generated by the card network. For Visa this is the Visa Advanced
          #   Authorization risk score, from 0 to 99, where 99 is the riskiest.
          #
          #   @return [Integer, nil]
          required :network_risk_score, Integer, nil?: true

          # @!attribute pending_transaction_id
          #   The identifier of the Pending Transaction associated with this Card Increment.
          #
          #   @return [String, nil]
          required :pending_transaction_id, String, nil?: true

          # @!attribute presentment_amount
          #   The amount of this increment in the minor unit of the transaction's presentment
          #   currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute real_time_decision_id
          #   The identifier of the Real-Time Decision sent to approve or decline this
          #   incremental authorization.
          #
          #   @return [String, nil]
          required :real_time_decision_id, String, nil?: true

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_increment`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardIncrement::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardIncrement::Type }

          # @!attribute updated_authorization_amount
          #   The updated authorization amount after this increment, in the minor unit of the
          #   transaction's currency. For dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :updated_authorization_amount, Integer

          # @!method initialize(id:, actioner:, additional_amounts:, amount:, card_authorization_id:, currency:, network:, network_identifiers:, network_risk_score:, pending_transaction_id:, presentment_amount:, presentment_currency:, real_time_decision_id:, type:, updated_authorization_amount:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardIncrement} for more details.
          #
          #   A Card Increment object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_increment`. Card Increments increase the
          #   pending amount of an authorized transaction.
          #
          #   @param id [String] The Card Increment identifier.
          #
          #   @param actioner [Symbol, Increase::Models::CardPayment::Element::CardIncrement::Actioner] Whether this authorization was approved by Increase, the card network through st
          #
          #   @param additional_amounts [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts] Additional amounts associated with the card authorization, such as ATM surcharge
          #
          #   @param amount [Integer] The amount of this increment in the minor unit of the transaction's currency. Fo
          #
          #   @param card_authorization_id [String] The identifier for the Card Authorization this increments.
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardIncrement::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          #
          #   @param network [Symbol, Increase::Models::CardPayment::Element::CardIncrement::Network] The card network used to process this card authorization.
          #
          #   @param network_identifiers [Increase::Models::CardPayment::Element::CardIncrement::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
          #
          #   @param network_risk_score [Integer, nil] The risk score generated by the card network. For Visa this is the Visa Advanced
          #
          #   @param pending_transaction_id [String, nil] The identifier of the Pending Transaction associated with this Card Increment.
          #
          #   @param presentment_amount [Integer] The amount of this increment in the minor unit of the transaction's presentment
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param real_time_decision_id [String, nil] The identifier of the Real-Time Decision sent to approve or decline this increme
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardIncrement::Type] A constant representing the object's type. For this resource it will always be `
          #
          #   @param updated_authorization_amount [Integer] The updated authorization amount after this increment, in the minor unit of the

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          #
          # @see Increase::Models::CardPayment::Element::CardIncrement#actioner
          module Actioner
            extend Increase::Internal::Type::Enum

            # This object was actioned by the user through a real-time decision.
            USER = :user

            # This object was actioned by Increase without user intervention.
            INCREASE = :increase

            # This object was actioned by the network, through stand-in processing.
            NETWORK = :network

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardIncrement#additional_amounts
          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            # @!attribute clinic
            #   The part of this transaction amount that was for clinic-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic, nil]
            required :clinic,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic },
                     nil?: true

            # @!attribute dental
            #   The part of this transaction amount that was for dental-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental, nil]
            required :dental,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental },
                     nil?: true

            # @!attribute prescription
            #   The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription, nil]
            required :prescription,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription },
                     nil?: true

            # @!attribute surcharge
            #   The surcharge amount charged for this transaction by the merchant.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge, nil]
            required :surcharge,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge },
                     nil?: true

            # @!attribute total_cumulative
            #   The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative, nil]
            required :total_cumulative,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative },
                     nil?: true

            # @!attribute total_healthcare
            #   The total amount of healthcare-related additional amounts.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare, nil]
            required :total_healthcare,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare },
                     nil?: true

            # @!attribute transit
            #   The part of this transaction amount that was for transit-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit, nil]
            required :transit,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit },
                     nil?: true

            # @!attribute unknown
            #   An unknown additional amount.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown, nil]
            required :unknown,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown },
                     nil?: true

            # @!attribute vision
            #   The part of this transaction amount that was for vision-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision, nil]
            required :vision,
                     -> { Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision },
                     nil?: true

            # @!method initialize(clinic:, dental:, prescription:, surcharge:, total_cumulative:, total_healthcare:, transit:, unknown:, vision:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts} for
            #   more details.
            #
            #   Additional amounts associated with the card authorization, such as ATM
            #   surcharges fees. These are usually a subset of the `amount` field and are used
            #   to provide more detailed information about the transaction.
            #
            #   @param clinic [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic, nil] The part of this transaction amount that was for clinic-related services.
            #
            #   @param dental [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental, nil] The part of this transaction amount that was for dental-related services.
            #
            #   @param prescription [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription, nil] The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @param surcharge [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge, nil] The surcharge amount charged for this transaction by the merchant.
            #
            #   @param total_cumulative [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative, nil] The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @param total_healthcare [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare, nil] The total amount of healthcare-related additional amounts.
            #
            #   @param transit [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit, nil] The part of this transaction amount that was for transit-related services.
            #
            #   @param unknown [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown, nil] An unknown additional amount.
            #
            #   @param vision [Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision, nil] The part of this transaction amount that was for vision-related services.

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#clinic
            class Clinic < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic}
              #   for more details.
              #
              #   The part of this transaction amount that was for clinic-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#dental
            class Dental < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental}
              #   for more details.
              #
              #   The part of this transaction amount that was for dental-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#prescription
            class Prescription < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription}
              #   for more details.
              #
              #   The part of this transaction amount that was for healthcare prescriptions.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#surcharge
            class Surcharge < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge}
              #   for more details.
              #
              #   The surcharge amount charged for this transaction by the merchant.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#total_cumulative
            class TotalCumulative < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative}
              #   for more details.
              #
              #   The total amount of a series of incremental authorizations, optionally provided.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#total_healthcare
            class TotalHealthcare < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare}
              #   for more details.
              #
              #   The total amount of healthcare-related additional amounts.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#transit
            class Transit < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit}
              #   for more details.
              #
              #   The part of this transaction amount that was for transit-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#unknown
            class Unknown < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown}
              #   for more details.
              #
              #   An unknown additional amount.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts#vision
            class Vision < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision}
              #   for more details.
              #
              #   The part of this transaction amount that was for vision-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          # currency.
          #
          # @see Increase::Models::CardPayment::Element::CardIncrement#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The card network used to process this card authorization.
          #
          # @see Increase::Models::CardPayment::Element::CardIncrement#network
          module Network
            extend Increase::Internal::Type::Enum

            # Visa
            VISA = :visa

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardIncrement#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
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

            # @!method initialize(retrieval_reference_number:, trace_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardIncrement::NetworkIdentifiers} for
            #   more details.
            #
            #   Network-specific identifiers for a specific request or transaction.
            #
            #   @param retrieval_reference_number [String, nil] A life-cycle identifier used across e.g., an authorization and a reversal. Expec
            #
            #   @param trace_number [String, nil] A counter used to verify an individual authorization. Expected to be unique per
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_increment`.
          #
          # @see Increase::Models::CardPayment::Element::CardIncrement#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_INCREMENT = :card_increment

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::CardPayment::Element#card_refund
        class CardRefund < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Refund identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute amount
          #   The amount in the minor unit of the transaction's settlement currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute cashback
          #   Cashback debited for this transaction, if eligible. Cashback is paid out in
          #   aggregate, monthly.
          #
          #   @return [Increase::Models::CardPayment::Element::CardRefund::Cashback, nil]
          required :cashback, -> { Increase::CardPayment::Element::CardRefund::Cashback }, nil?: true

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's settlement currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardRefund::Currency }

          # @!attribute interchange
          #   Interchange assessed as a part of this transaciton.
          #
          #   @return [Increase::Models::CardPayment::Element::CardRefund::Interchange, nil]
          required :interchange, -> { Increase::CardPayment::Element::CardRefund::Interchange }, nil?: true

          # @!attribute merchant_acceptor_id
          #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
          #   is transacting with.
          #
          #   @return [String]
          required :merchant_acceptor_id, String

          # @!attribute merchant_category_code
          #   The 4-digit MCC describing the merchant's business.
          #
          #   @return [String]
          required :merchant_category_code, String

          # @!attribute merchant_city
          #   The city the merchant resides in.
          #
          #   @return [String]
          required :merchant_city, String

          # @!attribute merchant_country
          #   The country the merchant resides in.
          #
          #   @return [String]
          required :merchant_country, String

          # @!attribute merchant_name
          #   The name of the merchant.
          #
          #   @return [String]
          required :merchant_name, String

          # @!attribute merchant_postal_code
          #   The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          #
          #   @return [String, nil]
          required :merchant_postal_code, String, nil?: true

          # @!attribute merchant_state
          #   The state the merchant resides in.
          #
          #   @return [String, nil]
          required :merchant_state, String, nil?: true

          # @!attribute network_identifiers
          #   Network-specific identifiers for this refund.
          #
          #   @return [Increase::Models::CardPayment::Element::CardRefund::NetworkIdentifiers]
          required :network_identifiers, -> { Increase::CardPayment::Element::CardRefund::NetworkIdentifiers }

          # @!attribute presentment_amount
          #   The amount in the minor unit of the transaction's presentment currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute purchase_details
          #   Additional details about the card purchase, such as tax and industry-specific
          #   fields.
          #
          #   @return [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails, nil]
          required :purchase_details,
                   -> {
                     Increase::CardPayment::Element::CardRefund::PurchaseDetails
                   },
                   nil?: true

          # @!attribute transaction_id
          #   The identifier of the Transaction associated with this Transaction.
          #
          #   @return [String]
          required :transaction_id, String

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_refund`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardRefund::Type }

          # @!method initialize(id:, amount:, card_payment_id:, cashback:, currency:, interchange:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_name:, merchant_postal_code:, merchant_state:, network_identifiers:, presentment_amount:, presentment_currency:, purchase_details:, transaction_id:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardRefund} for more details.
          #
          #   A Card Refund object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_refund`. Card Refunds move money back to
          #   the cardholder. While they are usually connected to a Card Settlement an
          #   acquirer can also refund money directly to a card without relation to a
          #   transaction.
          #
          #   @param id [String] The Card Refund identifier.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's settlement currency. For dolla
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param cashback [Increase::Models::CardPayment::Element::CardRefund::Cashback, nil] Cashback debited for this transaction, if eligible. Cashback is paid out in aggr
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardRefund::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param interchange [Increase::Models::CardPayment::Element::CardRefund::Interchange, nil] Interchange assessed as a part of this transaciton.
          #
          #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
          #
          #   @param merchant_category_code [String] The 4-digit MCC describing the merchant's business.
          #
          #   @param merchant_city [String] The city the merchant resides in.
          #
          #   @param merchant_country [String] The country the merchant resides in.
          #
          #   @param merchant_name [String] The name of the merchant.
          #
          #   @param merchant_postal_code [String, nil] The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          #
          #   @param merchant_state [String, nil] The state the merchant resides in.
          #
          #   @param network_identifiers [Increase::Models::CardPayment::Element::CardRefund::NetworkIdentifiers] Network-specific identifiers for this refund.
          #
          #   @param presentment_amount [Integer] The amount in the minor unit of the transaction's presentment currency.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param purchase_details [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails, nil] Additional details about the card purchase, such as tax and industry-specific fi
          #
          #   @param transaction_id [String] The identifier of the Transaction associated with this Transaction.
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardRefund::Type] A constant representing the object's type. For this resource it will always be `

          # @see Increase::Models::CardPayment::Element::CardRefund#cashback
          class Cashback < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The cashback amount given as a string containing a decimal number. The amount is
            #   a positive number if it will be credited to you (e.g., settlements) and a
            #   negative number if it will be debited (e.g., refunds).
            #
            #   @return [String]
            required :amount, String

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::Cashback::Currency]
            required :currency, enum: -> { Increase::CardPayment::Element::CardRefund::Cashback::Currency }

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardRefund::Cashback} for more details.
            #
            #   Cashback debited for this transaction, if eligible. Cashback is paid out in
            #   aggregate, monthly.
            #
            #   @param amount [String] The cashback amount given as a string containing a decimal number. The amount is
            #
            #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardRefund::Cashback::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            #
            # @see Increase::Models::CardPayment::Element::CardRefund::Cashback#currency
            module Currency
              extend Increase::Internal::Type::Enum

              # Canadian Dollar (CAD)
              CAD = :CAD

              # Swiss Franc (CHF)
              CHF = :CHF

              # Euro (EUR)
              EUR = :EUR

              # British Pound (GBP)
              GBP = :GBP

              # Japanese Yen (JPY)
              JPY = :JPY

              # US Dollar (USD)
              USD = :USD

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          #
          # @see Increase::Models::CardPayment::Element::CardRefund#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardRefund#interchange
          class Interchange < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The interchange amount given as a string containing a decimal number in major
            #   units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
            #   credited to Increase (e.g., settlements) and a negative number if it is debited
            #   (e.g., refunds).
            #
            #   @return [String]
            required :amount, String

            # @!attribute code
            #   The card network specific interchange code.
            #
            #   @return [String, nil]
            required :code, String, nil?: true

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            #   reimbursement.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::Interchange::Currency]
            required :currency, enum: -> { Increase::CardPayment::Element::CardRefund::Interchange::Currency }

            # @!method initialize(amount:, code:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardRefund::Interchange} for more
            #   details.
            #
            #   Interchange assessed as a part of this transaciton.
            #
            #   @param amount [String] The interchange amount given as a string containing a decimal number in major un
            #
            #   @param code [String, nil] The card network specific interchange code.
            #
            #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardRefund::Interchange::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            #
            # @see Increase::Models::CardPayment::Element::CardRefund::Interchange#currency
            module Currency
              extend Increase::Internal::Type::Enum

              # Canadian Dollar (CAD)
              CAD = :CAD

              # Swiss Franc (CHF)
              CHF = :CHF

              # Euro (EUR)
              EUR = :EUR

              # British Pound (GBP)
              GBP = :GBP

              # Japanese Yen (JPY)
              JPY = :JPY

              # US Dollar (USD)
              USD = :USD

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::CardPayment::Element::CardRefund#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            # @!attribute acquirer_business_id
            #   A network assigned business ID that identifies the acquirer that processed this
            #   transaction.
            #
            #   @return [String]
            required :acquirer_business_id, String

            # @!attribute acquirer_reference_number
            #   A globally unique identifier for this settlement.
            #
            #   @return [String]
            required :acquirer_reference_number, String

            # @!attribute transaction_id
            #   A globally unique transaction identifier provided by the card network, used
            #   across multiple life-cycle requests.
            #
            #   @return [String, nil]
            required :transaction_id, String, nil?: true

            # @!method initialize(acquirer_business_id:, acquirer_reference_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardRefund::NetworkIdentifiers} for
            #   more details.
            #
            #   Network-specific identifiers for this refund.
            #
            #   @param acquirer_business_id [String] A network assigned business ID that identifies the acquirer that processed this
            #
            #   @param acquirer_reference_number [String] A globally unique identifier for this settlement.
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # @see Increase::Models::CardPayment::Element::CardRefund#purchase_details
          class PurchaseDetails < Increase::Internal::Type::BaseModel
            # @!attribute car_rental
            #   Fields specific to car rentals.
            #
            #   @return [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental, nil]
            required :car_rental,
                     -> { Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental },
                     nil?: true

            # @!attribute customer_reference_identifier
            #   An identifier from the merchant for the customer or consumer.
            #
            #   @return [String, nil]
            required :customer_reference_identifier, String, nil?: true

            # @!attribute local_tax_amount
            #   The state or provincial tax amount in minor units.
            #
            #   @return [Integer, nil]
            required :local_tax_amount, Integer, nil?: true

            # @!attribute local_tax_currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            #   assessed.
            #
            #   @return [String, nil]
            required :local_tax_currency, String, nil?: true

            # @!attribute lodging
            #   Fields specific to lodging.
            #
            #   @return [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging, nil]
            required :lodging,
                     -> {
                       Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging
                     },
                     nil?: true

            # @!attribute national_tax_amount
            #   The national tax amount in minor units.
            #
            #   @return [Integer, nil]
            required :national_tax_amount, Integer, nil?: true

            # @!attribute national_tax_currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            #   assessed.
            #
            #   @return [String, nil]
            required :national_tax_currency, String, nil?: true

            # @!attribute purchase_identifier
            #   An identifier from the merchant for the purchase to the issuer and cardholder.
            #
            #   @return [String, nil]
            required :purchase_identifier, String, nil?: true

            # @!attribute purchase_identifier_format
            #   The format of the purchase identifier.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat, nil]
            required :purchase_identifier_format,
                     enum: -> {
                       Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat
                     },
                     nil?: true

            # @!attribute travel
            #   Fields specific to travel.
            #
            #   @return [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel, nil]
            required :travel,
                     -> {
                       Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel
                     },
                     nil?: true

            # @!method initialize(car_rental:, customer_reference_identifier:, local_tax_amount:, local_tax_currency:, lodging:, national_tax_amount:, national_tax_currency:, purchase_identifier:, purchase_identifier_format:, travel:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails} for more
            #   details.
            #
            #   Additional details about the card purchase, such as tax and industry-specific
            #   fields.
            #
            #   @param car_rental [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental, nil] Fields specific to car rentals.
            #
            #   @param customer_reference_identifier [String, nil] An identifier from the merchant for the customer or consumer.
            #
            #   @param local_tax_amount [Integer, nil] The state or provincial tax amount in minor units.
            #
            #   @param local_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax as
            #
            #   @param lodging [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging, nil] Fields specific to lodging.
            #
            #   @param national_tax_amount [Integer, nil] The national tax amount in minor units.
            #
            #   @param national_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax as
            #
            #   @param purchase_identifier [String, nil] An identifier from the merchant for the purchase to the issuer and cardholder.
            #
            #   @param purchase_identifier_format [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat, nil] The format of the purchase identifier.
            #
            #   @param travel [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel, nil] Fields specific to travel.

            # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails#car_rental
            class CarRental < Increase::Internal::Type::BaseModel
              # @!attribute car_class_code
              #   Code indicating the vehicle's class.
              #
              #   @return [String, nil]
              required :car_class_code, String, nil?: true

              # @!attribute checkout_date
              #   Date the customer picked up the car or, in the case of a no-show or pre-pay
              #   transaction, the scheduled pick up date.
              #
              #   @return [Date, nil]
              required :checkout_date, Date, nil?: true

              # @!attribute daily_rental_rate_amount
              #   Daily rate being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :daily_rental_rate_amount, Integer, nil?: true

              # @!attribute daily_rental_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              #   rate.
              #
              #   @return [String, nil]
              required :daily_rental_rate_currency, String, nil?: true

              # @!attribute days_rented
              #   Number of days the vehicle was rented.
              #
              #   @return [Integer, nil]
              required :days_rented, Integer, nil?: true

              # @!attribute extra_charges
              #   Additional charges (gas, late fee, etc.) being billed.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges, nil]
              required :extra_charges,
                       enum: -> {
                         Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges
                       },
                       nil?: true

              # @!attribute fuel_charges_amount
              #   Fuel charges for the vehicle.
              #
              #   @return [Integer, nil]
              required :fuel_charges_amount, Integer, nil?: true

              # @!attribute fuel_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              #   assessed.
              #
              #   @return [String, nil]
              required :fuel_charges_currency, String, nil?: true

              # @!attribute insurance_charges_amount
              #   Any insurance being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :insurance_charges_amount, Integer, nil?: true

              # @!attribute insurance_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
              #   charges assessed.
              #
              #   @return [String, nil]
              required :insurance_charges_currency, String, nil?: true

              # @!attribute no_show_indicator
              #   An indicator that the cardholder is being billed for a reserved vehicle that was
              #   not actually rented (that is, a "no-show" charge).
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator, nil]
              required :no_show_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator
                       },
                       nil?: true

              # @!attribute one_way_drop_off_charges_amount
              #   Charges for returning the vehicle at a different location than where it was
              #   picked up.
              #
              #   @return [Integer, nil]
              required :one_way_drop_off_charges_amount, Integer, nil?: true

              # @!attribute one_way_drop_off_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
              #   drop-off charges assessed.
              #
              #   @return [String, nil]
              required :one_way_drop_off_charges_currency, String, nil?: true

              # @!attribute renter_name
              #   Name of the person renting the vehicle.
              #
              #   @return [String, nil]
              required :renter_name, String, nil?: true

              # @!attribute weekly_rental_rate_amount
              #   Weekly rate being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :weekly_rental_rate_amount, Integer, nil?: true

              # @!attribute weekly_rental_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
              #   rental rate.
              #
              #   @return [String, nil]
              required :weekly_rental_rate_currency, String, nil?: true

              # @!method initialize(car_class_code:, checkout_date:, daily_rental_rate_amount:, daily_rental_rate_currency:, days_rented:, extra_charges:, fuel_charges_amount:, fuel_charges_currency:, insurance_charges_amount:, insurance_charges_currency:, no_show_indicator:, one_way_drop_off_charges_amount:, one_way_drop_off_charges_currency:, renter_name:, weekly_rental_rate_amount:, weekly_rental_rate_currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental}
              #   for more details.
              #
              #   Fields specific to car rentals.
              #
              #   @param car_class_code [String, nil] Code indicating the vehicle's class.
              #
              #   @param checkout_date [Date, nil] Date the customer picked up the car or, in the case of a no-show or pre-pay tran
              #
              #   @param daily_rental_rate_amount [Integer, nil] Daily rate being charged for the vehicle.
              #
              #   @param daily_rental_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              #
              #   @param days_rented [Integer, nil] Number of days the vehicle was rented.
              #
              #   @param extra_charges [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges, nil] Additional charges (gas, late fee, etc.) being billed.
              #
              #   @param fuel_charges_amount [Integer, nil] Fuel charges for the vehicle.
              #
              #   @param fuel_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              #
              #   @param insurance_charges_amount [Integer, nil] Any insurance being charged for the vehicle.
              #
              #   @param insurance_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance ch
              #
              #   @param no_show_indicator [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator, nil] An indicator that the cardholder is being billed for a reserved vehicle that was
              #
              #   @param one_way_drop_off_charges_amount [Integer, nil] Charges for returning the vehicle at a different location than where it was pick
              #
              #   @param one_way_drop_off_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way drop
              #
              #   @param renter_name [String, nil] Name of the person renting the vehicle.
              #
              #   @param weekly_rental_rate_amount [Integer, nil] Weekly rate being charged for the vehicle.
              #
              #   @param weekly_rental_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly renta

              # Additional charges (gas, late fee, etc.) being billed.
              #
              # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental#extra_charges
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                # No extra charge
                NO_EXTRA_CHARGE = :no_extra_charge

                # Gas
                GAS = :gas

                # Extra mileage
                EXTRA_MILEAGE = :extra_mileage

                # Late return
                LATE_RETURN = :late_return

                # One way service fee
                ONE_WAY_SERVICE_FEE = :one_way_service_fee

                # Parking violation
                PARKING_VIOLATION = :parking_violation

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              #
              # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::CarRental#no_show_indicator
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                # Not applicable
                NOT_APPLICABLE = :not_applicable

                # No show for specialized vehicle
                NO_SHOW_FOR_SPECIALIZED_VEHICLE = :no_show_for_specialized_vehicle

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails#lodging
            class Lodging < Increase::Internal::Type::BaseModel
              # @!attribute check_in_date
              #   Date the customer checked in.
              #
              #   @return [Date, nil]
              required :check_in_date, Date, nil?: true

              # @!attribute daily_room_rate_amount
              #   Daily rate being charged for the room.
              #
              #   @return [Integer, nil]
              required :daily_room_rate_amount, Integer, nil?: true

              # @!attribute daily_room_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
              #   rate.
              #
              #   @return [String, nil]
              required :daily_room_rate_currency, String, nil?: true

              # @!attribute extra_charges
              #   Additional charges (phone, late check-out, etc.) being billed.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges, nil]
              required :extra_charges,
                       enum: -> {
                         Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges
                       },
                       nil?: true

              # @!attribute folio_cash_advances_amount
              #   Folio cash advances for the room.
              #
              #   @return [Integer, nil]
              required :folio_cash_advances_amount, Integer, nil?: true

              # @!attribute folio_cash_advances_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
              #   advances.
              #
              #   @return [String, nil]
              required :folio_cash_advances_currency, String, nil?: true

              # @!attribute food_beverage_charges_amount
              #   Food and beverage charges for the room.
              #
              #   @return [Integer, nil]
              required :food_beverage_charges_amount, Integer, nil?: true

              # @!attribute food_beverage_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
              #   beverage charges.
              #
              #   @return [String, nil]
              required :food_beverage_charges_currency, String, nil?: true

              # @!attribute no_show_indicator
              #   Indicator that the cardholder is being billed for a reserved room that was not
              #   actually used.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator, nil]
              required :no_show_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator
                       },
                       nil?: true

              # @!attribute prepaid_expenses_amount
              #   Prepaid expenses being charged for the room.
              #
              #   @return [Integer, nil]
              required :prepaid_expenses_amount, Integer, nil?: true

              # @!attribute prepaid_expenses_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
              #   expenses.
              #
              #   @return [String, nil]
              required :prepaid_expenses_currency, String, nil?: true

              # @!attribute room_nights
              #   Number of nights the room was rented.
              #
              #   @return [Integer, nil]
              required :room_nights, Integer, nil?: true

              # @!attribute total_room_tax_amount
              #   Total room tax being charged.
              #
              #   @return [Integer, nil]
              required :total_room_tax_amount, Integer, nil?: true

              # @!attribute total_room_tax_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
              #   tax.
              #
              #   @return [String, nil]
              required :total_room_tax_currency, String, nil?: true

              # @!attribute total_tax_amount
              #   Total tax being charged for the room.
              #
              #   @return [Integer, nil]
              required :total_tax_amount, Integer, nil?: true

              # @!attribute total_tax_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
              #   assessed.
              #
              #   @return [String, nil]
              required :total_tax_currency, String, nil?: true

              # @!method initialize(check_in_date:, daily_room_rate_amount:, daily_room_rate_currency:, extra_charges:, folio_cash_advances_amount:, folio_cash_advances_currency:, food_beverage_charges_amount:, food_beverage_charges_currency:, no_show_indicator:, prepaid_expenses_amount:, prepaid_expenses_currency:, room_nights:, total_room_tax_amount:, total_room_tax_currency:, total_tax_amount:, total_tax_currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging}
              #   for more details.
              #
              #   Fields specific to lodging.
              #
              #   @param check_in_date [Date, nil] Date the customer checked in.
              #
              #   @param daily_room_rate_amount [Integer, nil] Daily rate being charged for the room.
              #
              #   @param daily_room_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room r
              #
              #   @param extra_charges [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges, nil] Additional charges (phone, late check-out, etc.) being billed.
              #
              #   @param folio_cash_advances_amount [Integer, nil] Folio cash advances for the room.
              #
              #   @param folio_cash_advances_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash a
              #
              #   @param food_beverage_charges_amount [Integer, nil] Food and beverage charges for the room.
              #
              #   @param food_beverage_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and bev
              #
              #   @param no_show_indicator [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator, nil] Indicator that the cardholder is being billed for a reserved room that was not a
              #
              #   @param prepaid_expenses_amount [Integer, nil] Prepaid expenses being charged for the room.
              #
              #   @param prepaid_expenses_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid expe
              #
              #   @param room_nights [Integer, nil] Number of nights the room was rented.
              #
              #   @param total_room_tax_amount [Integer, nil] Total room tax being charged.
              #
              #   @param total_room_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room t
              #
              #   @param total_tax_amount [Integer, nil] Total tax being charged for the room.
              #
              #   @param total_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax as

              # Additional charges (phone, late check-out, etc.) being billed.
              #
              # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging#extra_charges
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                # No extra charge
                NO_EXTRA_CHARGE = :no_extra_charge

                # Restaurant
                RESTAURANT = :restaurant

                # Gift shop
                GIFT_SHOP = :gift_shop

                # Mini bar
                MINI_BAR = :mini_bar

                # Telephone
                TELEPHONE = :telephone

                # Other
                OTHER = :other

                # Laundry
                LAUNDRY = :laundry

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              #
              # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Lodging#no_show_indicator
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                # Not applicable
                NOT_APPLICABLE = :not_applicable

                # No show
                NO_SHOW = :no_show

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # The format of the purchase identifier.
            #
            # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails#purchase_identifier_format
            module PurchaseIdentifierFormat
              extend Increase::Internal::Type::Enum

              # Free text
              FREE_TEXT = :free_text

              # Order number
              ORDER_NUMBER = :order_number

              # Rental agreement number
              RENTAL_AGREEMENT_NUMBER = :rental_agreement_number

              # Hotel folio number
              HOTEL_FOLIO_NUMBER = :hotel_folio_number

              # Invoice number
              INVOICE_NUMBER = :invoice_number

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails#travel
            class Travel < Increase::Internal::Type::BaseModel
              # @!attribute ancillary
              #   Ancillary purchases in addition to the airfare.
              #
              #   @return [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary, nil]
              required :ancillary,
                       -> { Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary },
                       nil?: true

              # @!attribute computerized_reservation_system
              #   Indicates the computerized reservation system used to book the ticket.
              #
              #   @return [String, nil]
              required :computerized_reservation_system, String, nil?: true

              # @!attribute credit_reason_indicator
              #   Indicates the reason for a credit to the cardholder.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator, nil]
              required :credit_reason_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator
                       },
                       nil?: true

              # @!attribute departure_date
              #   Date of departure.
              #
              #   @return [Date, nil]
              required :departure_date, Date, nil?: true

              # @!attribute origination_city_airport_code
              #   Code for the originating city or airport.
              #
              #   @return [String, nil]
              required :origination_city_airport_code, String, nil?: true

              # @!attribute passenger_name
              #   Name of the passenger.
              #
              #   @return [String, nil]
              required :passenger_name, String, nil?: true

              # @!attribute restricted_ticket_indicator
              #   Indicates whether this ticket is non-refundable.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator, nil]
              required :restricted_ticket_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator
                       },
                       nil?: true

              # @!attribute ticket_change_indicator
              #   Indicates why a ticket was changed.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator, nil]
              required :ticket_change_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator
                       },
                       nil?: true

              # @!attribute ticket_number
              #   Ticket number.
              #
              #   @return [String, nil]
              required :ticket_number, String, nil?: true

              # @!attribute travel_agency_code
              #   Code for the travel agency if the ticket was issued by a travel agency.
              #
              #   @return [String, nil]
              required :travel_agency_code, String, nil?: true

              # @!attribute travel_agency_name
              #   Name of the travel agency if the ticket was issued by a travel agency.
              #
              #   @return [String, nil]
              required :travel_agency_name, String, nil?: true

              # @!attribute trip_legs
              #   Fields specific to each leg of the journey.
              #
              #   @return [Array<Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg>, nil]
              required :trip_legs,
                       -> {
                         Increase::Internal::Type::ArrayOf[Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg]
                       },
                       nil?: true

              # @!method initialize(ancillary:, computerized_reservation_system:, credit_reason_indicator:, departure_date:, origination_city_airport_code:, passenger_name:, restricted_ticket_indicator:, ticket_change_indicator:, ticket_number:, travel_agency_code:, travel_agency_name:, trip_legs:)
              #   Fields specific to travel.
              #
              #   @param ancillary [Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary, nil] Ancillary purchases in addition to the airfare.
              #
              #   @param computerized_reservation_system [String, nil] Indicates the computerized reservation system used to book the ticket.
              #
              #   @param credit_reason_indicator [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator, nil] Indicates the reason for a credit to the cardholder.
              #
              #   @param departure_date [Date, nil] Date of departure.
              #
              #   @param origination_city_airport_code [String, nil] Code for the originating city or airport.
              #
              #   @param passenger_name [String, nil] Name of the passenger.
              #
              #   @param restricted_ticket_indicator [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator, nil] Indicates whether this ticket is non-refundable.
              #
              #   @param ticket_change_indicator [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator, nil] Indicates why a ticket was changed.
              #
              #   @param ticket_number [String, nil] Ticket number.
              #
              #   @param travel_agency_code [String, nil] Code for the travel agency if the ticket was issued by a travel agency.
              #
              #   @param travel_agency_name [String, nil] Name of the travel agency if the ticket was issued by a travel agency.
              #
              #   @param trip_legs [Array<Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg>, nil] Fields specific to each leg of the journey.

              # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel#ancillary
              class Ancillary < Increase::Internal::Type::BaseModel
                # @!attribute connected_ticket_document_number
                #   If this purchase has a connection or relationship to another purchase, such as a
                #   baggage fee for a passenger transport ticket, this field should contain the
                #   ticket document number for the other purchase.
                #
                #   @return [String, nil]
                required :connected_ticket_document_number, String, nil?: true

                # @!attribute credit_reason_indicator
                #   Indicates the reason for a credit to the cardholder.
                #
                #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator, nil]
                required :credit_reason_indicator,
                         enum: -> {
                           Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator
                         },
                         nil?: true

                # @!attribute passenger_name_or_description
                #   Name of the passenger or description of the ancillary purchase.
                #
                #   @return [String, nil]
                required :passenger_name_or_description, String, nil?: true

                # @!attribute services
                #   Additional travel charges, such as baggage fees.
                #
                #   @return [Array<Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service>]
                required :services,
                         -> { Increase::Internal::Type::ArrayOf[Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service] }

                # @!attribute ticket_document_number
                #   Ticket document number.
                #
                #   @return [String, nil]
                required :ticket_document_number, String, nil?: true

                # @!method initialize(connected_ticket_document_number:, credit_reason_indicator:, passenger_name_or_description:, services:, ticket_document_number:)
                #   Some parameter documentations has been truncated, see
                #   {Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary}
                #   for more details.
                #
                #   Ancillary purchases in addition to the airfare.
                #
                #   @param connected_ticket_document_number [String, nil] If this purchase has a connection or relationship to another purchase, such as a
                #
                #   @param credit_reason_indicator [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator, nil] Indicates the reason for a credit to the cardholder.
                #
                #   @param passenger_name_or_description [String, nil] Name of the passenger or description of the ancillary purchase.
                #
                #   @param services [Array<Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service>] Additional travel charges, such as baggage fees.
                #
                #   @param ticket_document_number [String, nil] Ticket document number.

                # Indicates the reason for a credit to the cardholder.
                #
                # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary#credit_reason_indicator
                module CreditReasonIndicator
                  extend Increase::Internal::Type::Enum

                  # No credit
                  NO_CREDIT = :no_credit

                  # Passenger transport ancillary purchase cancellation
                  PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    :passenger_transport_ancillary_purchase_cancellation

                  # Airline ticket and passenger transport ancillary purchase cancellation
                  AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation

                  # Other
                  OTHER = :other

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                class Service < Increase::Internal::Type::BaseModel
                  # @!attribute category
                  #   Category of the ancillary service.
                  #
                  #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category, nil]
                  required :category,
                           enum: -> {
                             Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category
                           },
                           nil?: true

                  # @!attribute sub_category
                  #   Sub-category of the ancillary service, free-form.
                  #
                  #   @return [String, nil]
                  required :sub_category, String, nil?: true

                  # @!method initialize(category:, sub_category:)
                  #   @param category [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category, nil] Category of the ancillary service.
                  #
                  #   @param sub_category [String, nil] Sub-category of the ancillary service, free-form.

                  # Category of the ancillary service.
                  #
                  # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service#category
                  module Category
                    extend Increase::Internal::Type::Enum

                    # None
                    NONE = :none

                    # Bundled service
                    BUNDLED_SERVICE = :bundled_service

                    # Baggage fee
                    BAGGAGE_FEE = :baggage_fee

                    # Change fee
                    CHANGE_FEE = :change_fee

                    # Cargo
                    CARGO = :cargo

                    # Carbon offset
                    CARBON_OFFSET = :carbon_offset

                    # Frequent flyer
                    FREQUENT_FLYER = :frequent_flyer

                    # Gift card
                    GIFT_CARD = :gift_card

                    # Ground transport
                    GROUND_TRANSPORT = :ground_transport

                    # In-flight entertainment
                    IN_FLIGHT_ENTERTAINMENT = :in_flight_entertainment

                    # Lounge
                    LOUNGE = :lounge

                    # Medical
                    MEDICAL = :medical

                    # Meal beverage
                    MEAL_BEVERAGE = :meal_beverage

                    # Other
                    OTHER = :other

                    # Passenger assist fee
                    PASSENGER_ASSIST_FEE = :passenger_assist_fee

                    # Pets
                    PETS = :pets

                    # Seat fees
                    SEAT_FEES = :seat_fees

                    # Standby
                    STANDBY = :standby

                    # Service fee
                    SERVICE_FEE = :service_fee

                    # Store
                    STORE = :store

                    # Travel service
                    TRAVEL_SERVICE = :travel_service

                    # Unaccompanied travel
                    UNACCOMPANIED_TRAVEL = :unaccompanied_travel

                    # Upgrades
                    UPGRADES = :upgrades

                    # Wi-fi
                    WIFI = :wifi

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end
              end

              # Indicates the reason for a credit to the cardholder.
              #
              # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel#credit_reason_indicator
              module CreditReasonIndicator
                extend Increase::Internal::Type::Enum

                # No credit
                NO_CREDIT = :no_credit

                # Passenger transport ancillary purchase cancellation
                PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  :passenger_transport_ancillary_purchase_cancellation

                # Airline ticket and passenger transport ancillary purchase cancellation
                AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation

                # Airline ticket cancellation
                AIRLINE_TICKET_CANCELLATION = :airline_ticket_cancellation

                # Other
                OTHER = :other

                # Partial refund of airline ticket
                PARTIAL_REFUND_OF_AIRLINE_TICKET = :partial_refund_of_airline_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicates whether this ticket is non-refundable.
              #
              # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel#restricted_ticket_indicator
              module RestrictedTicketIndicator
                extend Increase::Internal::Type::Enum

                # No restrictions
                NO_RESTRICTIONS = :no_restrictions

                # Restricted non-refundable ticket
                RESTRICTED_NON_REFUNDABLE_TICKET = :restricted_non_refundable_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicates why a ticket was changed.
              #
              # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel#ticket_change_indicator
              module TicketChangeIndicator
                extend Increase::Internal::Type::Enum

                # None
                NONE = :none

                # Change to existing ticket
                CHANGE_TO_EXISTING_TICKET = :change_to_existing_ticket

                # New ticket
                NEW_TICKET = :new_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              class TripLeg < Increase::Internal::Type::BaseModel
                # @!attribute carrier_code
                #   Carrier code (e.g., United Airlines, Jet Blue, etc.).
                #
                #   @return [String, nil]
                required :carrier_code, String, nil?: true

                # @!attribute destination_city_airport_code
                #   Code for the destination city or airport.
                #
                #   @return [String, nil]
                required :destination_city_airport_code, String, nil?: true

                # @!attribute fare_basis_code
                #   Fare basis code.
                #
                #   @return [String, nil]
                required :fare_basis_code, String, nil?: true

                # @!attribute flight_number
                #   Flight number.
                #
                #   @return [String, nil]
                required :flight_number, String, nil?: true

                # @!attribute service_class
                #   Service class (e.g., first class, business class, etc.).
                #
                #   @return [String, nil]
                required :service_class, String, nil?: true

                # @!attribute stop_over_code
                #   Indicates whether a stopover is allowed on this ticket.
                #
                #   @return [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode, nil]
                required :stop_over_code,
                         enum: -> {
                           Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode
                         },
                         nil?: true

                # @!method initialize(carrier_code:, destination_city_airport_code:, fare_basis_code:, flight_number:, service_class:, stop_over_code:)
                #   @param carrier_code [String, nil] Carrier code (e.g., United Airlines, Jet Blue, etc.).
                #
                #   @param destination_city_airport_code [String, nil] Code for the destination city or airport.
                #
                #   @param fare_basis_code [String, nil] Fare basis code.
                #
                #   @param flight_number [String, nil] Flight number.
                #
                #   @param service_class [String, nil] Service class (e.g., first class, business class, etc.).
                #
                #   @param stop_over_code [Symbol, Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode, nil] Indicates whether a stopover is allowed on this ticket.

                # Indicates whether a stopover is allowed on this ticket.
                #
                # @see Increase::Models::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg#stop_over_code
                module StopOverCode
                  extend Increase::Internal::Type::Enum

                  # None
                  NONE = :none

                  # Stop over allowed
                  STOP_OVER_ALLOWED = :stop_over_allowed

                  # Stop over not allowed
                  STOP_OVER_NOT_ALLOWED = :stop_over_not_allowed

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_refund`.
          #
          # @see Increase::Models::CardPayment::Element::CardRefund#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_REFUND = :card_refund

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::CardPayment::Element#card_reversal
        class CardReversal < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Reversal identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute card_authorization_id
          #   The identifier for the Card Authorization this reverses.
          #
          #   @return [String]
          required :card_authorization_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          #   currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardReversal::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardReversal::Currency }

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
          #   @return [String, nil]
          required :merchant_country, String, nil?: true

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

          # @!attribute network
          #   The card network used to process this card authorization.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardReversal::Network]
          required :network, enum: -> { Increase::CardPayment::Element::CardReversal::Network }

          # @!attribute network_identifiers
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardReversal::NetworkIdentifiers]
          required :network_identifiers, -> { Increase::CardPayment::Element::CardReversal::NetworkIdentifiers }

          # @!attribute pending_transaction_id
          #   The identifier of the Pending Transaction associated with this Card Reversal.
          #
          #   @return [String, nil]
          required :pending_transaction_id, String, nil?: true

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          #   presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute reversal_amount
          #   The amount of this reversal in the minor unit of the transaction's currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :reversal_amount, Integer

          # @!attribute reversal_presentment_amount
          #   The amount of this reversal in the minor unit of the transaction's presentment
          #   currency. For dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :reversal_presentment_amount, Integer

          # @!attribute reversal_reason
          #   Why this reversal was initiated.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardReversal::ReversalReason, nil]
          required :reversal_reason,
                   enum: -> { Increase::CardPayment::Element::CardReversal::ReversalReason },
                   nil?: true

          # @!attribute terminal_id
          #   The terminal identifier (commonly abbreviated as TID) of the terminal the card
          #   is transacting with.
          #
          #   @return [String, nil]
          required :terminal_id, String, nil?: true

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_reversal`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardReversal::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardReversal::Type }

          # @!attribute updated_authorization_amount
          #   The amount left pending on the Card Authorization in the minor unit of the
          #   transaction's currency. For dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :updated_authorization_amount, Integer

          # @!attribute updated_authorization_presentment_amount
          #   The amount left pending on the Card Authorization in the minor unit of the
          #   transaction's presentment currency. For dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :updated_authorization_presentment_amount, Integer

          # @!method initialize(id:, card_authorization_id:, currency:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_descriptor:, merchant_postal_code:, merchant_state:, network:, network_identifiers:, pending_transaction_id:, presentment_currency:, reversal_amount:, reversal_presentment_amount:, reversal_reason:, terminal_id:, type:, updated_authorization_amount:, updated_authorization_presentment_amount:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardReversal} for more details.
          #
          #   A Card Reversal object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_reversal`. Card Reversals cancel parts of
          #   or the entirety of an existing Card Authorization.
          #
          #   @param id [String] The Card Reversal identifier.
          #
          #   @param card_authorization_id [String] The identifier for the Card Authorization this reverses.
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardReversal::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's c
          #
          #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
          #
          #   @param merchant_category_code [String] The Merchant Category Code (commonly abbreviated as MCC) of the merchant the car
          #
          #   @param merchant_city [String, nil] The city the merchant resides in.
          #
          #   @param merchant_country [String, nil] The country the merchant resides in.
          #
          #   @param merchant_descriptor [String] The merchant descriptor of the merchant the card is transacting with.
          #
          #   @param merchant_postal_code [String, nil] The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          #
          #   @param merchant_state [String, nil] The state the merchant resides in.
          #
          #   @param network [Symbol, Increase::Models::CardPayment::Element::CardReversal::Network] The card network used to process this card authorization.
          #
          #   @param network_identifiers [Increase::Models::CardPayment::Element::CardReversal::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
          #
          #   @param pending_transaction_id [String, nil] The identifier of the Pending Transaction associated with this Card Reversal.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's p
          #
          #   @param reversal_amount [Integer] The amount of this reversal in the minor unit of the transaction's currency. For
          #
          #   @param reversal_presentment_amount [Integer] The amount of this reversal in the minor unit of the transaction's presentment c
          #
          #   @param reversal_reason [Symbol, Increase::Models::CardPayment::Element::CardReversal::ReversalReason, nil] Why this reversal was initiated.
          #
          #   @param terminal_id [String, nil] The terminal identifier (commonly abbreviated as TID) of the terminal the card i
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardReversal::Type] A constant representing the object's type. For this resource it will always be `
          #
          #   @param updated_authorization_amount [Integer] The amount left pending on the Card Authorization in the minor unit of the trans
          #
          #   @param updated_authorization_presentment_amount [Integer] The amount left pending on the Card Authorization in the minor unit of the trans

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          # currency.
          #
          # @see Increase::Models::CardPayment::Element::CardReversal#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The card network used to process this card authorization.
          #
          # @see Increase::Models::CardPayment::Element::CardReversal#network
          module Network
            extend Increase::Internal::Type::Enum

            # Visa
            VISA = :visa

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardReversal#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
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

            # @!method initialize(retrieval_reference_number:, trace_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardReversal::NetworkIdentifiers} for
            #   more details.
            #
            #   Network-specific identifiers for a specific request or transaction.
            #
            #   @param retrieval_reference_number [String, nil] A life-cycle identifier used across e.g., an authorization and a reversal. Expec
            #
            #   @param trace_number [String, nil] A counter used to verify an individual authorization. Expected to be unique per
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # Why this reversal was initiated.
          #
          # @see Increase::Models::CardPayment::Element::CardReversal#reversal_reason
          module ReversalReason
            extend Increase::Internal::Type::Enum

            # The Card Reversal was initiated at the customer's request.
            REVERSED_BY_CUSTOMER = :reversed_by_customer

            # The Card Reversal was initiated by the network or acquirer.
            REVERSED_BY_NETWORK_OR_ACQUIRER = :reversed_by_network_or_acquirer

            # The Card Reversal was initiated by the point of sale device.
            REVERSED_BY_POINT_OF_SALE = :reversed_by_point_of_sale

            # The Card Reversal was a partial reversal, for any reason.
            PARTIAL_REVERSAL = :partial_reversal

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_reversal`.
          #
          # @see Increase::Models::CardPayment::Element::CardReversal#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_REVERSAL = :card_reversal

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::CardPayment::Element#card_settlement
        class CardSettlement < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Settlement identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute amount
          #   The amount in the minor unit of the transaction's settlement currency. For
          #   dollars, for example, this is cents.
          #
          #   @return [Integer]
          required :amount, Integer

          # @!attribute card_authorization
          #   The Card Authorization that was created prior to this Card Settlement, if one
          #   exists.
          #
          #   @return [String, nil]
          required :card_authorization, String, nil?: true

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute cashback
          #   Cashback earned on this transaction, if eligible. Cashback is paid out in
          #   aggregate, monthly.
          #
          #   @return [Increase::Models::CardPayment::Element::CardSettlement::Cashback, nil]
          required :cashback, -> { Increase::CardPayment::Element::CardSettlement::Cashback }, nil?: true

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's settlement currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardSettlement::Currency }

          # @!attribute interchange
          #   Interchange assessed as a part of this transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardSettlement::Interchange, nil]
          required :interchange,
                   -> {
                     Increase::CardPayment::Element::CardSettlement::Interchange
                   },
                   nil?: true

          # @!attribute merchant_acceptor_id
          #   The merchant identifier (commonly abbreviated as MID) of the merchant the card
          #   is transacting with.
          #
          #   @return [String]
          required :merchant_acceptor_id, String

          # @!attribute merchant_category_code
          #   The 4-digit MCC describing the merchant's business.
          #
          #   @return [String]
          required :merchant_category_code, String

          # @!attribute merchant_city
          #   The city the merchant resides in.
          #
          #   @return [String]
          required :merchant_city, String

          # @!attribute merchant_country
          #   The country the merchant resides in.
          #
          #   @return [String]
          required :merchant_country, String

          # @!attribute merchant_name
          #   The name of the merchant.
          #
          #   @return [String]
          required :merchant_name, String

          # @!attribute merchant_postal_code
          #   The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          #
          #   @return [String, nil]
          required :merchant_postal_code, String, nil?: true

          # @!attribute merchant_state
          #   The state the merchant resides in.
          #
          #   @return [String, nil]
          required :merchant_state, String, nil?: true

          # @!attribute network
          #   The card network on which this transaction was processed.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Network]
          required :network, enum: -> { Increase::CardPayment::Element::CardSettlement::Network }

          # @!attribute network_identifiers
          #   Network-specific identifiers for this refund.
          #
          #   @return [Increase::Models::CardPayment::Element::CardSettlement::NetworkIdentifiers]
          required :network_identifiers, -> { Increase::CardPayment::Element::CardSettlement::NetworkIdentifiers }

          # @!attribute pending_transaction_id
          #   The identifier of the Pending Transaction associated with this Transaction.
          #
          #   @return [String, nil]
          required :pending_transaction_id, String, nil?: true

          # @!attribute presentment_amount
          #   The amount in the minor unit of the transaction's presentment currency.
          #
          #   @return [Integer]
          required :presentment_amount, Integer

          # @!attribute presentment_currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's presentment currency.
          #
          #   @return [String]
          required :presentment_currency, String

          # @!attribute purchase_details
          #   Additional details about the card purchase, such as tax and industry-specific
          #   fields.
          #
          #   @return [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails, nil]
          required :purchase_details,
                   -> { Increase::CardPayment::Element::CardSettlement::PurchaseDetails },
                   nil?: true

          # @!attribute transaction_id
          #   The identifier of the Transaction associated with this Transaction.
          #
          #   @return [String]
          required :transaction_id, String

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `card_settlement`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardSettlement::Type }

          # @!method initialize(id:, amount:, card_authorization:, card_payment_id:, cashback:, currency:, interchange:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_name:, merchant_postal_code:, merchant_state:, network:, network_identifiers:, pending_transaction_id:, presentment_amount:, presentment_currency:, purchase_details:, transaction_id:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardSettlement} for more details.
          #
          #   A Card Settlement object. This field will be present in the JSON response if and
          #   only if `category` is equal to `card_settlement`. Card Settlements are card
          #   transactions that have cleared and settled. While a settlement is usually
          #   preceded by an authorization, an acquirer can also directly clear a transaction
          #   without first authorizing it.
          #
          #   @param id [String] The Card Settlement identifier.
          #
          #   @param amount [Integer] The amount in the minor unit of the transaction's settlement currency. For dolla
          #
          #   @param card_authorization [String, nil] The Card Authorization that was created prior to this Card Settlement, if one ex
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param cashback [Increase::Models::CardPayment::Element::CardSettlement::Cashback, nil] Cashback earned on this transaction, if eligible. Cashback is paid out in aggreg
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param interchange [Increase::Models::CardPayment::Element::CardSettlement::Interchange, nil] Interchange assessed as a part of this transaction.
          #
          #   @param merchant_acceptor_id [String] The merchant identifier (commonly abbreviated as MID) of the merchant the card i
          #
          #   @param merchant_category_code [String] The 4-digit MCC describing the merchant's business.
          #
          #   @param merchant_city [String] The city the merchant resides in.
          #
          #   @param merchant_country [String] The country the merchant resides in.
          #
          #   @param merchant_name [String] The name of the merchant.
          #
          #   @param merchant_postal_code [String, nil] The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          #
          #   @param merchant_state [String, nil] The state the merchant resides in.
          #
          #   @param network [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Network] The card network on which this transaction was processed.
          #
          #   @param network_identifiers [Increase::Models::CardPayment::Element::CardSettlement::NetworkIdentifiers] Network-specific identifiers for this refund.
          #
          #   @param pending_transaction_id [String, nil] The identifier of the Pending Transaction associated with this Transaction.
          #
          #   @param presentment_amount [Integer] The amount in the minor unit of the transaction's presentment currency.
          #
          #   @param presentment_currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param purchase_details [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails, nil] Additional details about the card purchase, such as tax and industry-specific fi
          #
          #   @param transaction_id [String] The identifier of the Transaction associated with this Transaction.
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Type] A constant representing the object's type. For this resource it will always be `

          # @see Increase::Models::CardPayment::Element::CardSettlement#cashback
          class Cashback < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The cashback amount given as a string containing a decimal number. The amount is
            #   a positive number if it will be credited to you (e.g., settlements) and a
            #   negative number if it will be debited (e.g., refunds).
            #
            #   @return [String]
            required :amount, String

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Cashback::Currency]
            required :currency, enum: -> { Increase::CardPayment::Element::CardSettlement::Cashback::Currency }

            # @!method initialize(amount:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardSettlement::Cashback} for more
            #   details.
            #
            #   Cashback earned on this transaction, if eligible. Cashback is paid out in
            #   aggregate, monthly.
            #
            #   @param amount [String] The cashback amount given as a string containing a decimal number. The amount is
            #
            #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Cashback::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            #
            # @see Increase::Models::CardPayment::Element::CardSettlement::Cashback#currency
            module Currency
              extend Increase::Internal::Type::Enum

              # Canadian Dollar (CAD)
              CAD = :CAD

              # Swiss Franc (CHF)
              CHF = :CHF

              # Euro (EUR)
              EUR = :EUR

              # British Pound (GBP)
              GBP = :GBP

              # Japanese Yen (JPY)
              JPY = :JPY

              # US Dollar (USD)
              USD = :USD

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          #
          # @see Increase::Models::CardPayment::Element::CardSettlement#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardSettlement#interchange
          class Interchange < Increase::Internal::Type::BaseModel
            # @!attribute amount
            #   The interchange amount given as a string containing a decimal number in major
            #   units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
            #   credited to Increase (e.g., settlements) and a negative number if it is debited
            #   (e.g., refunds).
            #
            #   @return [String]
            required :amount, String

            # @!attribute code
            #   The card network specific interchange code.
            #
            #   @return [String, nil]
            required :code, String, nil?: true

            # @!attribute currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            #   reimbursement.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Interchange::Currency]
            required :currency, enum: -> { Increase::CardPayment::Element::CardSettlement::Interchange::Currency }

            # @!method initialize(amount:, code:, currency:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardSettlement::Interchange} for more
            #   details.
            #
            #   Interchange assessed as a part of this transaction.
            #
            #   @param amount [String] The interchange amount given as a string containing a decimal number in major un
            #
            #   @param code [String, nil] The card network specific interchange code.
            #
            #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardSettlement::Interchange::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            #
            # @see Increase::Models::CardPayment::Element::CardSettlement::Interchange#currency
            module Currency
              extend Increase::Internal::Type::Enum

              # Canadian Dollar (CAD)
              CAD = :CAD

              # Swiss Franc (CHF)
              CHF = :CHF

              # Euro (EUR)
              EUR = :EUR

              # British Pound (GBP)
              GBP = :GBP

              # Japanese Yen (JPY)
              JPY = :JPY

              # US Dollar (USD)
              USD = :USD

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # The card network on which this transaction was processed.
          #
          # @see Increase::Models::CardPayment::Element::CardSettlement#network
          module Network
            extend Increase::Internal::Type::Enum

            # Visa
            VISA = :visa

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardSettlement#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            # @!attribute acquirer_business_id
            #   A network assigned business ID that identifies the acquirer that processed this
            #   transaction.
            #
            #   @return [String]
            required :acquirer_business_id, String

            # @!attribute acquirer_reference_number
            #   A globally unique identifier for this settlement.
            #
            #   @return [String]
            required :acquirer_reference_number, String

            # @!attribute transaction_id
            #   A globally unique transaction identifier provided by the card network, used
            #   across multiple life-cycle requests.
            #
            #   @return [String, nil]
            required :transaction_id, String, nil?: true

            # @!method initialize(acquirer_business_id:, acquirer_reference_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardSettlement::NetworkIdentifiers} for
            #   more details.
            #
            #   Network-specific identifiers for this refund.
            #
            #   @param acquirer_business_id [String] A network assigned business ID that identifies the acquirer that processed this
            #
            #   @param acquirer_reference_number [String] A globally unique identifier for this settlement.
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # @see Increase::Models::CardPayment::Element::CardSettlement#purchase_details
          class PurchaseDetails < Increase::Internal::Type::BaseModel
            # @!attribute car_rental
            #   Fields specific to car rentals.
            #
            #   @return [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental, nil]
            required :car_rental,
                     -> { Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental },
                     nil?: true

            # @!attribute customer_reference_identifier
            #   An identifier from the merchant for the customer or consumer.
            #
            #   @return [String, nil]
            required :customer_reference_identifier, String, nil?: true

            # @!attribute local_tax_amount
            #   The state or provincial tax amount in minor units.
            #
            #   @return [Integer, nil]
            required :local_tax_amount, Integer, nil?: true

            # @!attribute local_tax_currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            #   assessed.
            #
            #   @return [String, nil]
            required :local_tax_currency, String, nil?: true

            # @!attribute lodging
            #   Fields specific to lodging.
            #
            #   @return [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging, nil]
            required :lodging,
                     -> { Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging },
                     nil?: true

            # @!attribute national_tax_amount
            #   The national tax amount in minor units.
            #
            #   @return [Integer, nil]
            required :national_tax_amount, Integer, nil?: true

            # @!attribute national_tax_currency
            #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            #   assessed.
            #
            #   @return [String, nil]
            required :national_tax_currency, String, nil?: true

            # @!attribute purchase_identifier
            #   An identifier from the merchant for the purchase to the issuer and cardholder.
            #
            #   @return [String, nil]
            required :purchase_identifier, String, nil?: true

            # @!attribute purchase_identifier_format
            #   The format of the purchase identifier.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat, nil]
            required :purchase_identifier_format,
                     enum: -> {
                       Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat
                     },
                     nil?: true

            # @!attribute travel
            #   Fields specific to travel.
            #
            #   @return [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel, nil]
            required :travel,
                     -> { Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel },
                     nil?: true

            # @!method initialize(car_rental:, customer_reference_identifier:, local_tax_amount:, local_tax_currency:, lodging:, national_tax_amount:, national_tax_currency:, purchase_identifier:, purchase_identifier_format:, travel:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails} for
            #   more details.
            #
            #   Additional details about the card purchase, such as tax and industry-specific
            #   fields.
            #
            #   @param car_rental [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental, nil] Fields specific to car rentals.
            #
            #   @param customer_reference_identifier [String, nil] An identifier from the merchant for the customer or consumer.
            #
            #   @param local_tax_amount [Integer, nil] The state or provincial tax amount in minor units.
            #
            #   @param local_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax as
            #
            #   @param lodging [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging, nil] Fields specific to lodging.
            #
            #   @param national_tax_amount [Integer, nil] The national tax amount in minor units.
            #
            #   @param national_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax as
            #
            #   @param purchase_identifier [String, nil] An identifier from the merchant for the purchase to the issuer and cardholder.
            #
            #   @param purchase_identifier_format [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat, nil] The format of the purchase identifier.
            #
            #   @param travel [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel, nil] Fields specific to travel.

            # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails#car_rental
            class CarRental < Increase::Internal::Type::BaseModel
              # @!attribute car_class_code
              #   Code indicating the vehicle's class.
              #
              #   @return [String, nil]
              required :car_class_code, String, nil?: true

              # @!attribute checkout_date
              #   Date the customer picked up the car or, in the case of a no-show or pre-pay
              #   transaction, the scheduled pick up date.
              #
              #   @return [Date, nil]
              required :checkout_date, Date, nil?: true

              # @!attribute daily_rental_rate_amount
              #   Daily rate being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :daily_rental_rate_amount, Integer, nil?: true

              # @!attribute daily_rental_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              #   rate.
              #
              #   @return [String, nil]
              required :daily_rental_rate_currency, String, nil?: true

              # @!attribute days_rented
              #   Number of days the vehicle was rented.
              #
              #   @return [Integer, nil]
              required :days_rented, Integer, nil?: true

              # @!attribute extra_charges
              #   Additional charges (gas, late fee, etc.) being billed.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges, nil]
              required :extra_charges,
                       enum: -> {
                         Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges
                       },
                       nil?: true

              # @!attribute fuel_charges_amount
              #   Fuel charges for the vehicle.
              #
              #   @return [Integer, nil]
              required :fuel_charges_amount, Integer, nil?: true

              # @!attribute fuel_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              #   assessed.
              #
              #   @return [String, nil]
              required :fuel_charges_currency, String, nil?: true

              # @!attribute insurance_charges_amount
              #   Any insurance being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :insurance_charges_amount, Integer, nil?: true

              # @!attribute insurance_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
              #   charges assessed.
              #
              #   @return [String, nil]
              required :insurance_charges_currency, String, nil?: true

              # @!attribute no_show_indicator
              #   An indicator that the cardholder is being billed for a reserved vehicle that was
              #   not actually rented (that is, a "no-show" charge).
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator, nil]
              required :no_show_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator
                       },
                       nil?: true

              # @!attribute one_way_drop_off_charges_amount
              #   Charges for returning the vehicle at a different location than where it was
              #   picked up.
              #
              #   @return [Integer, nil]
              required :one_way_drop_off_charges_amount, Integer, nil?: true

              # @!attribute one_way_drop_off_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
              #   drop-off charges assessed.
              #
              #   @return [String, nil]
              required :one_way_drop_off_charges_currency, String, nil?: true

              # @!attribute renter_name
              #   Name of the person renting the vehicle.
              #
              #   @return [String, nil]
              required :renter_name, String, nil?: true

              # @!attribute weekly_rental_rate_amount
              #   Weekly rate being charged for the vehicle.
              #
              #   @return [Integer, nil]
              required :weekly_rental_rate_amount, Integer, nil?: true

              # @!attribute weekly_rental_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
              #   rental rate.
              #
              #   @return [String, nil]
              required :weekly_rental_rate_currency, String, nil?: true

              # @!method initialize(car_class_code:, checkout_date:, daily_rental_rate_amount:, daily_rental_rate_currency:, days_rented:, extra_charges:, fuel_charges_amount:, fuel_charges_currency:, insurance_charges_amount:, insurance_charges_currency:, no_show_indicator:, one_way_drop_off_charges_amount:, one_way_drop_off_charges_currency:, renter_name:, weekly_rental_rate_amount:, weekly_rental_rate_currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental}
              #   for more details.
              #
              #   Fields specific to car rentals.
              #
              #   @param car_class_code [String, nil] Code indicating the vehicle's class.
              #
              #   @param checkout_date [Date, nil] Date the customer picked up the car or, in the case of a no-show or pre-pay tran
              #
              #   @param daily_rental_rate_amount [Integer, nil] Daily rate being charged for the vehicle.
              #
              #   @param daily_rental_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              #
              #   @param days_rented [Integer, nil] Number of days the vehicle was rented.
              #
              #   @param extra_charges [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges, nil] Additional charges (gas, late fee, etc.) being billed.
              #
              #   @param fuel_charges_amount [Integer, nil] Fuel charges for the vehicle.
              #
              #   @param fuel_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              #
              #   @param insurance_charges_amount [Integer, nil] Any insurance being charged for the vehicle.
              #
              #   @param insurance_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance ch
              #
              #   @param no_show_indicator [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator, nil] An indicator that the cardholder is being billed for a reserved vehicle that was
              #
              #   @param one_way_drop_off_charges_amount [Integer, nil] Charges for returning the vehicle at a different location than where it was pick
              #
              #   @param one_way_drop_off_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way drop
              #
              #   @param renter_name [String, nil] Name of the person renting the vehicle.
              #
              #   @param weekly_rental_rate_amount [Integer, nil] Weekly rate being charged for the vehicle.
              #
              #   @param weekly_rental_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly renta

              # Additional charges (gas, late fee, etc.) being billed.
              #
              # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental#extra_charges
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                # No extra charge
                NO_EXTRA_CHARGE = :no_extra_charge

                # Gas
                GAS = :gas

                # Extra mileage
                EXTRA_MILEAGE = :extra_mileage

                # Late return
                LATE_RETURN = :late_return

                # One way service fee
                ONE_WAY_SERVICE_FEE = :one_way_service_fee

                # Parking violation
                PARKING_VIOLATION = :parking_violation

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              #
              # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental#no_show_indicator
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                # Not applicable
                NOT_APPLICABLE = :not_applicable

                # No show for specialized vehicle
                NO_SHOW_FOR_SPECIALIZED_VEHICLE = :no_show_for_specialized_vehicle

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails#lodging
            class Lodging < Increase::Internal::Type::BaseModel
              # @!attribute check_in_date
              #   Date the customer checked in.
              #
              #   @return [Date, nil]
              required :check_in_date, Date, nil?: true

              # @!attribute daily_room_rate_amount
              #   Daily rate being charged for the room.
              #
              #   @return [Integer, nil]
              required :daily_room_rate_amount, Integer, nil?: true

              # @!attribute daily_room_rate_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
              #   rate.
              #
              #   @return [String, nil]
              required :daily_room_rate_currency, String, nil?: true

              # @!attribute extra_charges
              #   Additional charges (phone, late check-out, etc.) being billed.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges, nil]
              required :extra_charges,
                       enum: -> {
                         Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges
                       },
                       nil?: true

              # @!attribute folio_cash_advances_amount
              #   Folio cash advances for the room.
              #
              #   @return [Integer, nil]
              required :folio_cash_advances_amount, Integer, nil?: true

              # @!attribute folio_cash_advances_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
              #   advances.
              #
              #   @return [String, nil]
              required :folio_cash_advances_currency, String, nil?: true

              # @!attribute food_beverage_charges_amount
              #   Food and beverage charges for the room.
              #
              #   @return [Integer, nil]
              required :food_beverage_charges_amount, Integer, nil?: true

              # @!attribute food_beverage_charges_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
              #   beverage charges.
              #
              #   @return [String, nil]
              required :food_beverage_charges_currency, String, nil?: true

              # @!attribute no_show_indicator
              #   Indicator that the cardholder is being billed for a reserved room that was not
              #   actually used.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator, nil]
              required :no_show_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator
                       },
                       nil?: true

              # @!attribute prepaid_expenses_amount
              #   Prepaid expenses being charged for the room.
              #
              #   @return [Integer, nil]
              required :prepaid_expenses_amount, Integer, nil?: true

              # @!attribute prepaid_expenses_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
              #   expenses.
              #
              #   @return [String, nil]
              required :prepaid_expenses_currency, String, nil?: true

              # @!attribute room_nights
              #   Number of nights the room was rented.
              #
              #   @return [Integer, nil]
              required :room_nights, Integer, nil?: true

              # @!attribute total_room_tax_amount
              #   Total room tax being charged.
              #
              #   @return [Integer, nil]
              required :total_room_tax_amount, Integer, nil?: true

              # @!attribute total_room_tax_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
              #   tax.
              #
              #   @return [String, nil]
              required :total_room_tax_currency, String, nil?: true

              # @!attribute total_tax_amount
              #   Total tax being charged for the room.
              #
              #   @return [Integer, nil]
              required :total_tax_amount, Integer, nil?: true

              # @!attribute total_tax_currency
              #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
              #   assessed.
              #
              #   @return [String, nil]
              required :total_tax_currency, String, nil?: true

              # @!method initialize(check_in_date:, daily_room_rate_amount:, daily_room_rate_currency:, extra_charges:, folio_cash_advances_amount:, folio_cash_advances_currency:, food_beverage_charges_amount:, food_beverage_charges_currency:, no_show_indicator:, prepaid_expenses_amount:, prepaid_expenses_currency:, room_nights:, total_room_tax_amount:, total_room_tax_currency:, total_tax_amount:, total_tax_currency:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging}
              #   for more details.
              #
              #   Fields specific to lodging.
              #
              #   @param check_in_date [Date, nil] Date the customer checked in.
              #
              #   @param daily_room_rate_amount [Integer, nil] Daily rate being charged for the room.
              #
              #   @param daily_room_rate_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room r
              #
              #   @param extra_charges [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges, nil] Additional charges (phone, late check-out, etc.) being billed.
              #
              #   @param folio_cash_advances_amount [Integer, nil] Folio cash advances for the room.
              #
              #   @param folio_cash_advances_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash a
              #
              #   @param food_beverage_charges_amount [Integer, nil] Food and beverage charges for the room.
              #
              #   @param food_beverage_charges_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and bev
              #
              #   @param no_show_indicator [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator, nil] Indicator that the cardholder is being billed for a reserved room that was not a
              #
              #   @param prepaid_expenses_amount [Integer, nil] Prepaid expenses being charged for the room.
              #
              #   @param prepaid_expenses_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid expe
              #
              #   @param room_nights [Integer, nil] Number of nights the room was rented.
              #
              #   @param total_room_tax_amount [Integer, nil] Total room tax being charged.
              #
              #   @param total_room_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room t
              #
              #   @param total_tax_amount [Integer, nil] Total tax being charged for the room.
              #
              #   @param total_tax_currency [String, nil] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax as

              # Additional charges (phone, late check-out, etc.) being billed.
              #
              # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging#extra_charges
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                # No extra charge
                NO_EXTRA_CHARGE = :no_extra_charge

                # Restaurant
                RESTAURANT = :restaurant

                # Gift shop
                GIFT_SHOP = :gift_shop

                # Mini bar
                MINI_BAR = :mini_bar

                # Telephone
                TELEPHONE = :telephone

                # Other
                OTHER = :other

                # Laundry
                LAUNDRY = :laundry

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              #
              # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging#no_show_indicator
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                # Not applicable
                NOT_APPLICABLE = :not_applicable

                # No show
                NO_SHOW = :no_show

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # The format of the purchase identifier.
            #
            # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails#purchase_identifier_format
            module PurchaseIdentifierFormat
              extend Increase::Internal::Type::Enum

              # Free text
              FREE_TEXT = :free_text

              # Order number
              ORDER_NUMBER = :order_number

              # Rental agreement number
              RENTAL_AGREEMENT_NUMBER = :rental_agreement_number

              # Hotel folio number
              HOTEL_FOLIO_NUMBER = :hotel_folio_number

              # Invoice number
              INVOICE_NUMBER = :invoice_number

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails#travel
            class Travel < Increase::Internal::Type::BaseModel
              # @!attribute ancillary
              #   Ancillary purchases in addition to the airfare.
              #
              #   @return [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary, nil]
              required :ancillary,
                       -> {
                         Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary
                       },
                       nil?: true

              # @!attribute computerized_reservation_system
              #   Indicates the computerized reservation system used to book the ticket.
              #
              #   @return [String, nil]
              required :computerized_reservation_system, String, nil?: true

              # @!attribute credit_reason_indicator
              #   Indicates the reason for a credit to the cardholder.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator, nil]
              required :credit_reason_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator
                       },
                       nil?: true

              # @!attribute departure_date
              #   Date of departure.
              #
              #   @return [Date, nil]
              required :departure_date, Date, nil?: true

              # @!attribute origination_city_airport_code
              #   Code for the originating city or airport.
              #
              #   @return [String, nil]
              required :origination_city_airport_code, String, nil?: true

              # @!attribute passenger_name
              #   Name of the passenger.
              #
              #   @return [String, nil]
              required :passenger_name, String, nil?: true

              # @!attribute restricted_ticket_indicator
              #   Indicates whether this ticket is non-refundable.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator, nil]
              required :restricted_ticket_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator
                       },
                       nil?: true

              # @!attribute ticket_change_indicator
              #   Indicates why a ticket was changed.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator, nil]
              required :ticket_change_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator
                       },
                       nil?: true

              # @!attribute ticket_number
              #   Ticket number.
              #
              #   @return [String, nil]
              required :ticket_number, String, nil?: true

              # @!attribute travel_agency_code
              #   Code for the travel agency if the ticket was issued by a travel agency.
              #
              #   @return [String, nil]
              required :travel_agency_code, String, nil?: true

              # @!attribute travel_agency_name
              #   Name of the travel agency if the ticket was issued by a travel agency.
              #
              #   @return [String, nil]
              required :travel_agency_name, String, nil?: true

              # @!attribute trip_legs
              #   Fields specific to each leg of the journey.
              #
              #   @return [Array<Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg>, nil]
              required :trip_legs,
                       -> {
                         Increase::Internal::Type::ArrayOf[Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg]
                       },
                       nil?: true

              # @!method initialize(ancillary:, computerized_reservation_system:, credit_reason_indicator:, departure_date:, origination_city_airport_code:, passenger_name:, restricted_ticket_indicator:, ticket_change_indicator:, ticket_number:, travel_agency_code:, travel_agency_name:, trip_legs:)
              #   Fields specific to travel.
              #
              #   @param ancillary [Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary, nil] Ancillary purchases in addition to the airfare.
              #
              #   @param computerized_reservation_system [String, nil] Indicates the computerized reservation system used to book the ticket.
              #
              #   @param credit_reason_indicator [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator, nil] Indicates the reason for a credit to the cardholder.
              #
              #   @param departure_date [Date, nil] Date of departure.
              #
              #   @param origination_city_airport_code [String, nil] Code for the originating city or airport.
              #
              #   @param passenger_name [String, nil] Name of the passenger.
              #
              #   @param restricted_ticket_indicator [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator, nil] Indicates whether this ticket is non-refundable.
              #
              #   @param ticket_change_indicator [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator, nil] Indicates why a ticket was changed.
              #
              #   @param ticket_number [String, nil] Ticket number.
              #
              #   @param travel_agency_code [String, nil] Code for the travel agency if the ticket was issued by a travel agency.
              #
              #   @param travel_agency_name [String, nil] Name of the travel agency if the ticket was issued by a travel agency.
              #
              #   @param trip_legs [Array<Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg>, nil] Fields specific to each leg of the journey.

              # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel#ancillary
              class Ancillary < Increase::Internal::Type::BaseModel
                # @!attribute connected_ticket_document_number
                #   If this purchase has a connection or relationship to another purchase, such as a
                #   baggage fee for a passenger transport ticket, this field should contain the
                #   ticket document number for the other purchase.
                #
                #   @return [String, nil]
                required :connected_ticket_document_number, String, nil?: true

                # @!attribute credit_reason_indicator
                #   Indicates the reason for a credit to the cardholder.
                #
                #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator, nil]
                required :credit_reason_indicator,
                         enum: -> {
                           Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator
                         },
                         nil?: true

                # @!attribute passenger_name_or_description
                #   Name of the passenger or description of the ancillary purchase.
                #
                #   @return [String, nil]
                required :passenger_name_or_description, String, nil?: true

                # @!attribute services
                #   Additional travel charges, such as baggage fees.
                #
                #   @return [Array<Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service>]
                required :services,
                         -> { Increase::Internal::Type::ArrayOf[Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service] }

                # @!attribute ticket_document_number
                #   Ticket document number.
                #
                #   @return [String, nil]
                required :ticket_document_number, String, nil?: true

                # @!method initialize(connected_ticket_document_number:, credit_reason_indicator:, passenger_name_or_description:, services:, ticket_document_number:)
                #   Some parameter documentations has been truncated, see
                #   {Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary}
                #   for more details.
                #
                #   Ancillary purchases in addition to the airfare.
                #
                #   @param connected_ticket_document_number [String, nil] If this purchase has a connection or relationship to another purchase, such as a
                #
                #   @param credit_reason_indicator [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator, nil] Indicates the reason for a credit to the cardholder.
                #
                #   @param passenger_name_or_description [String, nil] Name of the passenger or description of the ancillary purchase.
                #
                #   @param services [Array<Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service>] Additional travel charges, such as baggage fees.
                #
                #   @param ticket_document_number [String, nil] Ticket document number.

                # Indicates the reason for a credit to the cardholder.
                #
                # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary#credit_reason_indicator
                module CreditReasonIndicator
                  extend Increase::Internal::Type::Enum

                  # No credit
                  NO_CREDIT = :no_credit

                  # Passenger transport ancillary purchase cancellation
                  PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    :passenger_transport_ancillary_purchase_cancellation

                  # Airline ticket and passenger transport ancillary purchase cancellation
                  AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation

                  # Other
                  OTHER = :other

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                class Service < Increase::Internal::Type::BaseModel
                  # @!attribute category
                  #   Category of the ancillary service.
                  #
                  #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category, nil]
                  required :category,
                           enum: -> {
                             Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category
                           },
                           nil?: true

                  # @!attribute sub_category
                  #   Sub-category of the ancillary service, free-form.
                  #
                  #   @return [String, nil]
                  required :sub_category, String, nil?: true

                  # @!method initialize(category:, sub_category:)
                  #   @param category [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category, nil] Category of the ancillary service.
                  #
                  #   @param sub_category [String, nil] Sub-category of the ancillary service, free-form.

                  # Category of the ancillary service.
                  #
                  # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service#category
                  module Category
                    extend Increase::Internal::Type::Enum

                    # None
                    NONE = :none

                    # Bundled service
                    BUNDLED_SERVICE = :bundled_service

                    # Baggage fee
                    BAGGAGE_FEE = :baggage_fee

                    # Change fee
                    CHANGE_FEE = :change_fee

                    # Cargo
                    CARGO = :cargo

                    # Carbon offset
                    CARBON_OFFSET = :carbon_offset

                    # Frequent flyer
                    FREQUENT_FLYER = :frequent_flyer

                    # Gift card
                    GIFT_CARD = :gift_card

                    # Ground transport
                    GROUND_TRANSPORT = :ground_transport

                    # In-flight entertainment
                    IN_FLIGHT_ENTERTAINMENT = :in_flight_entertainment

                    # Lounge
                    LOUNGE = :lounge

                    # Medical
                    MEDICAL = :medical

                    # Meal beverage
                    MEAL_BEVERAGE = :meal_beverage

                    # Other
                    OTHER = :other

                    # Passenger assist fee
                    PASSENGER_ASSIST_FEE = :passenger_assist_fee

                    # Pets
                    PETS = :pets

                    # Seat fees
                    SEAT_FEES = :seat_fees

                    # Standby
                    STANDBY = :standby

                    # Service fee
                    SERVICE_FEE = :service_fee

                    # Store
                    STORE = :store

                    # Travel service
                    TRAVEL_SERVICE = :travel_service

                    # Unaccompanied travel
                    UNACCOMPANIED_TRAVEL = :unaccompanied_travel

                    # Upgrades
                    UPGRADES = :upgrades

                    # Wi-fi
                    WIFI = :wifi

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end
              end

              # Indicates the reason for a credit to the cardholder.
              #
              # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel#credit_reason_indicator
              module CreditReasonIndicator
                extend Increase::Internal::Type::Enum

                # No credit
                NO_CREDIT = :no_credit

                # Passenger transport ancillary purchase cancellation
                PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  :passenger_transport_ancillary_purchase_cancellation

                # Airline ticket and passenger transport ancillary purchase cancellation
                AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation

                # Airline ticket cancellation
                AIRLINE_TICKET_CANCELLATION = :airline_ticket_cancellation

                # Other
                OTHER = :other

                # Partial refund of airline ticket
                PARTIAL_REFUND_OF_AIRLINE_TICKET = :partial_refund_of_airline_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicates whether this ticket is non-refundable.
              #
              # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel#restricted_ticket_indicator
              module RestrictedTicketIndicator
                extend Increase::Internal::Type::Enum

                # No restrictions
                NO_RESTRICTIONS = :no_restrictions

                # Restricted non-refundable ticket
                RESTRICTED_NON_REFUNDABLE_TICKET = :restricted_non_refundable_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Indicates why a ticket was changed.
              #
              # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel#ticket_change_indicator
              module TicketChangeIndicator
                extend Increase::Internal::Type::Enum

                # None
                NONE = :none

                # Change to existing ticket
                CHANGE_TO_EXISTING_TICKET = :change_to_existing_ticket

                # New ticket
                NEW_TICKET = :new_ticket

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              class TripLeg < Increase::Internal::Type::BaseModel
                # @!attribute carrier_code
                #   Carrier code (e.g., United Airlines, Jet Blue, etc.).
                #
                #   @return [String, nil]
                required :carrier_code, String, nil?: true

                # @!attribute destination_city_airport_code
                #   Code for the destination city or airport.
                #
                #   @return [String, nil]
                required :destination_city_airport_code, String, nil?: true

                # @!attribute fare_basis_code
                #   Fare basis code.
                #
                #   @return [String, nil]
                required :fare_basis_code, String, nil?: true

                # @!attribute flight_number
                #   Flight number.
                #
                #   @return [String, nil]
                required :flight_number, String, nil?: true

                # @!attribute service_class
                #   Service class (e.g., first class, business class, etc.).
                #
                #   @return [String, nil]
                required :service_class, String, nil?: true

                # @!attribute stop_over_code
                #   Indicates whether a stopover is allowed on this ticket.
                #
                #   @return [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode, nil]
                required :stop_over_code,
                         enum: -> {
                           Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode
                         },
                         nil?: true

                # @!method initialize(carrier_code:, destination_city_airport_code:, fare_basis_code:, flight_number:, service_class:, stop_over_code:)
                #   @param carrier_code [String, nil] Carrier code (e.g., United Airlines, Jet Blue, etc.).
                #
                #   @param destination_city_airport_code [String, nil] Code for the destination city or airport.
                #
                #   @param fare_basis_code [String, nil] Fare basis code.
                #
                #   @param flight_number [String, nil] Flight number.
                #
                #   @param service_class [String, nil] Service class (e.g., first class, business class, etc.).
                #
                #   @param stop_over_code [Symbol, Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode, nil] Indicates whether a stopover is allowed on this ticket.

                # Indicates whether a stopover is allowed on this ticket.
                #
                # @see Increase::Models::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg#stop_over_code
                module StopOverCode
                  extend Increase::Internal::Type::Enum

                  # None
                  NONE = :none

                  # Stop over allowed
                  STOP_OVER_ALLOWED = :stop_over_allowed

                  # Stop over not allowed
                  STOP_OVER_NOT_ALLOWED = :stop_over_not_allowed

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_settlement`.
          #
          # @see Increase::Models::CardPayment::Element::CardSettlement#type
          module Type
            extend Increase::Internal::Type::Enum

            CARD_SETTLEMENT = :card_settlement

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Increase::Models::CardPayment::Element#card_validation
        class CardValidation < Increase::Internal::Type::BaseModel
          # @!attribute id
          #   The Card Validation identifier.
          #
          #   @return [String]
          required :id, String

          # @!attribute actioner
          #   Whether this authorization was approved by Increase, the card network through
          #   stand-in processing, or the user through a real-time decision.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::Actioner]
          required :actioner, enum: -> { Increase::CardPayment::Element::CardValidation::Actioner }

          # @!attribute additional_amounts
          #   Additional amounts associated with the card authorization, such as ATM
          #   surcharges fees. These are usually a subset of the `amount` field and are used
          #   to provide more detailed information about the transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts]
          required :additional_amounts, -> { Increase::CardPayment::Element::CardValidation::AdditionalAmounts }

          # @!attribute card_payment_id
          #   The ID of the Card Payment this transaction belongs to.
          #
          #   @return [String]
          required :card_payment_id, String

          # @!attribute currency
          #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          #   transaction's currency.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::Currency]
          required :currency, enum: -> { Increase::CardPayment::Element::CardValidation::Currency }

          # @!attribute digital_wallet_token_id
          #   If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          #   purchase), the identifier of the token that was used.
          #
          #   @return [String, nil]
          required :digital_wallet_token_id, String, nil?: true

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
          #   @return [Increase::Models::CardPayment::Element::CardValidation::NetworkDetails]
          required :network_details, -> { Increase::CardPayment::Element::CardValidation::NetworkDetails }

          # @!attribute network_identifiers
          #   Network-specific identifiers for a specific request or transaction.
          #
          #   @return [Increase::Models::CardPayment::Element::CardValidation::NetworkIdentifiers]
          required :network_identifiers, -> { Increase::CardPayment::Element::CardValidation::NetworkIdentifiers }

          # @!attribute network_risk_score
          #   The risk score generated by the card network. For Visa this is the Visa Advanced
          #   Authorization risk score, from 0 to 99, where 99 is the riskiest.
          #
          #   @return [Integer, nil]
          required :network_risk_score, Integer, nil?: true

          # @!attribute physical_card_id
          #   If the authorization was made in-person with a physical card, the Physical Card
          #   that was used.
          #
          #   @return [String, nil]
          required :physical_card_id, String, nil?: true

          # @!attribute real_time_decision_id
          #   The identifier of the Real-Time Decision sent to approve or decline this
          #   transaction.
          #
          #   @return [String, nil]
          required :real_time_decision_id, String, nil?: true

          # @!attribute terminal_id
          #   The terminal identifier (commonly abbreviated as TID) of the terminal the card
          #   is transacting with.
          #
          #   @return [String, nil]
          required :terminal_id, String, nil?: true

          # @!attribute type
          #   A constant representing the object's type. For this resource it will always be
          #   `inbound_card_validation`.
          #
          #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::Type]
          required :type, enum: -> { Increase::CardPayment::Element::CardValidation::Type }

          # @!attribute verification
          #   Fields related to verification of cardholder-provided values.
          #
          #   @return [Increase::Models::CardPayment::Element::CardValidation::Verification]
          required :verification, -> { Increase::CardPayment::Element::CardValidation::Verification }

          # @!method initialize(id:, actioner:, additional_amounts:, card_payment_id:, currency:, digital_wallet_token_id:, merchant_acceptor_id:, merchant_category_code:, merchant_city:, merchant_country:, merchant_descriptor:, merchant_postal_code:, merchant_state:, network_details:, network_identifiers:, network_risk_score:, physical_card_id:, real_time_decision_id:, terminal_id:, type:, verification:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardPayment::Element::CardValidation} for more details.
          #
          #   An Inbound Card Validation object. This field will be present in the JSON
          #   response if and only if `category` is equal to `card_validation`. Inbound Card
          #   Validations are requests from a merchant to verify that a card number and
          #   optionally its address and/or Card Verification Value are valid.
          #
          #   @param id [String] The Card Validation identifier.
          #
          #   @param actioner [Symbol, Increase::Models::CardPayment::Element::CardValidation::Actioner] Whether this authorization was approved by Increase, the card network through st
          #
          #   @param additional_amounts [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts] Additional amounts associated with the card authorization, such as ATM surcharge
          #
          #   @param card_payment_id [String] The ID of the Card Payment this transaction belongs to.
          #
          #   @param currency [Symbol, Increase::Models::CardPayment::Element::CardValidation::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transaction'
          #
          #   @param digital_wallet_token_id [String, nil] If the authorization was made via a Digital Wallet Token (such as an Apple Pay p
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
          #   @param network_details [Increase::Models::CardPayment::Element::CardValidation::NetworkDetails] Fields specific to the `network`.
          #
          #   @param network_identifiers [Increase::Models::CardPayment::Element::CardValidation::NetworkIdentifiers] Network-specific identifiers for a specific request or transaction.
          #
          #   @param network_risk_score [Integer, nil] The risk score generated by the card network. For Visa this is the Visa Advanced
          #
          #   @param physical_card_id [String, nil] If the authorization was made in-person with a physical card, the Physical Card
          #
          #   @param real_time_decision_id [String, nil] The identifier of the Real-Time Decision sent to approve or decline this transac
          #
          #   @param terminal_id [String, nil] The terminal identifier (commonly abbreviated as TID) of the terminal the card i
          #
          #   @param type [Symbol, Increase::Models::CardPayment::Element::CardValidation::Type] A constant representing the object's type. For this resource it will always be `
          #
          #   @param verification [Increase::Models::CardPayment::Element::CardValidation::Verification] Fields related to verification of cardholder-provided values.

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          #
          # @see Increase::Models::CardPayment::Element::CardValidation#actioner
          module Actioner
            extend Increase::Internal::Type::Enum

            # This object was actioned by the user through a real-time decision.
            USER = :user

            # This object was actioned by Increase without user intervention.
            INCREASE = :increase

            # This object was actioned by the network, through stand-in processing.
            NETWORK = :network

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardValidation#additional_amounts
          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            # @!attribute clinic
            #   The part of this transaction amount that was for clinic-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic, nil]
            required :clinic,
                     -> { Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic },
                     nil?: true

            # @!attribute dental
            #   The part of this transaction amount that was for dental-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Dental, nil]
            required :dental,
                     -> { Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Dental },
                     nil?: true

            # @!attribute prescription
            #   The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription, nil]
            required :prescription,
                     -> { Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription },
                     nil?: true

            # @!attribute surcharge
            #   The surcharge amount charged for this transaction by the merchant.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge, nil]
            required :surcharge,
                     -> { Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge },
                     nil?: true

            # @!attribute total_cumulative
            #   The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative, nil]
            required :total_cumulative,
                     -> {
                       Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative
                     },
                     nil?: true

            # @!attribute total_healthcare
            #   The total amount of healthcare-related additional amounts.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare, nil]
            required :total_healthcare,
                     -> {
                       Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare
                     },
                     nil?: true

            # @!attribute transit
            #   The part of this transaction amount that was for transit-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Transit, nil]
            required :transit,
                     -> { Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Transit },
                     nil?: true

            # @!attribute unknown
            #   An unknown additional amount.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown, nil]
            required :unknown,
                     -> { Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown },
                     nil?: true

            # @!attribute vision
            #   The part of this transaction amount that was for vision-related services.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Vision, nil]
            required :vision,
                     -> { Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Vision },
                     nil?: true

            # @!method initialize(clinic:, dental:, prescription:, surcharge:, total_cumulative:, total_healthcare:, transit:, unknown:, vision:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts} for
            #   more details.
            #
            #   Additional amounts associated with the card authorization, such as ATM
            #   surcharges fees. These are usually a subset of the `amount` field and are used
            #   to provide more detailed information about the transaction.
            #
            #   @param clinic [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic, nil] The part of this transaction amount that was for clinic-related services.
            #
            #   @param dental [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Dental, nil] The part of this transaction amount that was for dental-related services.
            #
            #   @param prescription [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription, nil] The part of this transaction amount that was for healthcare prescriptions.
            #
            #   @param surcharge [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge, nil] The surcharge amount charged for this transaction by the merchant.
            #
            #   @param total_cumulative [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative, nil] The total amount of a series of incremental authorizations, optionally provided.
            #
            #   @param total_healthcare [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare, nil] The total amount of healthcare-related additional amounts.
            #
            #   @param transit [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Transit, nil] The part of this transaction amount that was for transit-related services.
            #
            #   @param unknown [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown, nil] An unknown additional amount.
            #
            #   @param vision [Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Vision, nil] The part of this transaction amount that was for vision-related services.

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#clinic
            class Clinic < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic}
              #   for more details.
              #
              #   The part of this transaction amount that was for clinic-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#dental
            class Dental < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Dental}
              #   for more details.
              #
              #   The part of this transaction amount that was for dental-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#prescription
            class Prescription < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription}
              #   for more details.
              #
              #   The part of this transaction amount that was for healthcare prescriptions.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#surcharge
            class Surcharge < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge}
              #   for more details.
              #
              #   The surcharge amount charged for this transaction by the merchant.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#total_cumulative
            class TotalCumulative < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative}
              #   for more details.
              #
              #   The total amount of a series of incremental authorizations, optionally provided.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#total_healthcare
            class TotalHealthcare < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare}
              #   for more details.
              #
              #   The total amount of healthcare-related additional amounts.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#transit
            class Transit < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Transit}
              #   for more details.
              #
              #   The part of this transaction amount that was for transit-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#unknown
            class Unknown < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown}
              #   for more details.
              #
              #   An unknown additional amount.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts#vision
            class Vision < Increase::Internal::Type::BaseModel
              # @!attribute amount
              #   The amount in minor units of the `currency` field.
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
              #   {Increase::Models::CardPayment::Element::CardValidation::AdditionalAmounts::Vision}
              #   for more details.
              #
              #   The part of this transaction amount that was for vision-related services.
              #
              #   @param amount [Integer] The amount in minor units of the `currency` field.
              #
              #   @param currency [String] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional a
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          #
          # @see Increase::Models::CardPayment::Element::CardValidation#currency
          module Currency
            extend Increase::Internal::Type::Enum

            # Canadian Dollar (CAD)
            CAD = :CAD

            # Swiss Franc (CHF)
            CHF = :CHF

            # Euro (EUR)
            EUR = :EUR

            # British Pound (GBP)
            GBP = :GBP

            # Japanese Yen (JPY)
            JPY = :JPY

            # US Dollar (USD)
            USD = :USD

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardValidation#network_details
          class NetworkDetails < Increase::Internal::Type::BaseModel
            # @!attribute category
            #   The payment network used to process this card authorization.
            #
            #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Category]
            required :category, enum: -> { Increase::CardPayment::Element::CardValidation::NetworkDetails::Category }

            # @!attribute visa
            #   Fields specific to the `visa` network.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa, nil]
            required :visa,
                     -> {
                       Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa
                     },
                     nil?: true

            # @!method initialize(category:, visa:)
            #   Fields specific to the `network`.
            #
            #   @param category [Symbol, Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Category] The payment network used to process this card authorization.
            #
            #   @param visa [Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa, nil] Fields specific to the `visa` network.

            # The payment network used to process this card authorization.
            #
            # @see Increase::Models::CardPayment::Element::CardValidation::NetworkDetails#category
            module Category
              extend Increase::Internal::Type::Enum

              # Visa
              VISA = :visa

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardPayment::Element::CardValidation::NetworkDetails#visa
            class Visa < Increase::Internal::Type::BaseModel
              # @!attribute electronic_commerce_indicator
              #   For electronic commerce transactions, this identifies the level of security used
              #   in obtaining the customer's payment credential. For mail or telephone order
              #   transactions, identifies the type of mail or telephone order.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator, nil]
              required :electronic_commerce_indicator,
                       enum: -> {
                         Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator
                       },
                       nil?: true

              # @!attribute point_of_service_entry_mode
              #   The method used to enter the cardholder's primary account number and card
              #   expiration date.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode, nil]
              required :point_of_service_entry_mode,
                       enum: -> {
                         Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode
                       },
                       nil?: true

              # @!attribute stand_in_processing_reason
              #   Only present when `actioner: network`. Describes why a card authorization was
              #   approved or declined by Visa through stand-in processing.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason, nil]
              required :stand_in_processing_reason,
                       enum: -> {
                         Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason
                       },
                       nil?: true

              # @!method initialize(electronic_commerce_indicator:, point_of_service_entry_mode:, stand_in_processing_reason:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa}
              #   for more details.
              #
              #   Fields specific to the `visa` network.
              #
              #   @param electronic_commerce_indicator [Symbol, Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator, nil] For electronic commerce transactions, this identifies the level of security used
              #
              #   @param point_of_service_entry_mode [Symbol, Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode, nil] The method used to enter the cardholder's primary account number and card expira
              #
              #   @param stand_in_processing_reason [Symbol, Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason, nil] Only present when `actioner: network`. Describes why a card authorization was ap

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              #
              # @see Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa#electronic_commerce_indicator
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

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however , cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION = :non_authenticated_security_transaction

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION = :non_secure_transaction

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              #
              # @see Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa#point_of_service_entry_mode
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
              # @see Increase::Models::CardPayment::Element::CardValidation::NetworkDetails::Visa#stand_in_processing_reason
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

          # @see Increase::Models::CardPayment::Element::CardValidation#network_identifiers
          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
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

            # @!method initialize(retrieval_reference_number:, trace_number:, transaction_id:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardValidation::NetworkIdentifiers} for
            #   more details.
            #
            #   Network-specific identifiers for a specific request or transaction.
            #
            #   @param retrieval_reference_number [String, nil] A life-cycle identifier used across e.g., an authorization and a reversal. Expec
            #
            #   @param trace_number [String, nil] A counter used to verify an individual authorization. Expected to be unique per
            #
            #   @param transaction_id [String, nil] A globally unique transaction identifier provided by the card network, used acro
          end

          # A constant representing the object's type. For this resource it will always be
          # `inbound_card_validation`.
          #
          # @see Increase::Models::CardPayment::Element::CardValidation#type
          module Type
            extend Increase::Internal::Type::Enum

            INBOUND_CARD_VALIDATION = :inbound_card_validation

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardPayment::Element::CardValidation#verification
          class Verification < Increase::Internal::Type::BaseModel
            # @!attribute card_verification_code
            #   Fields related to verification of the Card Verification Code, a 3-digit code on
            #   the back of the card.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::Verification::CardVerificationCode]
            required :card_verification_code,
                     -> { Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode }

            # @!attribute cardholder_address
            #   Cardholder address provided in the authorization request and the address on file
            #   we verified it against.
            #
            #   @return [Increase::Models::CardPayment::Element::CardValidation::Verification::CardholderAddress]
            required :cardholder_address,
                     -> { Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress }

            # @!method initialize(card_verification_code:, cardholder_address:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardPayment::Element::CardValidation::Verification} for more
            #   details.
            #
            #   Fields related to verification of cardholder-provided values.
            #
            #   @param card_verification_code [Increase::Models::CardPayment::Element::CardValidation::Verification::CardVerificationCode] Fields related to verification of the Card Verification Code, a 3-digit code on
            #
            #   @param cardholder_address [Increase::Models::CardPayment::Element::CardValidation::Verification::CardholderAddress] Cardholder address provided in the authorization request and the address on file

            # @see Increase::Models::CardPayment::Element::CardValidation::Verification#card_verification_code
            class CardVerificationCode < Increase::Internal::Type::BaseModel
              # @!attribute result
              #   The result of verifying the Card Verification Code.
              #
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result]
              required :result,
                       enum: -> { Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result }

              # @!method initialize(result:)
              #   Fields related to verification of the Card Verification Code, a 3-digit code on
              #   the back of the card.
              #
              #   @param result [Symbol, Increase::Models::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result] The result of verifying the Card Verification Code.

              # The result of verifying the Card Verification Code.
              #
              # @see Increase::Models::CardPayment::Element::CardValidation::Verification::CardVerificationCode#result
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

            # @see Increase::Models::CardPayment::Element::CardValidation::Verification#cardholder_address
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
              #   @return [Symbol, Increase::Models::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result]
              required :result,
                       enum: -> { Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result }

              # @!method initialize(actual_line1:, actual_postal_code:, provided_line1:, provided_postal_code:, result:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardPayment::Element::CardValidation::Verification::CardholderAddress}
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
              #   @param result [Symbol, Increase::Models::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result] The address verification result returned to the card network.

              # The address verification result returned to the card network.
              #
              # @see Increase::Models::CardPayment::Element::CardValidation::Verification::CardholderAddress#result
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

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        #
        # @see Increase::Models::CardPayment::Element#category
        module Category
          extend Increase::Internal::Type::Enum

          # Card Authorization: details will be under the `card_authorization` object.
          CARD_AUTHORIZATION = :card_authorization

          # Card Authentication: details will be under the `card_authentication` object.
          CARD_AUTHENTICATION = :card_authentication

          # Inbound Card Validation: details will be under the `card_validation` object.
          CARD_VALIDATION = :card_validation

          # Card Decline: details will be under the `card_decline` object.
          CARD_DECLINE = :card_decline

          # Card Reversal: details will be under the `card_reversal` object.
          CARD_REVERSAL = :card_reversal

          # Card Authorization Expiration: details will be under the `card_authorization_expiration` object.
          CARD_AUTHORIZATION_EXPIRATION = :card_authorization_expiration

          # Card Increment: details will be under the `card_increment` object.
          CARD_INCREMENT = :card_increment

          # Card Settlement: details will be under the `card_settlement` object.
          CARD_SETTLEMENT = :card_settlement

          # Card Refund: details will be under the `card_refund` object.
          CARD_REFUND = :card_refund

          # Card Fuel Confirmation: details will be under the `card_fuel_confirmation` object.
          CARD_FUEL_CONFIRMATION = :card_fuel_confirmation

          # Unknown card payment element.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::CardPayment#state
      class State < Increase::Internal::Type::BaseModel
        # @!attribute authorized_amount
        #   The total authorized amount in the minor unit of the transaction's currency. For
        #   dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :authorized_amount, Integer

        # @!attribute fuel_confirmed_amount
        #   The total amount from fuel confirmations in the minor unit of the transaction's
        #   currency. For dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :fuel_confirmed_amount, Integer

        # @!attribute incremented_amount
        #   The total incrementally updated authorized amount in the minor unit of the
        #   transaction's currency. For dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :incremented_amount, Integer

        # @!attribute reversed_amount
        #   The total reversed amount in the minor unit of the transaction's currency. For
        #   dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :reversed_amount, Integer

        # @!attribute settled_amount
        #   The total settled or refunded amount in the minor unit of the transaction's
        #   currency. For dollars, for example, this is cents.
        #
        #   @return [Integer]
        required :settled_amount, Integer

        # @!method initialize(authorized_amount:, fuel_confirmed_amount:, incremented_amount:, reversed_amount:, settled_amount:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardPayment::State} for more details.
        #
        #   The summarized state of this card payment.
        #
        #   @param authorized_amount [Integer] The total authorized amount in the minor unit of the transaction's currency. For
        #
        #   @param fuel_confirmed_amount [Integer] The total amount from fuel confirmations in the minor unit of the transaction's
        #
        #   @param incremented_amount [Integer] The total incrementally updated authorized amount in the minor unit of the trans
        #
        #   @param reversed_amount [Integer] The total reversed amount in the minor unit of the transaction's currency. For d
        #
        #   @param settled_amount [Integer] The total settled or refunded amount in the minor unit of the transaction's curr
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_payment`.
      #
      # @see Increase::Models::CardPayment#type
      module Type
        extend Increase::Internal::Type::Enum

        CARD_PAYMENT = :card_payment

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
