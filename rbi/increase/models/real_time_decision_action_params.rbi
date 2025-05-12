# typed: strong

module Increase
  module Models
    class RealTimeDecisionActionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::RealTimeDecisionActionParams,
            Increase::Internal::AnyHash
          )
        end

      # If the Real-Time Decision relates to a 3DS card authentication attempt, this
      # object contains your response to the authentication.
      sig do
        returns(
          T.nilable(Increase::RealTimeDecisionActionParams::CardAuthentication)
        )
      end
      attr_reader :card_authentication

      sig do
        params(
          card_authentication:
            Increase::RealTimeDecisionActionParams::CardAuthentication::OrHash
        ).void
      end
      attr_writer :card_authentication

      # If the Real-Time Decision relates to 3DS card authentication challenge delivery,
      # this object contains your response.
      sig do
        returns(
          T.nilable(
            Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge
          )
        )
      end
      attr_reader :card_authentication_challenge

      sig do
        params(
          card_authentication_challenge:
            Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::OrHash
        ).void
      end
      attr_writer :card_authentication_challenge

      # If the Real-Time Decision relates to a card authorization attempt, this object
      # contains your response to the authorization.
      sig do
        returns(
          T.nilable(Increase::RealTimeDecisionActionParams::CardAuthorization)
        )
      end
      attr_reader :card_authorization

      sig do
        params(
          card_authorization:
            Increase::RealTimeDecisionActionParams::CardAuthorization::OrHash
        ).void
      end
      attr_writer :card_authorization

      # If the Real-Time Decision relates to a digital wallet authentication attempt,
      # this object contains your response to the authentication.
      sig do
        returns(
          T.nilable(
            Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication
          )
        )
      end
      attr_reader :digital_wallet_authentication

      sig do
        params(
          digital_wallet_authentication:
            Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::OrHash
        ).void
      end
      attr_writer :digital_wallet_authentication

      # If the Real-Time Decision relates to a digital wallet token provisioning
      # attempt, this object contains your response to the attempt.
      sig do
        returns(
          T.nilable(Increase::RealTimeDecisionActionParams::DigitalWalletToken)
        )
      end
      attr_reader :digital_wallet_token

      sig do
        params(
          digital_wallet_token:
            Increase::RealTimeDecisionActionParams::DigitalWalletToken::OrHash
        ).void
      end
      attr_writer :digital_wallet_token

      sig do
        params(
          card_authentication:
            Increase::RealTimeDecisionActionParams::CardAuthentication::OrHash,
          card_authentication_challenge:
            Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::OrHash,
          card_authorization:
            Increase::RealTimeDecisionActionParams::CardAuthorization::OrHash,
          digital_wallet_authentication:
            Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::OrHash,
          digital_wallet_token:
            Increase::RealTimeDecisionActionParams::DigitalWalletToken::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # If the Real-Time Decision relates to a 3DS card authentication attempt, this
        # object contains your response to the authentication.
        card_authentication: nil,
        # If the Real-Time Decision relates to 3DS card authentication challenge delivery,
        # this object contains your response.
        card_authentication_challenge: nil,
        # If the Real-Time Decision relates to a card authorization attempt, this object
        # contains your response to the authorization.
        card_authorization: nil,
        # If the Real-Time Decision relates to a digital wallet authentication attempt,
        # this object contains your response to the authentication.
        digital_wallet_authentication: nil,
        # If the Real-Time Decision relates to a digital wallet token provisioning
        # attempt, this object contains your response to the attempt.
        digital_wallet_token: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            card_authentication:
              Increase::RealTimeDecisionActionParams::CardAuthentication,
            card_authentication_challenge:
              Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge,
            card_authorization:
              Increase::RealTimeDecisionActionParams::CardAuthorization,
            digital_wallet_authentication:
              Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication,
            digital_wallet_token:
              Increase::RealTimeDecisionActionParams::DigitalWalletToken,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class CardAuthentication < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecisionActionParams::CardAuthentication,
              Increase::Internal::AnyHash
            )
          end

        # Whether the card authentication attempt should be approved or declined.
        sig do
          returns(
            Increase::RealTimeDecisionActionParams::CardAuthentication::Decision::OrSymbol
          )
        end
        attr_accessor :decision

        # If the Real-Time Decision relates to a 3DS card authentication attempt, this
        # object contains your response to the authentication.
        sig do
          params(
            decision:
              Increase::RealTimeDecisionActionParams::CardAuthentication::Decision::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the card authentication attempt should be approved or declined.
          decision:
        )
        end

        sig do
          override.returns(
            {
              decision:
                Increase::RealTimeDecisionActionParams::CardAuthentication::Decision::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Whether the card authentication attempt should be approved or declined.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecisionActionParams::CardAuthentication::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the authentication attempt without triggering a challenge.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol
            )

          # Request further validation before approving the authentication attempt.
          CHALLENGE =
            T.let(
              :challenge,
              Increase::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol
            )

          # Deny the authentication attempt.
          DENY =
            T.let(
              :deny,
              Increase::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecisionActionParams::CardAuthentication::Decision::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class CardAuthenticationChallenge < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge,
              Increase::Internal::AnyHash
            )
          end

        # Whether the card authentication challenge was successfully delivered to the
        # cardholder.
        sig do
          returns(
            Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::OrSymbol
          )
        end
        attr_accessor :result

        # If the Real-Time Decision relates to 3DS card authentication challenge delivery,
        # this object contains your response.
        sig do
          params(
            result:
              Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the card authentication challenge was successfully delivered to the
          # cardholder.
          result:
        )
        end

        sig do
          override.returns(
            {
              result:
                Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Whether the card authentication challenge was successfully delivered to the
        # cardholder.
        module Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Your application successfully delivered the one-time code to the cardholder.
          SUCCESS =
            T.let(
              :success,
              Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::TaggedSymbol
            )

          # Your application was unable to deliver the one-time code to the cardholder.
          FAILURE =
            T.let(
              :failure,
              Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecisionActionParams::CardAuthenticationChallenge::Result::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class CardAuthorization < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecisionActionParams::CardAuthorization,
              Increase::Internal::AnyHash
            )
          end

        # Whether the card authorization should be approved or declined.
        sig do
          returns(
            Increase::RealTimeDecisionActionParams::CardAuthorization::Decision::OrSymbol
          )
        end
        attr_accessor :decision

        # The reason the card authorization was declined. This translates to a specific
        # decline code that is sent to the card network.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::OrSymbol
            )
          )
        end
        attr_reader :decline_reason

        sig do
          params(
            decline_reason:
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::OrSymbol
          ).void
        end
        attr_writer :decline_reason

        # If the Real-Time Decision relates to a card authorization attempt, this object
        # contains your response to the authorization.
        sig do
          params(
            decision:
              Increase::RealTimeDecisionActionParams::CardAuthorization::Decision::OrSymbol,
            decline_reason:
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the card authorization should be approved or declined.
          decision:,
          # The reason the card authorization was declined. This translates to a specific
          # decline code that is sent to the card network.
          decline_reason: nil
        )
        end

        sig do
          override.returns(
            {
              decision:
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decision::OrSymbol,
              decline_reason:
                Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Whether the card authorization should be approved or declined.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the authorization.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecisionActionParams::CardAuthorization::Decision::TaggedSymbol
            )

          # Decline the authorization.
          DECLINE =
            T.let(
              :decline,
              Increase::RealTimeDecisionActionParams::CardAuthorization::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decision::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The reason the card authorization was declined. This translates to a specific
        # decline code that is sent to the card network.
        module DeclineReason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # This type of transaction is not allowed for this card. This transaction should not be retried.
          TRANSACTION_NEVER_ALLOWED =
            T.let(
              :transaction_never_allowed,
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
          EXCEEDS_APPROVAL_LIMIT =
            T.let(
              :exceeds_approval_limit,
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
          CARD_TEMPORARILY_DISABLED =
            T.let(
              :card_temporarily_disabled,
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
          SUSPECTED_FRAUD =
            T.let(
              :suspected_fraud,
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
          OTHER =
            T.let(
              :other,
              Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecisionActionParams::CardAuthorization::DeclineReason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class DigitalWalletAuthentication < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication,
              Increase::Internal::AnyHash
            )
          end

        # Whether your application was able to deliver the one-time passcode.
        sig do
          returns(
            Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::OrSymbol
          )
        end
        attr_accessor :result

        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success
            )
          )
        end
        attr_reader :success

        sig do
          params(
            success:
              Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success::OrHash
          ).void
        end
        attr_writer :success

        # If the Real-Time Decision relates to a digital wallet authentication attempt,
        # this object contains your response to the authentication.
        sig do
          params(
            result:
              Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::OrSymbol,
            success:
              Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether your application was able to deliver the one-time passcode.
          result:,
          success: nil
        )
        end

        sig do
          override.returns(
            {
              result:
                Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::OrSymbol,
              success:
                Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success
            }
          )
        end
        def to_hash
        end

        # Whether your application was able to deliver the one-time passcode.
        module Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Your application successfully delivered the one-time passcode to the cardholder.
          SUCCESS =
            T.let(
              :success,
              Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::TaggedSymbol
            )

          # Your application failed to deliver the one-time passcode to the cardholder.
          FAILURE =
            T.let(
              :failure,
              Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Result::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Success < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecisionActionParams::DigitalWalletAuthentication::Success,
                Increase::Internal::AnyHash
              )
            end

          # The email address that was used to verify the cardholder via one-time passcode.
          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          # The phone number that was used to verify the cardholder via one-time passcode
          # over SMS.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          sig { params(email: String, phone: String).returns(T.attached_class) }
          def self.new(
            # The email address that was used to verify the cardholder via one-time passcode.
            email: nil,
            # The phone number that was used to verify the cardholder via one-time passcode
            # over SMS.
            phone: nil
          )
          end

          sig { override.returns({ email: String, phone: String }) }
          def to_hash
          end
        end
      end

      class DigitalWalletToken < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecisionActionParams::DigitalWalletToken,
              Increase::Internal::AnyHash
            )
          end

        # If your application approves the provisioning attempt, this contains metadata
        # about the digital wallet token that will be generated.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecisionActionParams::DigitalWalletToken::Approval
            )
          )
        end
        attr_reader :approval

        sig do
          params(
            approval:
              Increase::RealTimeDecisionActionParams::DigitalWalletToken::Approval::OrHash
          ).void
        end
        attr_writer :approval

        # If your application declines the provisioning attempt, this contains details
        # about the decline.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecisionActionParams::DigitalWalletToken::Decline
            )
          )
        end
        attr_reader :decline

        sig do
          params(
            decline:
              Increase::RealTimeDecisionActionParams::DigitalWalletToken::Decline::OrHash
          ).void
        end
        attr_writer :decline

        # If the Real-Time Decision relates to a digital wallet token provisioning
        # attempt, this object contains your response to the attempt.
        sig do
          params(
            approval:
              Increase::RealTimeDecisionActionParams::DigitalWalletToken::Approval::OrHash,
            decline:
              Increase::RealTimeDecisionActionParams::DigitalWalletToken::Decline::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # If your application approves the provisioning attempt, this contains metadata
          # about the digital wallet token that will be generated.
          approval: nil,
          # If your application declines the provisioning attempt, this contains details
          # about the decline.
          decline: nil
        )
        end

        sig do
          override.returns(
            {
              approval:
                Increase::RealTimeDecisionActionParams::DigitalWalletToken::Approval,
              decline:
                Increase::RealTimeDecisionActionParams::DigitalWalletToken::Decline
            }
          )
        end
        def to_hash
        end

        class Approval < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecisionActionParams::DigitalWalletToken::Approval,
                Increase::Internal::AnyHash
              )
            end

          # An email address that can be used to verify the cardholder via one-time
          # passcode.
          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          # A phone number that can be used to verify the cardholder via one-time passcode
          # over SMS.
          sig { returns(T.nilable(String)) }
          attr_reader :phone

          sig { params(phone: String).void }
          attr_writer :phone

          # If your application approves the provisioning attempt, this contains metadata
          # about the digital wallet token that will be generated.
          sig { params(email: String, phone: String).returns(T.attached_class) }
          def self.new(
            # An email address that can be used to verify the cardholder via one-time
            # passcode.
            email: nil,
            # A phone number that can be used to verify the cardholder via one-time passcode
            # over SMS.
            phone: nil
          )
          end

          sig { override.returns({ email: String, phone: String }) }
          def to_hash
          end
        end

        class Decline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecisionActionParams::DigitalWalletToken::Decline,
                Increase::Internal::AnyHash
              )
            end

          # Why the tokenization attempt was declined. This is for logging purposes only and
          # is not displayed to the end-user.
          sig { returns(T.nilable(String)) }
          attr_reader :reason

          sig { params(reason: String).void }
          attr_writer :reason

          # If your application declines the provisioning attempt, this contains details
          # about the decline.
          sig { params(reason: String).returns(T.attached_class) }
          def self.new(
            # Why the tokenization attempt was declined. This is for logging purposes only and
            # is not displayed to the end-user.
            reason: nil
          )
          end

          sig { override.returns({ reason: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
