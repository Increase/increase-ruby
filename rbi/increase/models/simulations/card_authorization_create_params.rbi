# typed: strong

module Increase
  module Models
    module Simulations
      class CardAuthorizationCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardAuthorizationCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The authorization amount in cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # The identifier of a Card Payment with a `card_authentication` if you want to
        # simulate an authenticated authorization.
        sig { returns(T.nilable(String)) }
        attr_reader :authenticated_card_payment_id

        sig { params(authenticated_card_payment_id: String).void }
        attr_writer :authenticated_card_payment_id

        # The identifier of the Card to be authorized.
        sig { returns(T.nilable(String)) }
        attr_reader :card_id

        sig { params(card_id: String).void }
        attr_writer :card_id

        # Forces a card decline with a specific reason. No real time decision will be
        # sent.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::OrSymbol
            )
          )
        end
        attr_reader :decline_reason

        sig do
          params(
            decline_reason:
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::OrSymbol
          ).void
        end
        attr_writer :decline_reason

        # The identifier of the Digital Wallet Token to be authorized.
        sig { returns(T.nilable(String)) }
        attr_reader :digital_wallet_token_id

        sig { params(digital_wallet_token_id: String).void }
        attr_writer :digital_wallet_token_id

        # The direction describes the direction the funds will move, either from the
        # cardholder to the merchant or from the merchant to the cardholder.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::CardAuthorizationCreateParams::Direction::OrSymbol
            )
          )
        end
        attr_reader :direction

        sig do
          params(
            direction:
              Increase::Simulations::CardAuthorizationCreateParams::Direction::OrSymbol
          ).void
        end
        attr_writer :direction

        # The identifier of the Event Subscription to use. If provided, will override the
        # default real time event subscription. Because you can only create one real time
        # decision event subscription, you can use this field to route events to any
        # specified event subscription for testing purposes.
        sig { returns(T.nilable(String)) }
        attr_reader :event_subscription_id

        sig { params(event_subscription_id: String).void }
        attr_writer :event_subscription_id

        # The merchant identifier (commonly abbreviated as MID) of the merchant the card
        # is transacting with.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_acceptor_id

        sig { params(merchant_acceptor_id: String).void }
        attr_writer :merchant_acceptor_id

        # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        # card is transacting with.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_category_code

        sig { params(merchant_category_code: String).void }
        attr_writer :merchant_category_code

        # The city the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_city

        sig { params(merchant_city: String).void }
        attr_writer :merchant_city

        # The country the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_country

        sig { params(merchant_country: String).void }
        attr_writer :merchant_country

        # The merchant descriptor of the merchant the card is transacting with.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_descriptor

        sig { params(merchant_descriptor: String).void }
        attr_writer :merchant_descriptor

        # The state the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_reader :merchant_state

        sig { params(merchant_state: String).void }
        attr_writer :merchant_state

        # Fields specific to a given card network.
        sig do
          returns(
            T.nilable(
              Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails
            )
          )
        end
        attr_reader :network_details

        sig do
          params(
            network_details:
              Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::OrHash
          ).void
        end
        attr_writer :network_details

        # The risk score generated by the card network. For Visa this is the Visa Advanced
        # Authorization risk score, from 0 to 99, where 99 is the riskiest.
        sig { returns(T.nilable(Integer)) }
        attr_reader :network_risk_score

        sig { params(network_risk_score: Integer).void }
        attr_writer :network_risk_score

        # The identifier of the Physical Card to be authorized.
        sig { returns(T.nilable(String)) }
        attr_reader :physical_card_id

        sig { params(physical_card_id: String).void }
        attr_writer :physical_card_id

        # The terminal identifier (commonly abbreviated as TID) of the terminal the card
        # is transacting with.
        sig { returns(T.nilable(String)) }
        attr_reader :terminal_id

        sig { params(terminal_id: String).void }
        attr_writer :terminal_id

        sig do
          params(
            amount: Integer,
            authenticated_card_payment_id: String,
            card_id: String,
            decline_reason:
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::OrSymbol,
            digital_wallet_token_id: String,
            direction:
              Increase::Simulations::CardAuthorizationCreateParams::Direction::OrSymbol,
            event_subscription_id: String,
            merchant_acceptor_id: String,
            merchant_category_code: String,
            merchant_city: String,
            merchant_country: String,
            merchant_descriptor: String,
            merchant_state: String,
            network_details:
              Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::OrHash,
            network_risk_score: Integer,
            physical_card_id: String,
            terminal_id: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The authorization amount in cents.
          amount:,
          # The identifier of a Card Payment with a `card_authentication` if you want to
          # simulate an authenticated authorization.
          authenticated_card_payment_id: nil,
          # The identifier of the Card to be authorized.
          card_id: nil,
          # Forces a card decline with a specific reason. No real time decision will be
          # sent.
          decline_reason: nil,
          # The identifier of the Digital Wallet Token to be authorized.
          digital_wallet_token_id: nil,
          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          direction: nil,
          # The identifier of the Event Subscription to use. If provided, will override the
          # default real time event subscription. Because you can only create one real time
          # decision event subscription, you can use this field to route events to any
          # specified event subscription for testing purposes.
          event_subscription_id: nil,
          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          merchant_acceptor_id: nil,
          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          merchant_category_code: nil,
          # The city the merchant resides in.
          merchant_city: nil,
          # The country the merchant resides in.
          merchant_country: nil,
          # The merchant descriptor of the merchant the card is transacting with.
          merchant_descriptor: nil,
          # The state the merchant resides in.
          merchant_state: nil,
          # Fields specific to a given card network.
          network_details: nil,
          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest.
          network_risk_score: nil,
          # The identifier of the Physical Card to be authorized.
          physical_card_id: nil,
          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          terminal_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              amount: Integer,
              authenticated_card_payment_id: String,
              card_id: String,
              decline_reason:
                Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::OrSymbol,
              digital_wallet_token_id: String,
              direction:
                Increase::Simulations::CardAuthorizationCreateParams::Direction::OrSymbol,
              event_subscription_id: String,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: String,
              merchant_country: String,
              merchant_descriptor: String,
              merchant_state: String,
              network_details:
                Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails,
              network_risk_score: Integer,
              physical_card_id: String,
              terminal_id: String,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Forces a card decline with a specific reason. No real time decision will be
        # sent.
        module DeclineReason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::Simulations::CardAuthorizationCreateParams::DeclineReason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The account has been closed.
          ACCOUNT_CLOSED =
            T.let(
              :account_closed,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The Card was not active.
          CARD_NOT_ACTIVE =
            T.let(
              :card_not_active,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The Card has been canceled.
          CARD_CANCELED =
            T.let(
              :card_canceled,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The Physical Card was not active.
          PHYSICAL_CARD_NOT_ACTIVE =
            T.let(
              :physical_card_not_active,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The account's entity was not active.
          ENTITY_NOT_ACTIVE =
            T.let(
              :entity_not_active,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The account was inactive.
          GROUP_LOCKED =
            T.let(
              :group_locked,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The Card's Account did not have a sufficient available balance.
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The given CVV2 did not match the card's value.
          CVV2_MISMATCH =
            T.let(
              :cvv2_mismatch,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The given PIN did not match the card's value.
          PIN_MISMATCH =
            T.let(
              :pin_mismatch,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The given expiration date did not match the card's value. Only applies when a CVV2 is present.
          CARD_EXPIRATION_MISMATCH =
            T.let(
              :card_expiration_mismatch,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The attempted card transaction is not allowed per Increase's terms.
          TRANSACTION_NOT_ALLOWED =
            T.let(
              :transaction_not_allowed,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The transaction was blocked by a Limit.
          BREACHES_LIMIT =
            T.let(
              :breaches_limit,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # Your application declined the transaction via webhook.
          WEBHOOK_DECLINED =
            T.let(
              :webhook_declined,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # Your application webhook did not respond without the required timeout.
          WEBHOOK_TIMED_OUT =
            T.let(
              :webhook_timed_out,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # Declined by stand-in processing.
          DECLINED_BY_STAND_IN_PROCESSING =
            T.let(
              :declined_by_stand_in_processing,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The card read had an invalid CVV, dCVV, or authorization request cryptogram.
          INVALID_PHYSICAL_CARD =
            T.let(
              :invalid_physical_card,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The original card authorization for this incremental authorization does not exist.
          MISSING_ORIGINAL_AUTHORIZATION =
            T.let(
              :missing_original_authorization,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The transaction was declined because the 3DS authentication failed.
          FAILED_3DS_AUTHENTICATION =
            T.let(
              :failed_3ds_authentication,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          # The transaction was suspected to be fraudulent. Please reach out to support@increase.com for more information.
          SUSPECTED_FRAUD =
            T.let(
              :suspected_fraud,
              Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::CardAuthorizationCreateParams::DeclineReason::TaggedSymbol
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
                Increase::Simulations::CardAuthorizationCreateParams::Direction
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A regular card authorization where funds are debited from the cardholder.
          SETTLEMENT =
            T.let(
              :settlement,
              Increase::Simulations::CardAuthorizationCreateParams::Direction::TaggedSymbol
            )

          # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
          REFUND =
            T.let(
              :refund,
              Increase::Simulations::CardAuthorizationCreateParams::Direction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Simulations::CardAuthorizationCreateParams::Direction::TaggedSymbol
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
                Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails,
                Increase::Internal::AnyHash
              )
            end

          # Fields specific to the Visa network.
          sig do
            returns(
              Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa
            )
          end
          attr_reader :visa

          sig do
            params(
              visa:
                Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::OrHash
            ).void
          end
          attr_writer :visa

          # Fields specific to a given card network.
          sig do
            params(
              visa:
                Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Fields specific to the Visa network.
            visa:
          )
          end

          sig do
            override.returns(
              {
                visa:
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa
              }
            )
          end
          def to_hash
          end

          class Visa < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa,
                  Increase::Internal::AnyHash
                )
              end

            # The reason code for the stand-in processing.
            sig do
              returns(
                T.nilable(
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
                )
              )
            end
            attr_reader :stand_in_processing_reason

            sig do
              params(
                stand_in_processing_reason:
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
              ).void
            end
            attr_writer :stand_in_processing_reason

            # Fields specific to the Visa network.
            sig do
              params(
                stand_in_processing_reason:
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The reason code for the stand-in processing.
              stand_in_processing_reason: nil
            )
            end

            sig do
              override.returns(
                {
                  stand_in_processing_reason:
                    Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
                }
              )
            end
            def to_hash
            end

            # The reason code for the stand-in processing.
            module StandInProcessingReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Increase failed to process the authorization in a timely manner.
              ISSUER_ERROR =
                T.let(
                  :issuer_error,
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
              INVALID_PHYSICAL_CARD =
                T.let(
                  :invalid_physical_card,
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The 3DS cardholder authentication verification value was invalid.
              INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                T.let(
                  :invalid_cardholder_authentication_verification_value,
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
              INTERNAL_VISA_ERROR =
                T.let(
                  :internal_visa_error,
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
              MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                T.let(
                  :merchant_transaction_advisory_service_authentication_required,
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
              PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                T.let(
                  :payment_fraud_disruption_acquirer_block,
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # An unspecific reason for stand-in processing.
              OTHER =
                T.let(
                  :other,
                  Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::Simulations::CardAuthorizationCreateParams::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
