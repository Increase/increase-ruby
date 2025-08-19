# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimeDecisions#action
    class RealTimeDecisionActionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute card_authentication
      #   If the Real-Time Decision relates to a 3DS card authentication attempt, this
      #   object contains your response to the authentication.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::CardAuthentication, nil]
      optional :card_authentication, -> { Increase::RealTimeDecisionActionParams::CardAuthentication }

      # @!attribute card_authentication_challenge
      #   If the Real-Time Decision relates to 3DS card authentication challenge delivery,
      #   this object contains your response.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge, nil]
      optional :card_authentication_challenge,
               -> { Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge }

      # @!attribute card_authorization
      #   If the Real-Time Decision relates to a card authorization attempt, this object
      #   contains your response to the authorization.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::CardAuthorization, nil]
      optional :card_authorization, -> { Increase::RealTimeDecisionActionParams::CardAuthorization }

      # @!attribute digital_wallet_authentication
      #   If the Real-Time Decision relates to a digital wallet authentication attempt,
      #   this object contains your response to the authentication.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication, nil]
      optional :digital_wallet_authentication,
               -> { Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication }

      # @!attribute digital_wallet_token
      #   If the Real-Time Decision relates to a digital wallet token provisioning
      #   attempt, this object contains your response to the attempt.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken, nil]
      optional :digital_wallet_token, -> { Increase::RealTimeDecisionActionParams::DigitalWalletToken }

      # @!method initialize(card_authentication: nil, card_authentication_challenge: nil, card_authorization: nil, digital_wallet_authentication: nil, digital_wallet_token: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::RealTimeDecisionActionParams} for more details.
      #
      #   @param card_authentication [Increase::Models::RealTimeDecisionActionParams::CardAuthentication] If the Real-Time Decision relates to a 3DS card authentication attempt, this obj
      #
      #   @param card_authentication_challenge [Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge] If the Real-Time Decision relates to 3DS card authentication challenge delivery,
      #
      #   @param card_authorization [Increase::Models::RealTimeDecisionActionParams::CardAuthorization] If the Real-Time Decision relates to a card authorization attempt, this object c
      #
      #   @param digital_wallet_authentication [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication] If the Real-Time Decision relates to a digital wallet authentication attempt, th
      #
      #   @param digital_wallet_token [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken] If the Real-Time Decision relates to a digital wallet token provisioning attempt
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class CardAuthentication < Increase::Internal::Type::BaseModel
        # @!attribute decision
        #   Whether the card authentication attempt should be approved or declined.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision]
        required :decision, enum: -> { Increase::RealTimeDecisionActionParams::CardAuthentication::Decision }

        # @!method initialize(decision:)
        #   If the Real-Time Decision relates to a 3DS card authentication attempt, this
        #   object contains your response to the authentication.
        #
        #   @param decision [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision] Whether the card authentication attempt should be approved or declined.

        # Whether the card authentication attempt should be approved or declined.
        #
        # @see Increase::Models::RealTimeDecisionActionParams::CardAuthentication#decision
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

      class CardAuthenticationChallenge < Increase::Internal::Type::BaseModel
        # @!attribute result
        #   Whether the card authentication challenge was successfully delivered to the
        #   cardholder.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result]
        required :result, enum: -> { Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result }

        # @!method initialize(result:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge}
        #   for more details.
        #
        #   If the Real-Time Decision relates to 3DS card authentication challenge delivery,
        #   this object contains your response.
        #
        #   @param result [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result] Whether the card authentication challenge was successfully delivered to the card

        # Whether the card authentication challenge was successfully delivered to the
        # cardholder.
        #
        # @see Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge#result
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

      class CardAuthorization < Increase::Internal::Type::BaseModel
        # @!attribute decision
        #   Whether the card authorization should be approved or declined.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision]
        required :decision, enum: -> { Increase::RealTimeDecisionActionParams::CardAuthorization::Decision }

        # @!attribute decline_reason
        #   The reason the card authorization was declined. This translates to a specific
        #   decline code that is sent to the card network.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason, nil]
        optional :decline_reason,
                 enum: -> { Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason }

        # @!method initialize(decision:, decline_reason: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RealTimeDecisionActionParams::CardAuthorization} for more
        #   details.
        #
        #   If the Real-Time Decision relates to a card authorization attempt, this object
        #   contains your response to the authorization.
        #
        #   @param decision [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision] Whether the card authorization should be approved or declined.
        #
        #   @param decline_reason [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason] The reason the card authorization was declined. This translates to a specific de

        # Whether the card authorization should be approved or declined.
        #
        # @see Increase::Models::RealTimeDecisionActionParams::CardAuthorization#decision
        module Decision
          extend Increase::Internal::Type::Enum

          # Approve the authorization.
          APPROVE = :approve

          # Decline the authorization.
          DECLINE = :decline

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The reason the card authorization was declined. This translates to a specific
        # decline code that is sent to the card network.
        #
        # @see Increase::Models::RealTimeDecisionActionParams::CardAuthorization#decline_reason
        module DeclineReason
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

      class DigitalWalletAuthentication < Increase::Internal::Type::BaseModel
        # @!attribute result
        #   Whether your application was able to deliver the one-time passcode.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result]
        required :result, enum: -> { Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result }

        # @!attribute success
        #
        #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success, nil]
        optional :success, -> { Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success }

        # @!method initialize(result:, success: nil)
        #   If the Real-Time Decision relates to a digital wallet authentication attempt,
        #   this object contains your response to the authentication.
        #
        #   @param result [Symbol, Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result] Whether your application was able to deliver the one-time passcode.
        #
        #   @param success [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success]

        # Whether your application was able to deliver the one-time passcode.
        #
        # @see Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication#result
        module Result
          extend Increase::Internal::Type::Enum

          # Your application successfully delivered the one-time passcode to the cardholder.
          SUCCESS = :success

          # Your application failed to deliver the one-time passcode to the cardholder.
          FAILURE = :failure

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication#success
        class Success < Increase::Internal::Type::BaseModel
          # @!attribute email
          #   The email address that was used to verify the cardholder via one-time passcode.
          #
          #   @return [String, nil]
          optional :email, String

          # @!attribute phone
          #   The phone number that was used to verify the cardholder via one-time passcode
          #   over SMS.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(email: nil, phone: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success}
          #   for more details.
          #
          #   @param email [String] The email address that was used to verify the cardholder via one-time passcode.
          #
          #   @param phone [String] The phone number that was used to verify the cardholder via one-time passcode ov
        end
      end

      class DigitalWalletToken < Increase::Internal::Type::BaseModel
        # @!attribute approval
        #   If your application approves the provisioning attempt, this contains metadata
        #   about the digital wallet token that will be generated.
        #
        #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval, nil]
        optional :approval, -> { Increase::RealTimeDecisionActionParams::DigitalWalletToken::Approval }

        # @!attribute decline
        #   If your application declines the provisioning attempt, this contains details
        #   about the decline.
        #
        #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline, nil]
        optional :decline, -> { Increase::RealTimeDecisionActionParams::DigitalWalletToken::Decline }

        # @!method initialize(approval: nil, decline: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken} for more
        #   details.
        #
        #   If the Real-Time Decision relates to a digital wallet token provisioning
        #   attempt, this object contains your response to the attempt.
        #
        #   @param approval [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval] If your application approves the provisioning attempt, this contains metadata ab
        #
        #   @param decline [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline] If your application declines the provisioning attempt, this contains details abo

        # @see Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken#approval
        class Approval < Increase::Internal::Type::BaseModel
          # @!attribute email
          #   An email address that can be used to verify the cardholder via one-time
          #   passcode.
          #
          #   @return [String, nil]
          optional :email, String

          # @!attribute phone
          #   A phone number that can be used to verify the cardholder via one-time passcode
          #   over SMS.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!method initialize(email: nil, phone: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval}
          #   for more details.
          #
          #   If your application approves the provisioning attempt, this contains metadata
          #   about the digital wallet token that will be generated.
          #
          #   @param email [String] An email address that can be used to verify the cardholder via one-time passcode
          #
          #   @param phone [String] A phone number that can be used to verify the cardholder via one-time passcode o
        end

        # @see Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken#decline
        class Decline < Increase::Internal::Type::BaseModel
          # @!attribute reason
          #   Why the tokenization attempt was declined. This is for logging purposes only and
          #   is not displayed to the end-user.
          #
          #   @return [String, nil]
          optional :reason, String

          # @!method initialize(reason: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline}
          #   for more details.
          #
          #   If your application declines the provisioning attempt, this contains details
          #   about the decline.
          #
          #   @param reason [String] Why the tokenization attempt was declined. This is for logging purposes only and
        end
      end
    end
  end
end
