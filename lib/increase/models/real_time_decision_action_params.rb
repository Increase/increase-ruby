# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::RealTimeDecisions#action
    class RealTimeDecisionActionParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute [r] card_authentication
      #   If the Real-Time Decision relates to a 3DS card authentication attempt, this
      #     object contains your response to the authentication.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::CardAuthentication, nil]
      optional :card_authentication, -> { Increase::Models::RealTimeDecisionActionParams::CardAuthentication }

      # @!parse
      #   # @return [Increase::Models::RealTimeDecisionActionParams::CardAuthentication]
      #   attr_writer :card_authentication

      # @!attribute [r] card_authentication_challenge
      #   If the Real-Time Decision relates to 3DS card authentication challenge delivery,
      #     this object contains your response.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge, nil]
      optional :card_authentication_challenge,
               -> { Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge }

      # @!parse
      #   # @return [Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge]
      #   attr_writer :card_authentication_challenge

      # @!attribute [r] card_authorization
      #   If the Real-Time Decision relates to a card authorization attempt, this object
      #     contains your response to the authorization.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::CardAuthorization, nil]
      optional :card_authorization, -> { Increase::Models::RealTimeDecisionActionParams::CardAuthorization }

      # @!parse
      #   # @return [Increase::Models::RealTimeDecisionActionParams::CardAuthorization]
      #   attr_writer :card_authorization

      # @!attribute [r] digital_wallet_authentication
      #   If the Real-Time Decision relates to a digital wallet authentication attempt,
      #     this object contains your response to the authentication.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication, nil]
      optional :digital_wallet_authentication,
               -> { Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication }

      # @!parse
      #   # @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication]
      #   attr_writer :digital_wallet_authentication

      # @!attribute [r] digital_wallet_token
      #   If the Real-Time Decision relates to a digital wallet token provisioning
      #     attempt, this object contains your response to the attempt.
      #
      #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken, nil]
      optional :digital_wallet_token, -> { Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken }

      # @!parse
      #   # @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken]
      #   attr_writer :digital_wallet_token

      # @!parse
      #   # @param card_authentication [Increase::Models::RealTimeDecisionActionParams::CardAuthentication]
      #   # @param card_authentication_challenge [Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge]
      #   # @param card_authorization [Increase::Models::RealTimeDecisionActionParams::CardAuthorization]
      #   # @param digital_wallet_authentication [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication]
      #   # @param digital_wallet_token [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     card_authentication: nil,
      #     card_authentication_challenge: nil,
      #     card_authorization: nil,
      #     digital_wallet_authentication: nil,
      #     digital_wallet_token: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      class CardAuthentication < Increase::Internal::Type::BaseModel
        # @!attribute decision
        #   Whether the card authentication attempt should be approved or declined.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision]
        required :decision,
                 enum: -> { Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision }

        # @!parse
        #   # If the Real-Time Decision relates to a 3DS card authentication attempt, this
        #   #   object contains your response to the authentication.
        #   #
        #   # @param decision [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision]
        #   #
        #   def initialize(decision:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      class CardAuthenticationChallenge < Increase::Internal::Type::BaseModel
        # @!attribute result
        #   Whether the card authentication challenge was successfully delivered to the
        #     cardholder.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result]
        required :result,
                 enum: -> { Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result }

        # @!parse
        #   # If the Real-Time Decision relates to 3DS card authentication challenge delivery,
        #   #   this object contains your response.
        #   #
        #   # @param result [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result]
        #   #
        #   def initialize(result:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # Whether the card authentication challenge was successfully delivered to the
        #   cardholder.
        #
        # @see Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge#result
        module Result
          extend Increase::Internal::Type::Enum

          # Your application successfully delivered the one-time code to the cardholder.
          SUCCESS = :success

          # Your application was unable to deliver the one-time code to the cardholder.
          FAILURE = :failure

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      class CardAuthorization < Increase::Internal::Type::BaseModel
        # @!attribute decision
        #   Whether the card authorization should be approved or declined.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision]
        required :decision,
                 enum: -> { Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision }

        # @!attribute [r] decline_reason
        #   The reason the card authorization was declined. This translates to a specific
        #     decline code that is sent to the card network.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason, nil]
        optional :decline_reason,
                 enum: -> { Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason }

        # @!parse
        #   # @return [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason]
        #   attr_writer :decline_reason

        # @!parse
        #   # If the Real-Time Decision relates to a card authorization attempt, this object
        #   #   contains your response to the authorization.
        #   #
        #   # @param decision [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision]
        #   # @param decline_reason [Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason]
        #   #
        #   def initialize(decision:, decline_reason: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # Whether the card authorization should be approved or declined.
        #
        # @see Increase::Models::RealTimeDecisionActionParams::CardAuthorization#decision
        module Decision
          extend Increase::Internal::Type::Enum

          # Approve the authorization.
          APPROVE = :approve

          # Decline the authorization.
          DECLINE = :decline

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        # The reason the card authorization was declined. This translates to a specific
        #   decline code that is sent to the card network.
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      class DigitalWalletAuthentication < Increase::Internal::Type::BaseModel
        # @!attribute result
        #   Whether your application was able to deliver the one-time passcode.
        #
        #   @return [Symbol, Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result]
        required :result,
                 enum: -> { Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result }

        # @!attribute [r] success
        #
        #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success, nil]
        optional :success,
                 -> { Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success }

        # @!parse
        #   # @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success]
        #   attr_writer :success

        # @!parse
        #   # If the Real-Time Decision relates to a digital wallet authentication attempt,
        #   #   this object contains your response to the authentication.
        #   #
        #   # @param result [Symbol, Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result]
        #   # @param success [Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success]
        #   #
        #   def initialize(result:, success: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # Whether your application was able to deliver the one-time passcode.
        #
        # @see Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication#result
        module Result
          extend Increase::Internal::Type::Enum

          # Your application successfully delivered the one-time passcode to the cardholder.
          SUCCESS = :success

          # Your application failed to deliver the one-time passcode to the cardholder.
          FAILURE = :failure

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        # @see Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication#success
        class Success < Increase::Internal::Type::BaseModel
          # @!attribute [r] email
          #   The email address that was used to verify the cardholder via one-time passcode.
          #
          #   @return [String, nil]
          optional :email, String

          # @!parse
          #   # @return [String]
          #   attr_writer :email

          # @!attribute [r] phone
          #   The phone number that was used to verify the cardholder via one-time passcode
          #     over SMS.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!parse
          #   # @return [String]
          #   attr_writer :phone

          # @!parse
          #   # @param email [String]
          #   # @param phone [String]
          #   #
          #   def initialize(email: nil, phone: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end
      end

      class DigitalWalletToken < Increase::Internal::Type::BaseModel
        # @!attribute [r] approval
        #   If your application approves the provisioning attempt, this contains metadata
        #     about the digital wallet token that will be generated.
        #
        #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval, nil]
        optional :approval, -> { Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval }

        # @!parse
        #   # @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval]
        #   attr_writer :approval

        # @!attribute [r] decline
        #   If your application declines the provisioning attempt, this contains details
        #     about the decline.
        #
        #   @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline, nil]
        optional :decline, -> { Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline }

        # @!parse
        #   # @return [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline]
        #   attr_writer :decline

        # @!parse
        #   # If the Real-Time Decision relates to a digital wallet token provisioning
        #   #   attempt, this object contains your response to the attempt.
        #   #
        #   # @param approval [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval]
        #   # @param decline [Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline]
        #   #
        #   def initialize(approval: nil, decline: nil, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken#approval
        class Approval < Increase::Internal::Type::BaseModel
          # @!attribute [r] email
          #   An email address that can be used to verify the cardholder via one-time
          #     passcode.
          #
          #   @return [String, nil]
          optional :email, String

          # @!parse
          #   # @return [String]
          #   attr_writer :email

          # @!attribute [r] phone
          #   A phone number that can be used to verify the cardholder via one-time passcode
          #     over SMS.
          #
          #   @return [String, nil]
          optional :phone, String

          # @!parse
          #   # @return [String]
          #   attr_writer :phone

          # @!parse
          #   # If your application approves the provisioning attempt, this contains metadata
          #   #   about the digital wallet token that will be generated.
          #   #
          #   # @param email [String]
          #   # @param phone [String]
          #   #
          #   def initialize(email: nil, phone: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # @see Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken#decline
        class Decline < Increase::Internal::Type::BaseModel
          # @!attribute [r] reason
          #   Why the tokenization attempt was declined. This is for logging purposes only and
          #     is not displayed to the end-user.
          #
          #   @return [String, nil]
          optional :reason, String

          # @!parse
          #   # @return [String]
          #   attr_writer :reason

          # @!parse
          #   # If your application declines the provisioning attempt, this contains details
          #   #   about the decline.
          #   #
          #   # @param reason [String]
          #   #
          #   def initialize(reason: nil, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end
      end
    end
  end
end
