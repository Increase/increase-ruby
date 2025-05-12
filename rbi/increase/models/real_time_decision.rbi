# typed: strong

module Increase
  module Models
    class RealTimeDecision < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::RealTimeDecision, Increase::Internal::AnyHash)
        end

      # The Real-Time Decision identifier.
      sig { returns(String) }
      attr_accessor :id

      # Fields related to a 3DS authentication attempt.
      sig { returns(T.nilable(Increase::RealTimeDecision::CardAuthentication)) }
      attr_reader :card_authentication

      sig do
        params(
          card_authentication:
            T.nilable(Increase::RealTimeDecision::CardAuthentication::OrHash)
        ).void
      end
      attr_writer :card_authentication

      # Fields related to a 3DS authentication attempt.
      sig do
        returns(
          T.nilable(Increase::RealTimeDecision::CardAuthenticationChallenge)
        )
      end
      attr_reader :card_authentication_challenge

      sig do
        params(
          card_authentication_challenge:
            T.nilable(
              Increase::RealTimeDecision::CardAuthenticationChallenge::OrHash
            )
        ).void
      end
      attr_writer :card_authentication_challenge

      # Fields related to a card authorization.
      sig { returns(T.nilable(Increase::RealTimeDecision::CardAuthorization)) }
      attr_reader :card_authorization

      sig do
        params(
          card_authorization:
            T.nilable(Increase::RealTimeDecision::CardAuthorization::OrHash)
        ).void
      end
      attr_writer :card_authorization

      # The category of the Real-Time Decision.
      sig { returns(Increase::RealTimeDecision::Category::TaggedSymbol) }
      attr_accessor :category

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Real-Time Decision was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Fields related to a digital wallet authentication attempt.
      sig do
        returns(
          T.nilable(Increase::RealTimeDecision::DigitalWalletAuthentication)
        )
      end
      attr_reader :digital_wallet_authentication

      sig do
        params(
          digital_wallet_authentication:
            T.nilable(
              Increase::RealTimeDecision::DigitalWalletAuthentication::OrHash
            )
        ).void
      end
      attr_writer :digital_wallet_authentication

      # Fields related to a digital wallet token provisioning attempt.
      sig { returns(T.nilable(Increase::RealTimeDecision::DigitalWalletToken)) }
      attr_reader :digital_wallet_token

      sig do
        params(
          digital_wallet_token:
            T.nilable(Increase::RealTimeDecision::DigitalWalletToken::OrHash)
        ).void
      end
      attr_writer :digital_wallet_token

      # The status of the Real-Time Decision.
      sig { returns(Increase::RealTimeDecision::Status::TaggedSymbol) }
      attr_accessor :status

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # your application can no longer respond to the Real-Time Decision.
      sig { returns(Time) }
      attr_accessor :timeout_at

      # A constant representing the object's type. For this resource it will always be
      # `real_time_decision`.
      sig { returns(Increase::RealTimeDecision::Type::TaggedSymbol) }
      attr_accessor :type

      # Real Time Decisions are created when your application needs to take action in
      # real-time to some event such as a card authorization. For more information, see
      # our
      # [Real-Time Decisions guide](https://increase.com/documentation/real-time-decisions).
      sig do
        params(
          id: String,
          card_authentication:
            T.nilable(Increase::RealTimeDecision::CardAuthentication::OrHash),
          card_authentication_challenge:
            T.nilable(
              Increase::RealTimeDecision::CardAuthenticationChallenge::OrHash
            ),
          card_authorization:
            T.nilable(Increase::RealTimeDecision::CardAuthorization::OrHash),
          category: Increase::RealTimeDecision::Category::OrSymbol,
          created_at: Time,
          digital_wallet_authentication:
            T.nilable(
              Increase::RealTimeDecision::DigitalWalletAuthentication::OrHash
            ),
          digital_wallet_token:
            T.nilable(Increase::RealTimeDecision::DigitalWalletToken::OrHash),
          status: Increase::RealTimeDecision::Status::OrSymbol,
          timeout_at: Time,
          type: Increase::RealTimeDecision::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Real-Time Decision identifier.
        id:,
        # Fields related to a 3DS authentication attempt.
        card_authentication:,
        # Fields related to a 3DS authentication attempt.
        card_authentication_challenge:,
        # Fields related to a card authorization.
        card_authorization:,
        # The category of the Real-Time Decision.
        category:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Real-Time Decision was created.
        created_at:,
        # Fields related to a digital wallet authentication attempt.
        digital_wallet_authentication:,
        # Fields related to a digital wallet token provisioning attempt.
        digital_wallet_token:,
        # The status of the Real-Time Decision.
        status:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # your application can no longer respond to the Real-Time Decision.
        timeout_at:,
        # A constant representing the object's type. For this resource it will always be
        # `real_time_decision`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            card_authentication:
              T.nilable(Increase::RealTimeDecision::CardAuthentication),
            card_authentication_challenge:
              T.nilable(
                Increase::RealTimeDecision::CardAuthenticationChallenge
              ),
            card_authorization:
              T.nilable(Increase::RealTimeDecision::CardAuthorization),
            category: Increase::RealTimeDecision::Category::TaggedSymbol,
            created_at: Time,
            digital_wallet_authentication:
              T.nilable(
                Increase::RealTimeDecision::DigitalWalletAuthentication
              ),
            digital_wallet_token:
              T.nilable(Increase::RealTimeDecision::DigitalWalletToken),
            status: Increase::RealTimeDecision::Status::TaggedSymbol,
            timeout_at: Time,
            type: Increase::RealTimeDecision::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class CardAuthentication < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::CardAuthentication,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account the card belongs to.
        sig { returns(String) }
        attr_accessor :account_id

        # The identifier of the Card that is being tokenized.
        sig { returns(String) }
        attr_accessor :card_id

        # Whether or not the authentication attempt was approved.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
            )
          )
        end
        attr_accessor :decision

        # The identifier of the Card Payment this authentication attempt will belong to.
        # Available in the API once the card authentication has completed.
        sig { returns(String) }
        attr_accessor :upcoming_card_payment_id

        # Fields related to a 3DS authentication attempt.
        sig do
          params(
            account_id: String,
            card_id: String,
            decision:
              T.nilable(
                Increase::RealTimeDecision::CardAuthentication::Decision::OrSymbol
              ),
            upcoming_card_payment_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account the card belongs to.
          account_id:,
          # The identifier of the Card that is being tokenized.
          card_id:,
          # Whether or not the authentication attempt was approved.
          decision:,
          # The identifier of the Card Payment this authentication attempt will belong to.
          # Available in the API once the card authentication has completed.
          upcoming_card_payment_id:
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              card_id: String,
              decision:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
                ),
              upcoming_card_payment_id: String
            }
          )
        end
        def to_hash
        end

        # Whether or not the authentication attempt was approved.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthentication::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the authentication attempt without triggering a challenge.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
            )

          # Request further validation before approving the authentication attempt.
          CHALLENGE =
            T.let(
              :challenge,
              Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
            )

          # Deny the authentication attempt.
          DENY =
            T.let(
              :deny,
              Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
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
              Increase::RealTimeDecision::CardAuthenticationChallenge,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account the card belongs to.
        sig { returns(String) }
        attr_accessor :account_id

        # The identifier of the Card that is being tokenized.
        sig { returns(String) }
        attr_accessor :card_id

        # The identifier of the Card Payment this authentication challenge attempt belongs
        # to.
        sig { returns(String) }
        attr_accessor :card_payment_id

        # The one-time code delivered to the cardholder.
        sig { returns(String) }
        attr_accessor :one_time_code

        # Whether or not the challenge was delivered to the cardholder.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
            )
          )
        end
        attr_accessor :result

        # Fields related to a 3DS authentication attempt.
        sig do
          params(
            account_id: String,
            card_id: String,
            card_payment_id: String,
            one_time_code: String,
            result:
              T.nilable(
                Increase::RealTimeDecision::CardAuthenticationChallenge::Result::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account the card belongs to.
          account_id:,
          # The identifier of the Card that is being tokenized.
          card_id:,
          # The identifier of the Card Payment this authentication challenge attempt belongs
          # to.
          card_payment_id:,
          # The one-time code delivered to the cardholder.
          one_time_code:,
          # Whether or not the challenge was delivered to the cardholder.
          result:
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              card_id: String,
              card_payment_id: String,
              one_time_code: String,
              result:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
                )
            }
          )
        end
        def to_hash
        end

        # Whether or not the challenge was delivered to the cardholder.
        module Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthenticationChallenge::Result
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Your application successfully delivered the one-time code to the cardholder.
          SUCCESS =
            T.let(
              :success,
              Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
            )

          # Your application was unable to deliver the one-time code to the cardholder.
          FAILURE =
            T.let(
              :failure,
              Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
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
              Increase::RealTimeDecision::CardAuthorization,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account the authorization will debit.
        sig { returns(String) }
        attr_accessor :account_id

        # The identifier of the Card that is being authorized.
        sig { returns(String) }
        attr_accessor :card_id

        # Whether or not the authorization was approved.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
            )
          )
        end
        attr_accessor :decision

        # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
        # purchase), the identifier of the token that was used.
        sig { returns(T.nilable(String)) }
        attr_accessor :digital_wallet_token_id

        # The direction describes the direction the funds will move, either from the
        # cardholder to the merchant or from the merchant to the cardholder.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol
          )
        end
        attr_accessor :direction

        # The merchant identifier (commonly abbreviated as MID) of the merchant the card
        # is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_acceptor_id

        # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        # card is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_category_code

        # The city the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_city

        # The country the merchant resides in.
        sig { returns(String) }
        attr_accessor :merchant_country

        # The merchant descriptor of the merchant the card is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_descriptor

        # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
        # ZIP code, where the first 5 and last 4 are separated by a dash.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_postal_code

        # The state the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_state

        # Fields specific to the `network`.
        sig do
          returns(Increase::RealTimeDecision::CardAuthorization::NetworkDetails)
        end
        attr_reader :network_details

        sig do
          params(
            network_details:
              Increase::RealTimeDecision::CardAuthorization::NetworkDetails::OrHash
          ).void
        end
        attr_writer :network_details

        # Network-specific identifiers for a specific request or transaction.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers
          )
        end
        attr_reader :network_identifiers

        sig do
          params(
            network_identifiers:
              Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers::OrHash
          ).void
        end
        attr_writer :network_identifiers

        # The risk score generated by the card network. For Visa this is the Visa Advanced
        # Authorization risk score, from 0 to 99, where 99 is the riskiest.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :network_risk_score

        # If the authorization was made in-person with a physical card, the Physical Card
        # that was used.
        sig { returns(T.nilable(String)) }
        attr_accessor :physical_card_id

        # The amount of the attempted authorization in the currency the card user sees at
        # the time of purchase, in the minor unit of that currency. For dollars, for
        # example, this is cents.
        sig { returns(Integer) }
        attr_accessor :presentment_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
        # user sees at the time of purchase.
        sig { returns(String) }
        attr_accessor :presentment_currency

        # The processing category describes the intent behind the authorization, such as
        # whether it was used for bill payments or an automatic fuel dispenser.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
          )
        end
        attr_accessor :processing_category

        # Fields specific to the type of request, such as an incremental authorization.
        sig do
          returns(Increase::RealTimeDecision::CardAuthorization::RequestDetails)
        end
        attr_reader :request_details

        sig do
          params(
            request_details:
              Increase::RealTimeDecision::CardAuthorization::RequestDetails::OrHash
          ).void
        end
        attr_writer :request_details

        # The amount of the attempted authorization in the currency it will be settled in.
        # This currency is the same as that of the Account the card belongs to.
        sig { returns(Integer) }
        attr_accessor :settlement_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
        # transaction will be settled in.
        sig { returns(String) }
        attr_accessor :settlement_currency

        # The terminal identifier (commonly abbreviated as TID) of the terminal the card
        # is transacting with.
        sig { returns(T.nilable(String)) }
        attr_accessor :terminal_id

        # The identifier of the Card Payment this authorization will belong to. Available
        # in the API once the card authorization has completed.
        sig { returns(String) }
        attr_accessor :upcoming_card_payment_id

        # Fields related to verification of cardholder-provided values.
        sig do
          returns(Increase::RealTimeDecision::CardAuthorization::Verification)
        end
        attr_reader :verification

        sig do
          params(
            verification:
              Increase::RealTimeDecision::CardAuthorization::Verification::OrHash
          ).void
        end
        attr_writer :verification

        # Fields related to a card authorization.
        sig do
          params(
            account_id: String,
            card_id: String,
            decision:
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::Decision::OrSymbol
              ),
            digital_wallet_token_id: T.nilable(String),
            direction:
              Increase::RealTimeDecision::CardAuthorization::Direction::OrSymbol,
            merchant_acceptor_id: String,
            merchant_category_code: String,
            merchant_city: T.nilable(String),
            merchant_country: String,
            merchant_descriptor: String,
            merchant_postal_code: T.nilable(String),
            merchant_state: T.nilable(String),
            network_details:
              Increase::RealTimeDecision::CardAuthorization::NetworkDetails::OrHash,
            network_identifiers:
              Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers::OrHash,
            network_risk_score: T.nilable(Integer),
            physical_card_id: T.nilable(String),
            presentment_amount: Integer,
            presentment_currency: String,
            processing_category:
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::OrSymbol,
            request_details:
              Increase::RealTimeDecision::CardAuthorization::RequestDetails::OrHash,
            settlement_amount: Integer,
            settlement_currency: String,
            terminal_id: T.nilable(String),
            upcoming_card_payment_id: String,
            verification:
              Increase::RealTimeDecision::CardAuthorization::Verification::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account the authorization will debit.
          account_id:,
          # The identifier of the Card that is being authorized.
          card_id:,
          # Whether or not the authorization was approved.
          decision:,
          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          digital_wallet_token_id:,
          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          direction:,
          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          merchant_acceptor_id:,
          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          merchant_category_code:,
          # The city the merchant resides in.
          merchant_city:,
          # The country the merchant resides in.
          merchant_country:,
          # The merchant descriptor of the merchant the card is transacting with.
          merchant_descriptor:,
          # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          # ZIP code, where the first 5 and last 4 are separated by a dash.
          merchant_postal_code:,
          # The state the merchant resides in.
          merchant_state:,
          # Fields specific to the `network`.
          network_details:,
          # Network-specific identifiers for a specific request or transaction.
          network_identifiers:,
          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest.
          network_risk_score:,
          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          physical_card_id:,
          # The amount of the attempted authorization in the currency the card user sees at
          # the time of purchase, in the minor unit of that currency. For dollars, for
          # example, this is cents.
          presentment_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
          # user sees at the time of purchase.
          presentment_currency:,
          # The processing category describes the intent behind the authorization, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          processing_category:,
          # Fields specific to the type of request, such as an incremental authorization.
          request_details:,
          # The amount of the attempted authorization in the currency it will be settled in.
          # This currency is the same as that of the Account the card belongs to.
          settlement_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
          # transaction will be settled in.
          settlement_currency:,
          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          terminal_id:,
          # The identifier of the Card Payment this authorization will belong to. Available
          # in the API once the card authorization has completed.
          upcoming_card_payment_id:,
          # Fields related to verification of cardholder-provided values.
          verification:
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              card_id: String,
              decision:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
                ),
              digital_wallet_token_id: T.nilable(String),
              direction:
                Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails,
              network_identifiers:
                Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers,
              network_risk_score: T.nilable(Integer),
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category:
                Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol,
              request_details:
                Increase::RealTimeDecision::CardAuthorization::RequestDetails,
              settlement_amount: Integer,
              settlement_currency: String,
              terminal_id: T.nilable(String),
              upcoming_card_payment_id: String,
              verification:
                Increase::RealTimeDecision::CardAuthorization::Verification
            }
          )
        end
        def to_hash
        end

        # Whether or not the authorization was approved.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthorization::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the authorization.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
            )

          # Decline the authorization.
          DECLINE =
            T.let(
              :decline,
              Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The direction describes the direction the funds will move, either from the
        # cardholder to the merchant or from the merchant to the cardholder.
        module Direction
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthorization::Direction
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A regular card authorization where funds are debited from the cardholder.
          SETTLEMENT =
            T.let(
              :settlement,
              Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol
            )

          # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
          REFUND =
            T.let(
              :refund,
              Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class NetworkDetails < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails,
                Increase::Internal::AnyHash
              )
            end

          # The payment network used to process this card authorization.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # Fields specific to the `visa` network.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa
              )
            )
          end
          attr_reader :visa

          sig do
            params(
              visa:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::OrHash
                )
            ).void
          end
          attr_writer :visa

          # Fields specific to the `network`.
          sig do
            params(
              category:
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::OrSymbol,
              visa:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The payment network used to process this card authorization.
            category:,
            # Fields specific to the `visa` network.
            visa:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol,
                visa:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa
                  )
              }
            )
          end
          def to_hash
          end

          # The payment network used to process this card authorization.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Visa < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa,
                  Increase::Internal::AnyHash
                )
              end

            # For electronic commerce transactions, this identifies the level of security used
            # in obtaining the customer's payment credential. For mail or telephone order
            # transactions, identifies the type of mail or telephone order.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )
              )
            end
            attr_accessor :electronic_commerce_indicator

            # The method used to enter the cardholder's primary account number and card
            # expiration date.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )
              )
            end
            attr_accessor :point_of_service_entry_mode

            # Only present when `actioner: network`. Describes why a card authorization was
            # approved or declined by Visa through stand-in processing.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )
              )
            end
            attr_accessor :stand_in_processing_reason

            # Fields specific to the `visa` network.
            sig do
              params(
                electronic_commerce_indicator:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                  ),
                point_of_service_entry_mode:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                  ),
                stand_in_processing_reason:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              electronic_commerce_indicator:,
              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              point_of_service_entry_mode:,
              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              stand_in_processing_reason:
            )
            end

            sig do
              override.returns(
                {
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                    )
                }
              )
            end
            def to_hash
            end

            # For electronic commerce transactions, this identifies the level of security used
            # in obtaining the customer's payment credential. For mail or telephone order
            # transactions, identifies the type of mail or telephone order.
            module ElectronicCommerceIndicator
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
              MAIL_PHONE_ORDER =
                T.let(
                  :mail_phone_order,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
              RECURRING =
                T.let(
                  :recurring,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
              INSTALLMENT =
                T.let(
                  :installment,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
              UNKNOWN_MAIL_PHONE_ORDER =
                T.let(
                  :unknown_mail_phone_order,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
              SECURE_ELECTRONIC_COMMERCE =
                T.let(
                  :secure_electronic_commerce,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
              NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                T.let(
                  :non_authenticated_security_transaction_at_3ds_capable_merchant,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however , cardholder authentication is not performed using 3-D Secure.
              NON_AUTHENTICATED_SECURITY_TRANSACTION =
                T.let(
                  :non_authenticated_security_transaction,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
              NON_SECURE_TRANSACTION =
                T.let(
                  :non_secure_transaction,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # The method used to enter the cardholder's primary account number and card
            # expiration date.
            module PointOfServiceEntryMode
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Unknown
              UNKNOWN =
                T.let(
                  :unknown,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Manual key entry
              MANUAL =
                T.let(
                  :manual,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Magnetic stripe read, without card verification value
              MAGNETIC_STRIPE_NO_CVV =
                T.let(
                  :magnetic_stripe_no_cvv,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Optical code
              OPTICAL_CODE =
                T.let(
                  :optical_code,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contact chip card
              INTEGRATED_CIRCUIT_CARD =
                T.let(
                  :integrated_circuit_card,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contactless read of chip card
              CONTACTLESS =
                T.let(
                  :contactless,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Transaction initiated using a credential that has previously been stored on file
              CREDENTIAL_ON_FILE =
                T.let(
                  :credential_on_file,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Magnetic stripe read
              MAGNETIC_STRIPE =
                T.let(
                  :magnetic_stripe,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contactless read of magnetic stripe data
              CONTACTLESS_MAGNETIC_STRIPE =
                T.let(
                  :contactless_magnetic_stripe,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contact chip card, without card verification value
              INTEGRATED_CIRCUIT_CARD_NO_CVV =
                T.let(
                  :integrated_circuit_card_no_cvv,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Only present when `actioner: network`. Describes why a card authorization was
            # approved or declined by Visa through stand-in processing.
            module StandInProcessingReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Increase failed to process the authorization in a timely manner.
              ISSUER_ERROR =
                T.let(
                  :issuer_error,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
              INVALID_PHYSICAL_CARD =
                T.let(
                  :invalid_physical_card,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The 3DS cardholder authentication verification value was invalid.
              INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                T.let(
                  :invalid_cardholder_authentication_verification_value,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
              INTERNAL_VISA_ERROR =
                T.let(
                  :internal_visa_error,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
              MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                T.let(
                  :merchant_transaction_advisory_service_authentication_required,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
              PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                T.let(
                  :payment_fraud_disruption_acquirer_block,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # An unspecific reason for stand-in processing.
              OTHER =
                T.let(
                  :other,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class NetworkIdentifiers < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers,
                Increase::Internal::AnyHash
              )
            end

          # A life-cycle identifier used across e.g., an authorization and a reversal.
          # Expected to be unique per acquirer within a window of time. For some card
          # networks the retrieval reference number includes the trace counter.
          sig { returns(T.nilable(String)) }
          attr_accessor :retrieval_reference_number

          # A counter used to verify an individual authorization. Expected to be unique per
          # acquirer within a window of time.
          sig { returns(T.nilable(String)) }
          attr_accessor :trace_number

          # A globally unique transaction identifier provided by the card network, used
          # across multiple life-cycle requests.
          sig { returns(T.nilable(String)) }
          attr_accessor :transaction_id

          # Network-specific identifiers for a specific request or transaction.
          sig do
            params(
              retrieval_reference_number: T.nilable(String),
              trace_number: T.nilable(String),
              transaction_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # A life-cycle identifier used across e.g., an authorization and a reversal.
            # Expected to be unique per acquirer within a window of time. For some card
            # networks the retrieval reference number includes the trace counter.
            retrieval_reference_number:,
            # A counter used to verify an individual authorization. Expected to be unique per
            # acquirer within a window of time.
            trace_number:,
            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            transaction_id:
          )
          end

          sig do
            override.returns(
              {
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        # The processing category describes the intent behind the authorization, such as
        # whether it was used for bill payments or an automatic fuel dispenser.
        module ProcessingCategory
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthorization::ProcessingCategory
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
          ACCOUNT_FUNDING =
            T.let(
              :account_funding,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
          AUTOMATIC_FUEL_DISPENSER =
            T.let(
              :automatic_fuel_dispenser,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # A transaction used to pay a bill.
          BILL_PAYMENT =
            T.let(
              :bill_payment,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # A regular purchase.
          PURCHASE =
            T.let(
              :purchase,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # Quasi-cash transactions represent purchases of items which may be convertible to cash.
          QUASI_CASH =
            T.let(
              :quasi_cash,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
          REFUND =
            T.let(
              :refund,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class RequestDetails < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::RequestDetails,
                Increase::Internal::AnyHash
              )
            end

          # The type of this request (e.g., an initial authorization or an incremental
          # authorization).
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # Fields specific to the category `incremental_authorization`.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization
              )
            )
          end
          attr_reader :incremental_authorization

          sig do
            params(
              incremental_authorization:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization::OrHash
                )
            ).void
          end
          attr_writer :incremental_authorization

          # Fields specific to the category `initial_authorization`.
          sig { returns(T.nilable(T.anything)) }
          attr_accessor :initial_authorization

          # Fields specific to the type of request, such as an incremental authorization.
          sig do
            params(
              category:
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::OrSymbol,
              incremental_authorization:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization::OrHash
                ),
              initial_authorization: T.nilable(T.anything)
            ).returns(T.attached_class)
          end
          def self.new(
            # The type of this request (e.g., an initial authorization or an incremental
            # authorization).
            category:,
            # Fields specific to the category `incremental_authorization`.
            incremental_authorization:,
            # Fields specific to the category `initial_authorization`.
            initial_authorization:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol,
                incremental_authorization:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization
                  ),
                initial_authorization: T.nilable(T.anything)
              }
            )
          end
          def to_hash
          end

          # The type of this request (e.g., an initial authorization or an incremental
          # authorization).
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A regular, standalone authorization.
            INITIAL_AUTHORIZATION =
              T.let(
                :initial_authorization,
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol
              )

            # An incremental request to increase the amount of an existing authorization.
            INCREMENTAL_AUTHORIZATION =
              T.let(
                :incremental_authorization,
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class IncrementalAuthorization < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization,
                  Increase::Internal::AnyHash
                )
              end

            # The card payment for this authorization and increment.
            sig { returns(String) }
            attr_accessor :card_payment_id

            # The identifier of the card authorization this request is attempting to
            # increment.
            sig { returns(String) }
            attr_accessor :original_card_authorization_id

            # Fields specific to the category `incremental_authorization`.
            sig do
              params(
                card_payment_id: String,
                original_card_authorization_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The card payment for this authorization and increment.
              card_payment_id:,
              # The identifier of the card authorization this request is attempting to
              # increment.
              original_card_authorization_id:
            )
            end

            sig do
              override.returns(
                {
                  card_payment_id: String,
                  original_card_authorization_id: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class Verification < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::Verification,
                Increase::Internal::AnyHash
              )
            end

          # Fields related to verification of the Card Verification Code, a 3-digit code on
          # the back of the card.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode
            )
          end
          attr_reader :card_verification_code

          sig do
            params(
              card_verification_code:
                Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::OrHash
            ).void
          end
          attr_writer :card_verification_code

          # Cardholder address provided in the authorization request and the address on file
          # we verified it against.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress
            )
          end
          attr_reader :cardholder_address

          sig do
            params(
              cardholder_address:
                Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::OrHash
            ).void
          end
          attr_writer :cardholder_address

          # Fields related to verification of cardholder-provided values.
          sig do
            params(
              card_verification_code:
                Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::OrHash,
              cardholder_address:
                Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            card_verification_code:,
            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            cardholder_address:
          )
          end

          sig do
            override.returns(
              {
                card_verification_code:
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode,
                cardholder_address:
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress
              }
            )
          end
          def to_hash
          end

          class CardVerificationCode < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode,
                  Increase::Internal::AnyHash
                )
              end

            # The result of verifying the Card Verification Code.
            sig do
              returns(
                Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
              )
            end
            attr_accessor :result

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              params(
                result:
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The result of verifying the Card Verification Code.
              result:
            )
            end

            sig do
              override.returns(
                {
                  result:
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The result of verifying the Card Verification Code.
            module Result
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # No card verification code was provided in the authorization request.
              NOT_CHECKED =
                T.let(
                  :not_checked,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              # The card verification code matched the one on file.
              MATCH =
                T.let(
                  :match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              # The card verification code did not match the one on file.
              NO_MATCH =
                T.let(
                  :no_match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class CardholderAddress < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress,
                  Increase::Internal::AnyHash
                )
              end

            # Line 1 of the address on file for the cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :actual_line1

            # The postal code of the address on file for the cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :actual_postal_code

            # The cardholder address line 1 provided for verification in the authorization
            # request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_line1

            # The postal code provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_postal_code

            # The address verification result returned to the card network.
            sig do
              returns(
                Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
              )
            end
            attr_accessor :result

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              params(
                actual_line1: T.nilable(String),
                actual_postal_code: T.nilable(String),
                provided_line1: T.nilable(String),
                provided_postal_code: T.nilable(String),
                result:
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Line 1 of the address on file for the cardholder.
              actual_line1:,
              # The postal code of the address on file for the cardholder.
              actual_postal_code:,
              # The cardholder address line 1 provided for verification in the authorization
              # request.
              provided_line1:,
              # The postal code provided for verification in the authorization request.
              provided_postal_code:,
              # The address verification result returned to the card network.
              result:
            )
            end

            sig do
              override.returns(
                {
                  actual_line1: T.nilable(String),
                  actual_postal_code: T.nilable(String),
                  provided_line1: T.nilable(String),
                  provided_postal_code: T.nilable(String),
                  result:
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The address verification result returned to the card network.
            module Result
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # No address was provided in the authorization request.
              NOT_CHECKED =
                T.let(
                  :not_checked,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code matches, but the street address was not verified.
              POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                T.let(
                  :postal_code_match_address_not_checked,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code matches, but the street address does not match.
              POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                T.let(
                  :postal_code_match_address_no_match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code does not match, but the street address matches.
              POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                T.let(
                  :postal_code_no_match_address_match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code and street address match.
              MATCH =
                T.let(
                  :match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code and street address do not match.
              NO_MATCH =
                T.let(
                  :no_match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end

      # The category of the Real-Time Decision.
      module Category
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::RealTimeDecision::Category) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A card is being authorized.
        CARD_AUTHORIZATION_REQUESTED =
          T.let(
            :card_authorization_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # 3DS authentication is requested.
        CARD_AUTHENTICATION_REQUESTED =
          T.let(
            :card_authentication_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # 3DS authentication challenge requires cardholder involvement.
        CARD_AUTHENTICATION_CHALLENGE_REQUESTED =
          T.let(
            :card_authentication_challenge_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # A card is being loaded into a digital wallet.
        DIGITAL_WALLET_TOKEN_REQUESTED =
          T.let(
            :digital_wallet_token_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # A card is being loaded into a digital wallet and requires cardholder authentication.
        DIGITAL_WALLET_AUTHENTICATION_REQUESTED =
          T.let(
            :digital_wallet_authentication_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::RealTimeDecision::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class DigitalWalletAuthentication < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::DigitalWalletAuthentication,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Card that is being tokenized.
        sig { returns(String) }
        attr_accessor :card_id

        # The channel to send the card user their one-time passcode.
        sig do
          returns(
            Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol
          )
        end
        attr_accessor :channel

        # The digital wallet app being used.
        sig do
          returns(
            Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
          )
        end
        attr_accessor :digital_wallet

        # The email to send the one-time passcode to if `channel` is equal to `email`.
        sig { returns(T.nilable(String)) }
        attr_accessor :email

        # The one-time passcode to send the card user.
        sig { returns(String) }
        attr_accessor :one_time_passcode

        # The phone number to send the one-time passcode to if `channel` is equal to
        # `sms`.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone

        # Whether your application successfully delivered the one-time passcode.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
            )
          )
        end
        attr_accessor :result

        # Fields related to a digital wallet authentication attempt.
        sig do
          params(
            card_id: String,
            channel:
              Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::OrSymbol,
            digital_wallet:
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::OrSymbol,
            email: T.nilable(String),
            one_time_passcode: String,
            phone: T.nilable(String),
            result:
              T.nilable(
                Increase::RealTimeDecision::DigitalWalletAuthentication::Result::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Card that is being tokenized.
          card_id:,
          # The channel to send the card user their one-time passcode.
          channel:,
          # The digital wallet app being used.
          digital_wallet:,
          # The email to send the one-time passcode to if `channel` is equal to `email`.
          email:,
          # The one-time passcode to send the card user.
          one_time_passcode:,
          # The phone number to send the one-time passcode to if `channel` is equal to
          # `sms`.
          phone:,
          # Whether your application successfully delivered the one-time passcode.
          result:
        )
        end

        sig do
          override.returns(
            {
              card_id: String,
              channel:
                Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol,
              digital_wallet:
                Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol,
              email: T.nilable(String),
              one_time_passcode: String,
              phone: T.nilable(String),
              result:
                T.nilable(
                  Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
                )
            }
          )
        end
        def to_hash
        end

        # The channel to send the card user their one-time passcode.
        module Channel
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletAuthentication::Channel
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Send one-time passcodes over SMS.
          SMS =
            T.let(
              :sms,
              Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol
            )

          # Send one-time passcodes over email.
          EMAIL =
            T.let(
              :email,
              Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The digital wallet app being used.
        module DigitalWallet
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Apple Pay
          APPLE_PAY =
            T.let(
              :apple_pay,
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
            )

          # Google Pay
          GOOGLE_PAY =
            T.let(
              :google_pay,
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
            )

          # Samsung Pay
          SAMSUNG_PAY =
            T.let(
              :samsung_pay,
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
            )

          # Unknown
          UNKNOWN =
            T.let(
              :unknown,
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Whether your application successfully delivered the one-time passcode.
        module Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletAuthentication::Result
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Your application successfully delivered the one-time passcode to the cardholder.
          SUCCESS =
            T.let(
              :success,
              Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
            )

          # Your application failed to deliver the one-time passcode to the cardholder.
          FAILURE =
            T.let(
              :failure,
              Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class DigitalWalletToken < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::DigitalWalletToken,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Card that is being tokenized.
        sig { returns(String) }
        attr_accessor :card_id

        # The identifier of the Card Profile that was set via the real time decision. This
        # will be null until the real time decision is responded to or if the real time
        # decision did not set a card profile.
        sig { returns(T.nilable(String)) }
        attr_accessor :card_profile_id

        # Whether or not the provisioning request was approved. This will be null until
        # the real time decision is responded to.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
            )
          )
        end
        attr_accessor :decision

        # Device that is being used to provision the digital wallet token.
        sig { returns(Increase::RealTimeDecision::DigitalWalletToken::Device) }
        attr_reader :device

        sig do
          params(
            device:
              Increase::RealTimeDecision::DigitalWalletToken::Device::OrHash
          ).void
        end
        attr_writer :device

        # The digital wallet app being used.
        sig do
          returns(
            Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
          )
        end
        attr_accessor :digital_wallet

        # Fields related to a digital wallet token provisioning attempt.
        sig do
          params(
            card_id: String,
            card_profile_id: T.nilable(String),
            decision:
              T.nilable(
                Increase::RealTimeDecision::DigitalWalletToken::Decision::OrSymbol
              ),
            device:
              Increase::RealTimeDecision::DigitalWalletToken::Device::OrHash,
            digital_wallet:
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Card that is being tokenized.
          card_id:,
          # The identifier of the Card Profile that was set via the real time decision. This
          # will be null until the real time decision is responded to or if the real time
          # decision did not set a card profile.
          card_profile_id:,
          # Whether or not the provisioning request was approved. This will be null until
          # the real time decision is responded to.
          decision:,
          # Device that is being used to provision the digital wallet token.
          device:,
          # The digital wallet app being used.
          digital_wallet:
        )
        end

        sig do
          override.returns(
            {
              card_id: String,
              card_profile_id: T.nilable(String),
              decision:
                T.nilable(
                  Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
                ),
              device: Increase::RealTimeDecision::DigitalWalletToken::Device,
              digital_wallet:
                Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether or not the provisioning request was approved. This will be null until
        # the real time decision is responded to.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletToken::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the provisioning request.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
            )

          # Decline the provisioning request.
          DECLINE =
            T.let(
              :decline,
              Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Device < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::DigitalWalletToken::Device,
                Increase::Internal::AnyHash
              )
            end

          # ID assigned to the device by the digital wallet provider.
          sig { returns(T.nilable(String)) }
          attr_accessor :identifier

          # Device that is being used to provision the digital wallet token.
          sig do
            params(identifier: T.nilable(String)).returns(T.attached_class)
          end
          def self.new(
            # ID assigned to the device by the digital wallet provider.
            identifier:
          )
          end

          sig { override.returns({ identifier: T.nilable(String) }) }
          def to_hash
          end
        end

        # The digital wallet app being used.
        module DigitalWallet
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Apple Pay
          APPLE_PAY =
            T.let(
              :apple_pay,
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            )

          # Google Pay
          GOOGLE_PAY =
            T.let(
              :google_pay,
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            )

          # Samsung Pay
          SAMSUNG_PAY =
            T.let(
              :samsung_pay,
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            )

          # Unknown
          UNKNOWN =
            T.let(
              :unknown,
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The status of the Real-Time Decision.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::RealTimeDecision::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The decision is pending action via real-time webhook.
        PENDING =
          T.let(:pending, Increase::RealTimeDecision::Status::TaggedSymbol)

        # Your webhook actioned the real-time decision.
        RESPONDED =
          T.let(:responded, Increase::RealTimeDecision::Status::TaggedSymbol)

        # Your webhook failed to respond to the authorization in time.
        TIMED_OUT =
          T.let(:timed_out, Increase::RealTimeDecision::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::RealTimeDecision::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `real_time_decision`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::RealTimeDecision::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REAL_TIME_DECISION =
          T.let(
            :real_time_decision,
            Increase::RealTimeDecision::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::RealTimeDecision::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
