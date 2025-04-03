# typed: strong

module Increase
  module Models
    class RealTimeDecisionActionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # If the Real-Time Decision relates to a 3DS card authentication attempt, this
      #   object contains your response to the authentication.
      sig { returns(T.nilable(Increase::Models::RealTimeDecisionActionParams::CardAuthentication)) }
      attr_reader :card_authentication

      sig do
        params(
          card_authentication: T.any(Increase::Models::RealTimeDecisionActionParams::CardAuthentication, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :card_authentication

      # If the Real-Time Decision relates to 3DS card authentication challenge delivery,
      #   this object contains your response.
      sig { returns(T.nilable(Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge)) }
      attr_reader :card_authentication_challenge

      sig do
        params(
          card_authentication_challenge: T.any(
            Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge,
            Increase::Internal::AnyHash
          )
        )
          .void
      end
      attr_writer :card_authentication_challenge

      # If the Real-Time Decision relates to a card authorization attempt, this object
      #   contains your response to the authorization.
      sig { returns(T.nilable(Increase::Models::RealTimeDecisionActionParams::CardAuthorization)) }
      attr_reader :card_authorization

      sig do
        params(
          card_authorization: T.any(Increase::Models::RealTimeDecisionActionParams::CardAuthorization, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :card_authorization

      # If the Real-Time Decision relates to a digital wallet authentication attempt,
      #   this object contains your response to the authentication.
      sig { returns(T.nilable(Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication)) }
      attr_reader :digital_wallet_authentication

      sig do
        params(
          digital_wallet_authentication: T.any(
            Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication,
            Increase::Internal::AnyHash
          )
        )
          .void
      end
      attr_writer :digital_wallet_authentication

      # If the Real-Time Decision relates to a digital wallet token provisioning
      #   attempt, this object contains your response to the attempt.
      sig { returns(T.nilable(Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken)) }
      attr_reader :digital_wallet_token

      sig do
        params(
          digital_wallet_token: T.any(Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :digital_wallet_token

      sig do
        params(
          card_authentication: T.any(Increase::Models::RealTimeDecisionActionParams::CardAuthentication, Increase::Internal::AnyHash),
          card_authentication_challenge: T.any(
            Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge,
            Increase::Internal::AnyHash
          ),
          card_authorization: T.any(Increase::Models::RealTimeDecisionActionParams::CardAuthorization, Increase::Internal::AnyHash),
          digital_wallet_authentication: T.any(
            Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication,
            Increase::Internal::AnyHash
          ),
          digital_wallet_token: T.any(Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        card_authentication: nil,
        card_authentication_challenge: nil,
        card_authorization: nil,
        digital_wallet_authentication: nil,
        digital_wallet_token: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              card_authentication: Increase::Models::RealTimeDecisionActionParams::CardAuthentication,
              card_authentication_challenge: Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge,
              card_authorization: Increase::Models::RealTimeDecisionActionParams::CardAuthorization,
              digital_wallet_authentication: Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication,
              digital_wallet_token: Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class CardAuthentication < Increase::Internal::Type::BaseModel
        # Whether the card authentication attempt should be approved or declined.
        sig { returns(Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision::OrSymbol) }
        attr_accessor :decision

        # If the Real-Time Decision relates to a 3DS card authentication attempt, this
        #   object contains your response to the authentication.
        sig do
          params(decision: Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision::OrSymbol)
            .returns(T.attached_class)
        end
        def self.new(decision:)
        end

        sig do
          override
            .returns(
              {decision: Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision::OrSymbol}
            )
        end
        def to_hash
        end

        # Whether the card authentication attempt should be approved or declined.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision) }
          OrSymbol =
            T.type_alias do
              T.any(
                Symbol,
                String,
                Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol
              )
            end

          # Approve the authentication attempt without triggering a challenge.
          APPROVE =
            T.let(
              :approve,
              Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol
            )

          # Request further validation before approving the authentication attempt.
          CHALLENGE =
            T.let(
              :challenge,
              Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol
            )

          # Deny the authentication attempt.
          DENY =
            T.let(:deny, Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol)

          sig do
            override
              .returns(
                T::Array[Increase::Models::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol]
              )
          end
          def self.values
          end
        end
      end

      class CardAuthenticationChallenge < Increase::Internal::Type::BaseModel
        # Whether the card authentication challenge was successfully delivered to the
        #   cardholder.
        sig { returns(Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::OrSymbol) }
        attr_accessor :result

        # If the Real-Time Decision relates to 3DS card authentication challenge delivery,
        #   this object contains your response.
        sig do
          params(
            result: Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::OrSymbol
          )
            .returns(T.attached_class)
        end
        def self.new(result:)
        end

        sig do
          override
            .returns(
              {result: Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::OrSymbol}
            )
        end
        def to_hash
        end

        # Whether the card authentication challenge was successfully delivered to the
        #   cardholder.
        module Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result) }
          OrSymbol =
            T.type_alias do
              T.any(
                Symbol,
                String,
                Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::TaggedSymbol
              )
            end

          # Your application successfully delivered the one-time code to the cardholder.
          SUCCESS =
            T.let(
              :success,
              Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::TaggedSymbol
            )

          # Your application was unable to deliver the one-time code to the cardholder.
          FAILURE =
            T.let(
              :failure,
              Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::TaggedSymbol
            )

          sig do
            override
              .returns(
                T::Array[Increase::Models::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::TaggedSymbol]
              )
          end
          def self.values
          end
        end
      end

      class CardAuthorization < Increase::Internal::Type::BaseModel
        # Whether the card authorization should be approved or declined.
        sig { returns(Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision::OrSymbol) }
        attr_accessor :decision

        # The reason the card authorization was declined. This translates to a specific
        #   decline code that is sent to the card network.
        sig do
          returns(
            T.nilable(Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::OrSymbol)
          )
        end
        attr_reader :decline_reason

        sig do
          params(
            decline_reason: Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::OrSymbol
          )
            .void
        end
        attr_writer :decline_reason

        # If the Real-Time Decision relates to a card authorization attempt, this object
        #   contains your response to the authorization.
        sig do
          params(
            decision: Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision::OrSymbol,
            decline_reason: Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::OrSymbol
          )
            .returns(T.attached_class)
        end
        def self.new(decision:, decline_reason: nil)
        end

        sig do
          override
            .returns(
              {
                decision: Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision::OrSymbol,
                decline_reason: Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::OrSymbol
              }
            )
        end
        def to_hash
        end

        # Whether the card authorization should be approved or declined.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision) }
          OrSymbol =
            T.type_alias do
              T.any(
                Symbol,
                String,
                Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision::TaggedSymbol
              )
            end

          # Approve the authorization.
          APPROVE =
            T.let(:approve, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision::TaggedSymbol)

          # Decline the authorization.
          DECLINE =
            T.let(:decline, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision::TaggedSymbol)

          sig do
            override
              .returns(
                T::Array[Increase::Models::RealTimeDecisionActionParams::CardAuthorization::Decision::TaggedSymbol]
              )
          end
          def self.values
          end
        end

        # The reason the card authorization was declined. This translates to a specific
        #   decline code that is sent to the card network.
        module DeclineReason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason) }
          OrSymbol =
            T.type_alias do
              T.any(
                Symbol,
                String,
                Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
              )
            end

          # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # This type of transaction is not allowed for this card. This transaction should not be retried.
          TRANSACTION_NEVER_ALLOWED =
            T.let(
              :transaction_never_allowed,
              Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
          EXCEEDS_APPROVAL_LIMIT =
            T.let(
              :exceeds_approval_limit,
              Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
          CARD_TEMPORARILY_DISABLED =
            T.let(
              :card_temporarily_disabled,
              Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
          SUSPECTED_FRAUD =
            T.let(
              :suspected_fraud,
              Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
          OTHER =
            T.let(
              :other,
              Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          sig do
            override
              .returns(
                T::Array[Increase::Models::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol]
              )
          end
          def self.values
          end
        end
      end

      class DigitalWalletAuthentication < Increase::Internal::Type::BaseModel
        # Whether your application was able to deliver the one-time passcode.
        sig { returns(Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::OrSymbol) }
        attr_accessor :result

        sig { returns(T.nilable(Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success)) }
        attr_reader :success

        sig do
          params(
            success: T.any(
              Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success,
              Increase::Internal::AnyHash
            )
          )
            .void
        end
        attr_writer :success

        # If the Real-Time Decision relates to a digital wallet authentication attempt,
        #   this object contains your response to the authentication.
        sig do
          params(
            result: Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::OrSymbol,
            success: T.any(
              Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success,
              Increase::Internal::AnyHash
            )
          )
            .returns(T.attached_class)
        end
        def self.new(result:, success: nil)
        end

        sig do
          override
            .returns(
              {
                result: Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::OrSymbol,
                success: Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success
              }
            )
        end
        def to_hash
        end

        # Whether your application was able to deliver the one-time passcode.
        module Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result) }
          OrSymbol =
            T.type_alias do
              T.any(
                Symbol,
                String,
                Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::TaggedSymbol
              )
            end

          # Your application successfully delivered the one-time passcode to the cardholder.
          SUCCESS =
            T.let(
              :success,
              Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::TaggedSymbol
            )

          # Your application failed to deliver the one-time passcode to the cardholder.
          FAILURE =
            T.let(
              :failure,
              Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::TaggedSymbol
            )

          sig do
            override
              .returns(
                T::Array[Increase::Models::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::TaggedSymbol]
              )
          end
          def self.values
          end
        end

        class Success < Increase::Internal::Type::BaseModel
          # The email address that was used to verify the cardholder via one-time passcode.
          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          # The phone number that was used to verify the cardholder via one-time passcode
          #   over SMS.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          sig { params(email: String, phone: String).returns(T.attached_class) }
          def self.new(email: nil, phone: nil)
          end

          sig { override.returns({email: String, phone: String}) }
          def to_hash
          end
        end
      end

      class DigitalWalletToken < Increase::Internal::Type::BaseModel
        # If your application approves the provisioning attempt, this contains metadata
        #   about the digital wallet token that will be generated.
        sig { returns(T.nilable(Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval)) }
        attr_reader :approval

        sig do
          params(
            approval: T.any(
              Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval,
              Increase::Internal::AnyHash
            )
          )
            .void
        end
        attr_writer :approval

        # If your application declines the provisioning attempt, this contains details
        #   about the decline.
        sig { returns(T.nilable(Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline)) }
        attr_reader :decline

        sig do
          params(
            decline: T.any(
              Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline,
              Increase::Internal::AnyHash
            )
          )
            .void
        end
        attr_writer :decline

        # If the Real-Time Decision relates to a digital wallet token provisioning
        #   attempt, this object contains your response to the attempt.
        sig do
          params(
            approval: T.any(
              Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval,
              Increase::Internal::AnyHash
            ),
            decline: T.any(
              Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline,
              Increase::Internal::AnyHash
            )
          )
            .returns(T.attached_class)
        end
        def self.new(approval: nil, decline: nil)
        end

        sig do
          override
            .returns(
              {
                approval: Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Approval,
                decline: Increase::Models::RealTimeDecisionActionParams::DigitalWalletToken::Decline
              }
            )
        end
        def to_hash
        end

        class Approval < Increase::Internal::Type::BaseModel
          # An email address that can be used to verify the cardholder via one-time
          #   passcode.
          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          # A phone number that can be used to verify the cardholder via one-time passcode
          #   over SMS.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          # If your application approves the provisioning attempt, this contains metadata
          #   about the digital wallet token that will be generated.
          sig { params(email: String, phone: String).returns(T.attached_class) }
          def self.new(email: nil, phone: nil)
          end

          sig { override.returns({email: String, phone: String}) }
          def to_hash
          end
        end

        class Decline < Increase::Internal::Type::BaseModel
          # Why the tokenization attempt was declined. This is for logging purposes only and
          #   is not displayed to the end-user.
          sig { returns(T.nilable(String)) }
          attr_reader :reason

          sig { params(reason: String).void }
          attr_writer :reason

          # If your application declines the provisioning attempt, this contains details
          #   about the decline.
          sig { params(reason: String).returns(T.attached_class) }
          def self.new(reason: nil)
          end

          sig { override.returns({reason: String}) }
          def to_hash
          end
        end
      end
    end
  end
end
