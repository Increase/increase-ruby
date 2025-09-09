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

        # If your application approves the authorization, this contains metadata about
        # your decision to approve. Your response here is advisory to the acquiring bank.
        # The bank may choose to reverse the authorization if you approve the transaction
        # but indicate the address does not match.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecisionActionParams::CardAuthorization::Approval
            )
          )
        end
        attr_reader :approval

        sig do
          params(
            approval:
              Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::OrHash
          ).void
        end
        attr_writer :approval

        # If your application declines the authorization, this contains details about the
        # decline.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecisionActionParams::CardAuthorization::Decline
            )
          )
        end
        attr_reader :decline

        sig do
          params(
            decline:
              Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::OrHash
          ).void
        end
        attr_writer :decline

        # If the Real-Time Decision relates to a card authorization attempt, this object
        # contains your response to the authorization.
        sig do
          params(
            decision:
              Increase::RealTimeDecisionActionParams::CardAuthorization::Decision::OrSymbol,
            approval:
              Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::OrHash,
            decline:
              Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the card authorization should be approved or declined.
          decision:,
          # If your application approves the authorization, this contains metadata about
          # your decision to approve. Your response here is advisory to the acquiring bank.
          # The bank may choose to reverse the authorization if you approve the transaction
          # but indicate the address does not match.
          approval: nil,
          # If your application declines the authorization, this contains details about the
          # decline.
          decline: nil
        )
        end

        sig do
          override.returns(
            {
              decision:
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decision::OrSymbol,
              approval:
                Increase::RealTimeDecisionActionParams::CardAuthorization::Approval,
              decline:
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline
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

        class Approval < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecisionActionParams::CardAuthorization::Approval,
                Increase::Internal::AnyHash
              )
            end

          # Your decisions on whether or not each provided address component is a match.
          # Your response here is evaluated against the customer's provided `postal_code`
          # and `line1`, and an appropriate network response is generated. For example, if
          # you would like to approve all transactions for a given card, you can submit
          # `match` for both `postal_code` and `line1` and Increase will generate an
          # approval with an Address Verification System (AVS) code that will match all of
          # the available address information, or will report that no check was performed if
          # no address information is available. If you do not provide a response, the
          # address verification result will be calculated by Increase using the available
          # address information available on the card. If none is available, Increase will
          # report that no check was performed.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult
              )
            )
          end
          attr_reader :cardholder_address_verification_result

          sig do
            params(
              cardholder_address_verification_result:
                Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::OrHash
            ).void
          end
          attr_writer :cardholder_address_verification_result

          # If your application approves the authorization, this contains metadata about
          # your decision to approve. Your response here is advisory to the acquiring bank.
          # The bank may choose to reverse the authorization if you approve the transaction
          # but indicate the address does not match.
          sig do
            params(
              cardholder_address_verification_result:
                Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Your decisions on whether or not each provided address component is a match.
            # Your response here is evaluated against the customer's provided `postal_code`
            # and `line1`, and an appropriate network response is generated. For example, if
            # you would like to approve all transactions for a given card, you can submit
            # `match` for both `postal_code` and `line1` and Increase will generate an
            # approval with an Address Verification System (AVS) code that will match all of
            # the available address information, or will report that no check was performed if
            # no address information is available. If you do not provide a response, the
            # address verification result will be calculated by Increase using the available
            # address information available on the card. If none is available, Increase will
            # report that no check was performed.
            cardholder_address_verification_result: nil
          )
          end

          sig do
            override.returns(
              {
                cardholder_address_verification_result:
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult
              }
            )
          end
          def to_hash
          end

          class CardholderAddressVerificationResult < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult,
                  Increase::Internal::AnyHash
                )
              end

            # Your decision on the address line of the provided address.
            sig do
              returns(
                Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::Line1::OrSymbol
              )
            end
            attr_accessor :line1

            # Your decision on the postal code of the provided address.
            sig do
              returns(
                Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::PostalCode::OrSymbol
              )
            end
            attr_accessor :postal_code

            # Your decisions on whether or not each provided address component is a match.
            # Your response here is evaluated against the customer's provided `postal_code`
            # and `line1`, and an appropriate network response is generated. For example, if
            # you would like to approve all transactions for a given card, you can submit
            # `match` for both `postal_code` and `line1` and Increase will generate an
            # approval with an Address Verification System (AVS) code that will match all of
            # the available address information, or will report that no check was performed if
            # no address information is available. If you do not provide a response, the
            # address verification result will be calculated by Increase using the available
            # address information available on the card. If none is available, Increase will
            # report that no check was performed.
            sig do
              params(
                line1:
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::Line1::OrSymbol,
                postal_code:
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::PostalCode::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Your decision on the address line of the provided address.
              line1:,
              # Your decision on the postal code of the provided address.
              postal_code:
            )
            end

            sig do
              override.returns(
                {
                  line1:
                    Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::Line1::OrSymbol,
                  postal_code:
                    Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::PostalCode::OrSymbol
                }
              )
            end
            def to_hash
            end

            # Your decision on the address line of the provided address.
            module Line1
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::Line1
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # The cardholder address verification result matches the address provided by the merchant.
              MATCH =
                T.let(
                  :match,
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::Line1::TaggedSymbol
                )

              # The cardholder address verification result does not match the address provided by the merchant.
              NO_MATCH =
                T.let(
                  :no_match,
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::Line1::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::Line1::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Your decision on the postal code of the provided address.
            module PostalCode
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::PostalCode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # The cardholder address verification result matches the address provided by the merchant.
              MATCH =
                T.let(
                  :match,
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::PostalCode::TaggedSymbol
                )

              # The cardholder address verification result does not match the address provided by the merchant.
              NO_MATCH =
                T.let(
                  :no_match,
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::PostalCode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecisionActionParams::CardAuthorization::Approval::CardholderAddressVerificationResult::PostalCode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class Decline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline,
                Increase::Internal::AnyHash
              )
            end

          # The reason the card authorization was declined. This translates to a specific
          # decline code that is sent to the card network.
          sig do
            returns(
              Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::OrSymbol
            )
          end
          attr_accessor :reason

          # If your application declines the authorization, this contains details about the
          # decline.
          sig do
            params(
              reason:
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The reason the card authorization was declined. This translates to a specific
            # decline code that is sent to the card network.
            reason:
          )
          end

          sig do
            override.returns(
              {
                reason:
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::OrSymbol
              }
            )
          end
          def to_hash
          end

          # The reason the card authorization was declined. This translates to a specific
          # decline code that is sent to the card network.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # This type of transaction is not allowed for this card. This transaction should not be retried.
            TRANSACTION_NEVER_ALLOWED =
              T.let(
                :transaction_never_allowed,
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
            EXCEEDS_APPROVAL_LIMIT =
              T.let(
                :exceeds_approval_limit,
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
            CARD_TEMPORARILY_DISABLED =
              T.let(
                :card_temporarily_disabled,
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
            OTHER =
              T.let(
                :other,
                Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecisionActionParams::CardAuthorization::Decline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
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

        # If your application was able to deliver the one-time passcode, this contains
        # metadata about the delivery. Exactly one of `phone` or `email` must be provided.
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
          # If your application was able to deliver the one-time passcode, this contains
          # metadata about the delivery. Exactly one of `phone` or `email` must be provided.
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

          # If your application was able to deliver the one-time passcode, this contains
          # metadata about the delivery. Exactly one of `phone` or `email` must be provided.
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
