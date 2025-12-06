# typed: strong

module Increase
  module Models
    class CardPayment < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardPayment, Increase::Internal::AnyHash)
        end

      # The Card Payment identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Account the Transaction belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # The Card identifier for this payment.
      sig { returns(String) }
      attr_accessor :card_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
      # Payment was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The Digital Wallet Token identifier for this payment.
      sig { returns(T.nilable(String)) }
      attr_accessor :digital_wallet_token_id

      # The interactions related to this card payment.
      sig { returns(T::Array[Increase::CardPayment::Element]) }
      attr_accessor :elements

      # The Physical Card identifier for this payment.
      sig { returns(T.nilable(String)) }
      attr_accessor :physical_card_id

      # The summarized state of this card payment.
      sig { returns(Increase::CardPayment::State) }
      attr_reader :state

      sig { params(state: Increase::CardPayment::State::OrHash).void }
      attr_writer :state

      # A constant representing the object's type. For this resource it will always be
      # `card_payment`.
      sig { returns(Increase::CardPayment::Type::TaggedSymbol) }
      attr_accessor :type

      # Card Payments group together interactions related to a single card payment, such
      # as an authorization and its corresponding settlement.
      sig do
        params(
          id: String,
          account_id: String,
          card_id: String,
          created_at: Time,
          digital_wallet_token_id: T.nilable(String),
          elements: T::Array[Increase::CardPayment::Element::OrHash],
          physical_card_id: T.nilable(String),
          state: Increase::CardPayment::State::OrHash,
          type: Increase::CardPayment::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Card Payment identifier.
        id:,
        # The identifier for the Account the Transaction belongs to.
        account_id:,
        # The Card identifier for this payment.
        card_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
        # Payment was created.
        created_at:,
        # The Digital Wallet Token identifier for this payment.
        digital_wallet_token_id:,
        # The interactions related to this card payment.
        elements:,
        # The Physical Card identifier for this payment.
        physical_card_id:,
        # The summarized state of this card payment.
        state:,
        # A constant representing the object's type. For this resource it will always be
        # `card_payment`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            card_id: String,
            created_at: Time,
            digital_wallet_token_id: T.nilable(String),
            elements: T::Array[Increase::CardPayment::Element],
            physical_card_id: T.nilable(String),
            state: Increase::CardPayment::State,
            type: Increase::CardPayment::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Element < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::CardPayment::Element, Increase::Internal::AnyHash)
          end

        # A Card Authentication object. This field will be present in the JSON response if
        # and only if `category` is equal to `card_authentication`. Card Authentications
        # are attempts to authenticate a transaction or a card with 3DS.
        sig do
          returns(T.nilable(Increase::CardPayment::Element::CardAuthentication))
        end
        attr_reader :card_authentication

        sig do
          params(
            card_authentication:
              T.nilable(
                Increase::CardPayment::Element::CardAuthentication::OrHash
              )
          ).void
        end
        attr_writer :card_authentication

        # A Card Authorization object. This field will be present in the JSON response if
        # and only if `category` is equal to `card_authorization`. Card Authorizations are
        # temporary holds placed on a customers funds with the intent to later clear a
        # transaction.
        sig do
          returns(T.nilable(Increase::CardPayment::Element::CardAuthorization))
        end
        attr_reader :card_authorization

        sig do
          params(
            card_authorization:
              T.nilable(
                Increase::CardPayment::Element::CardAuthorization::OrHash
              )
          ).void
        end
        attr_writer :card_authorization

        # A Card Authorization Expiration object. This field will be present in the JSON
        # response if and only if `category` is equal to `card_authorization_expiration`.
        # Card Authorization Expirations are cancellations of authorizations that were
        # never settled by the acquirer.
        sig do
          returns(
            T.nilable(
              Increase::CardPayment::Element::CardAuthorizationExpiration
            )
          )
        end
        attr_reader :card_authorization_expiration

        sig do
          params(
            card_authorization_expiration:
              T.nilable(
                Increase::CardPayment::Element::CardAuthorizationExpiration::OrHash
              )
          ).void
        end
        attr_writer :card_authorization_expiration

        # A Card Decline object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_decline`.
        sig { returns(T.nilable(Increase::CardPayment::Element::CardDecline)) }
        attr_reader :card_decline

        sig do
          params(
            card_decline:
              T.nilable(Increase::CardPayment::Element::CardDecline::OrHash)
          ).void
        end
        attr_writer :card_decline

        # A Card Financial object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_financial`. Card Financials are temporary
        # holds placed on a customers funds with the intent to later clear a transaction.
        sig do
          returns(T.nilable(Increase::CardPayment::Element::CardFinancial))
        end
        attr_reader :card_financial

        sig do
          params(
            card_financial:
              T.nilable(Increase::CardPayment::Element::CardFinancial::OrHash)
          ).void
        end
        attr_writer :card_financial

        # A Card Fuel Confirmation object. This field will be present in the JSON response
        # if and only if `category` is equal to `card_fuel_confirmation`. Card Fuel
        # Confirmations update the amount of a Card Authorization after a fuel pump
        # transaction is completed.
        sig do
          returns(
            T.nilable(Increase::CardPayment::Element::CardFuelConfirmation)
          )
        end
        attr_reader :card_fuel_confirmation

        sig do
          params(
            card_fuel_confirmation:
              T.nilable(
                Increase::CardPayment::Element::CardFuelConfirmation::OrHash
              )
          ).void
        end
        attr_writer :card_fuel_confirmation

        # A Card Increment object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_increment`. Card Increments increase the
        # pending amount of an authorized transaction.
        sig do
          returns(T.nilable(Increase::CardPayment::Element::CardIncrement))
        end
        attr_reader :card_increment

        sig do
          params(
            card_increment:
              T.nilable(Increase::CardPayment::Element::CardIncrement::OrHash)
          ).void
        end
        attr_writer :card_increment

        # A Card Refund object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_refund`. Card Refunds move money back to
        # the cardholder. While they are usually connected to a Card Settlement an
        # acquirer can also refund money directly to a card without relation to a
        # transaction.
        sig { returns(T.nilable(Increase::CardPayment::Element::CardRefund)) }
        attr_reader :card_refund

        sig do
          params(
            card_refund:
              T.nilable(Increase::CardPayment::Element::CardRefund::OrHash)
          ).void
        end
        attr_writer :card_refund

        # A Card Reversal object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_reversal`. Card Reversals cancel parts of
        # or the entirety of an existing Card Authorization.
        sig { returns(T.nilable(Increase::CardPayment::Element::CardReversal)) }
        attr_reader :card_reversal

        sig do
          params(
            card_reversal:
              T.nilable(Increase::CardPayment::Element::CardReversal::OrHash)
          ).void
        end
        attr_writer :card_reversal

        # A Card Settlement object. This field will be present in the JSON response if and
        # only if `category` is equal to `card_settlement`. Card Settlements are card
        # transactions that have cleared and settled. While a settlement is usually
        # preceded by an authorization, an acquirer can also directly clear a transaction
        # without first authorizing it.
        sig do
          returns(T.nilable(Increase::CardPayment::Element::CardSettlement))
        end
        attr_reader :card_settlement

        sig do
          params(
            card_settlement:
              T.nilable(Increase::CardPayment::Element::CardSettlement::OrHash)
          ).void
        end
        attr_writer :card_settlement

        # An Inbound Card Validation object. This field will be present in the JSON
        # response if and only if `category` is equal to `card_validation`. Inbound Card
        # Validations are requests from a merchant to verify that a card number and
        # optionally its address and/or Card Verification Value are valid.
        sig do
          returns(T.nilable(Increase::CardPayment::Element::CardValidation))
        end
        attr_reader :card_validation

        sig do
          params(
            card_validation:
              T.nilable(Increase::CardPayment::Element::CardValidation::OrHash)
          ).void
        end
        attr_writer :card_validation

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        sig { returns(Increase::CardPayment::Element::Category::TaggedSymbol) }
        attr_accessor :category

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the card payment element was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # If the category of this Transaction source is equal to `other`, this field will
        # contain an empty object, otherwise it will contain null.
        sig { returns(T.nilable(Increase::CardPayment::Element::Other)) }
        attr_reader :other

        sig do
          params(
            other: T.nilable(Increase::CardPayment::Element::Other::OrHash)
          ).void
        end
        attr_writer :other

        sig do
          params(
            card_authentication:
              T.nilable(
                Increase::CardPayment::Element::CardAuthentication::OrHash
              ),
            card_authorization:
              T.nilable(
                Increase::CardPayment::Element::CardAuthorization::OrHash
              ),
            card_authorization_expiration:
              T.nilable(
                Increase::CardPayment::Element::CardAuthorizationExpiration::OrHash
              ),
            card_decline:
              T.nilable(Increase::CardPayment::Element::CardDecline::OrHash),
            card_financial:
              T.nilable(Increase::CardPayment::Element::CardFinancial::OrHash),
            card_fuel_confirmation:
              T.nilable(
                Increase::CardPayment::Element::CardFuelConfirmation::OrHash
              ),
            card_increment:
              T.nilable(Increase::CardPayment::Element::CardIncrement::OrHash),
            card_refund:
              T.nilable(Increase::CardPayment::Element::CardRefund::OrHash),
            card_reversal:
              T.nilable(Increase::CardPayment::Element::CardReversal::OrHash),
            card_settlement:
              T.nilable(Increase::CardPayment::Element::CardSettlement::OrHash),
            card_validation:
              T.nilable(Increase::CardPayment::Element::CardValidation::OrHash),
            category: Increase::CardPayment::Element::Category::OrSymbol,
            created_at: Time,
            other: T.nilable(Increase::CardPayment::Element::Other::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # A Card Authentication object. This field will be present in the JSON response if
          # and only if `category` is equal to `card_authentication`. Card Authentications
          # are attempts to authenticate a transaction or a card with 3DS.
          card_authentication:,
          # A Card Authorization object. This field will be present in the JSON response if
          # and only if `category` is equal to `card_authorization`. Card Authorizations are
          # temporary holds placed on a customers funds with the intent to later clear a
          # transaction.
          card_authorization:,
          # A Card Authorization Expiration object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_authorization_expiration`.
          # Card Authorization Expirations are cancellations of authorizations that were
          # never settled by the acquirer.
          card_authorization_expiration:,
          # A Card Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_decline`.
          card_decline:,
          # A Card Financial object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_financial`. Card Financials are temporary
          # holds placed on a customers funds with the intent to later clear a transaction.
          card_financial:,
          # A Card Fuel Confirmation object. This field will be present in the JSON response
          # if and only if `category` is equal to `card_fuel_confirmation`. Card Fuel
          # Confirmations update the amount of a Card Authorization after a fuel pump
          # transaction is completed.
          card_fuel_confirmation:,
          # A Card Increment object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_increment`. Card Increments increase the
          # pending amount of an authorized transaction.
          card_increment:,
          # A Card Refund object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_refund`. Card Refunds move money back to
          # the cardholder. While they are usually connected to a Card Settlement an
          # acquirer can also refund money directly to a card without relation to a
          # transaction.
          card_refund:,
          # A Card Reversal object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_reversal`. Card Reversals cancel parts of
          # or the entirety of an existing Card Authorization.
          card_reversal:,
          # A Card Settlement object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_settlement`. Card Settlements are card
          # transactions that have cleared and settled. While a settlement is usually
          # preceded by an authorization, an acquirer can also directly clear a transaction
          # without first authorizing it.
          card_settlement:,
          # An Inbound Card Validation object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_validation`. Inbound Card
          # Validations are requests from a merchant to verify that a card number and
          # optionally its address and/or Card Verification Value are valid.
          card_validation:,
          # The type of the resource. We may add additional possible values for this enum
          # over time; your application should be able to handle such additions gracefully.
          category:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the card payment element was created.
          created_at:,
          # If the category of this Transaction source is equal to `other`, this field will
          # contain an empty object, otherwise it will contain null.
          other:
        )
        end

        sig do
          override.returns(
            {
              card_authentication:
                T.nilable(Increase::CardPayment::Element::CardAuthentication),
              card_authorization:
                T.nilable(Increase::CardPayment::Element::CardAuthorization),
              card_authorization_expiration:
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorizationExpiration
                ),
              card_decline:
                T.nilable(Increase::CardPayment::Element::CardDecline),
              card_financial:
                T.nilable(Increase::CardPayment::Element::CardFinancial),
              card_fuel_confirmation:
                T.nilable(Increase::CardPayment::Element::CardFuelConfirmation),
              card_increment:
                T.nilable(Increase::CardPayment::Element::CardIncrement),
              card_refund:
                T.nilable(Increase::CardPayment::Element::CardRefund),
              card_reversal:
                T.nilable(Increase::CardPayment::Element::CardReversal),
              card_settlement:
                T.nilable(Increase::CardPayment::Element::CardSettlement),
              card_validation:
                T.nilable(Increase::CardPayment::Element::CardValidation),
              category: Increase::CardPayment::Element::Category::TaggedSymbol,
              created_at: Time,
              other: T.nilable(Increase::CardPayment::Element::Other)
            }
          )
        end
        def to_hash
        end

        class CardAuthentication < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardAuthentication,
                Increase::Internal::AnyHash
              )
            end

          # The Card Authentication identifier.
          sig { returns(String) }
          attr_accessor :id

          # The identifier of the Card.
          sig { returns(String) }
          attr_accessor :card_id

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The category of the card authentication attempt.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardAuthentication::Category::TaggedSymbol
              )
            )
          end
          attr_accessor :category

          # Details about the challenge, if one was requested.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardAuthentication::Challenge
              )
            )
          end
          attr_reader :challenge

          sig do
            params(
              challenge:
                T.nilable(
                  Increase::CardPayment::Element::CardAuthentication::Challenge::OrHash
                )
            ).void
          end
          attr_writer :challenge

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
          # Authentication was attempted.
          sig { returns(Time) }
          attr_accessor :created_at

          # The reason why this authentication attempt was denied, if it was.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
              )
            )
          end
          attr_accessor :deny_reason

          # The device channel of the card authentication attempt.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardAuthentication::DeviceChannel::TaggedSymbol
              )
            )
          end
          attr_accessor :device_channel

          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_acceptor_id

          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_category_code

          # The country the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_country

          # The name of the merchant.
          sig { returns(String) }
          attr_accessor :merchant_name

          # The purchase amount in minor units.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :purchase_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # authentication attempt's purchase currency.
          sig { returns(T.nilable(String)) }
          attr_accessor :purchase_currency

          # The identifier of the Real-Time Decision sent to approve or decline this
          # authentication attempt.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # The status of the card authentication.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # A constant representing the object's type. For this resource it will always be
          # `card_authentication`.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthentication::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A Card Authentication object. This field will be present in the JSON response if
          # and only if `category` is equal to `card_authentication`. Card Authentications
          # are attempts to authenticate a transaction or a card with 3DS.
          sig do
            params(
              id: String,
              card_id: String,
              card_payment_id: String,
              category:
                T.nilable(
                  Increase::CardPayment::Element::CardAuthentication::Category::OrSymbol
                ),
              challenge:
                T.nilable(
                  Increase::CardPayment::Element::CardAuthentication::Challenge::OrHash
                ),
              created_at: Time,
              deny_reason:
                T.nilable(
                  Increase::CardPayment::Element::CardAuthentication::DenyReason::OrSymbol
                ),
              device_channel:
                T.nilable(
                  Increase::CardPayment::Element::CardAuthentication::DeviceChannel::OrSymbol
                ),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_country: String,
              merchant_name: String,
              purchase_amount: T.nilable(Integer),
              purchase_currency: T.nilable(String),
              real_time_decision_id: T.nilable(String),
              status:
                Increase::CardPayment::Element::CardAuthentication::Status::OrSymbol,
              type:
                Increase::CardPayment::Element::CardAuthentication::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Authentication identifier.
            id:,
            # The identifier of the Card.
            card_id:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # The category of the card authentication attempt.
            category:,
            # Details about the challenge, if one was requested.
            challenge:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
            # Authentication was attempted.
            created_at:,
            # The reason why this authentication attempt was denied, if it was.
            deny_reason:,
            # The device channel of the card authentication attempt.
            device_channel:,
            # The merchant identifier (commonly abbreviated as MID) of the merchant the card
            # is transacting with.
            merchant_acceptor_id:,
            # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
            # card is transacting with.
            merchant_category_code:,
            # The country the merchant resides in.
            merchant_country:,
            # The name of the merchant.
            merchant_name:,
            # The purchase amount in minor units.
            purchase_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # authentication attempt's purchase currency.
            purchase_currency:,
            # The identifier of the Real-Time Decision sent to approve or decline this
            # authentication attempt.
            real_time_decision_id:,
            # The status of the card authentication.
            status:,
            # A constant representing the object's type. For this resource it will always be
            # `card_authentication`.
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                card_id: String,
                card_payment_id: String,
                category:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthentication::Category::TaggedSymbol
                  ),
                challenge:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthentication::Challenge
                  ),
                created_at: Time,
                deny_reason:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
                  ),
                device_channel:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthentication::DeviceChannel::TaggedSymbol
                  ),
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_country: String,
                merchant_name: String,
                purchase_amount: T.nilable(Integer),
                purchase_currency: T.nilable(String),
                real_time_decision_id: T.nilable(String),
                status:
                  Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol,
                type:
                  Increase::CardPayment::Element::CardAuthentication::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The category of the card authentication attempt.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthentication::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The authentication attempt is for a payment.
            PAYMENT_AUTHENTICATION =
              T.let(
                :payment_authentication,
                Increase::CardPayment::Element::CardAuthentication::Category::TaggedSymbol
              )

            # The authentication attempt is not for a payment.
            NON_PAYMENT_AUTHENTICATION =
              T.let(
                :non_payment_authentication,
                Increase::CardPayment::Element::CardAuthentication::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthentication::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Challenge < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardAuthentication::Challenge,
                  Increase::Internal::AnyHash
                )
              end

            # Details about the challenge verification attempts, if any happened.
            sig do
              returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt
                ]
              )
            end
            attr_accessor :attempts

            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
            # Authentication Challenge was started.
            sig { returns(Time) }
            attr_accessor :created_at

            # The one-time code used for the Card Authentication Challenge.
            sig { returns(String) }
            attr_accessor :one_time_code

            # The method used to verify the Card Authentication Challenge.
            sig do
              returns(
                Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod::TaggedSymbol
              )
            end
            attr_accessor :verification_method

            # E.g., the email address or phone number used for the Card Authentication
            # Challenge.
            sig { returns(T.nilable(String)) }
            attr_accessor :verification_value

            # Details about the challenge, if one was requested.
            sig do
              params(
                attempts:
                  T::Array[
                    Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::OrHash
                  ],
                created_at: Time,
                one_time_code: String,
                verification_method:
                  Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod::OrSymbol,
                verification_value: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Details about the challenge verification attempts, if any happened.
              attempts:,
              # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the Card
              # Authentication Challenge was started.
              created_at:,
              # The one-time code used for the Card Authentication Challenge.
              one_time_code:,
              # The method used to verify the Card Authentication Challenge.
              verification_method:,
              # E.g., the email address or phone number used for the Card Authentication
              # Challenge.
              verification_value:
            )
            end

            sig do
              override.returns(
                {
                  attempts:
                    T::Array[
                      Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt
                    ],
                  created_at: Time,
                  one_time_code: String,
                  verification_method:
                    Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod::TaggedSymbol,
                  verification_value: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            class Attempt < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt,
                    Increase::Internal::AnyHash
                  )
                end

              # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time of the Card
              # Authentication Challenge Attempt.
              sig { returns(Time) }
              attr_accessor :created_at

              # The outcome of the Card Authentication Challenge Attempt.
              sig do
                returns(
                  Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome::TaggedSymbol
                )
              end
              attr_accessor :outcome

              sig do
                params(
                  created_at: Time,
                  outcome:
                    Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time of the Card
                # Authentication Challenge Attempt.
                created_at:,
                # The outcome of the Card Authentication Challenge Attempt.
                outcome:
              )
              end

              sig do
                override.returns(
                  {
                    created_at: Time,
                    outcome:
                      Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              # The outcome of the Card Authentication Challenge Attempt.
              module Outcome
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # The attempt was successful.
                SUCCESSFUL =
                  T.let(
                    :successful,
                    Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome::TaggedSymbol
                  )

                # The attempt was unsuccessful.
                FAILED =
                  T.let(
                    :failed,
                    Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardAuthentication::Challenge::Attempt::Outcome::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            # The method used to verify the Card Authentication Challenge.
            module VerificationMethod
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # The one-time code was sent via text message.
              TEXT_MESSAGE =
                T.let(
                  :text_message,
                  Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod::TaggedSymbol
                )

              # The one-time code was sent via email.
              EMAIL =
                T.let(
                  :email,
                  Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod::TaggedSymbol
                )

              # The one-time code was not successfully delivered.
              NONE_AVAILABLE =
                T.let(
                  :none_available,
                  Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardAuthentication::Challenge::VerificationMethod::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The reason why this authentication attempt was denied, if it was.
          module DenyReason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthentication::DenyReason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The group was locked.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
              )

            # The card was not active.
            CARD_NOT_ACTIVE =
              T.let(
                :card_not_active,
                Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
              )

            # The entity was not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
              )

            # The transaction was not allowed.
            TRANSACTION_NOT_ALLOWED =
              T.let(
                :transaction_not_allowed,
                Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
              )

            # The webhook was denied.
            WEBHOOK_DENIED =
              T.let(
                :webhook_denied,
                Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
              )

            # The webhook timed out.
            WEBHOOK_TIMED_OUT =
              T.let(
                :webhook_timed_out,
                Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthentication::DenyReason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The device channel of the card authentication attempt.
          module DeviceChannel
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthentication::DeviceChannel
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The authentication attempt was made from an app.
            APP =
              T.let(
                :app,
                Increase::CardPayment::Element::CardAuthentication::DeviceChannel::TaggedSymbol
              )

            # The authentication attempt was made from a browser.
            BROWSER =
              T.let(
                :browser,
                Increase::CardPayment::Element::CardAuthentication::DeviceChannel::TaggedSymbol
              )

            # The authentication attempt was initiated by the 3DS Requestor.
            THREE_DS_REQUESTOR_INITIATED =
              T.let(
                :three_ds_requestor_initiated,
                Increase::CardPayment::Element::CardAuthentication::DeviceChannel::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthentication::DeviceChannel::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The status of the card authentication.
          module Status
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthentication::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The authentication attempt was denied.
            DENIED =
              T.let(
                :denied,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            # The authentication attempt was authenticated with a challenge.
            AUTHENTICATED_WITH_CHALLENGE =
              T.let(
                :authenticated_with_challenge,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            # The authentication attempt was authenticated without a challenge.
            AUTHENTICATED_WITHOUT_CHALLENGE =
              T.let(
                :authenticated_without_challenge,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            # The authentication attempt is awaiting a challenge.
            AWAITING_CHALLENGE =
              T.let(
                :awaiting_challenge,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            # The authentication attempt is validating a challenge.
            VALIDATING_CHALLENGE =
              T.let(
                :validating_challenge,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            # The authentication attempt was canceled.
            CANCELED =
              T.let(
                :canceled,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            # The authentication attempt timed out while awaiting a challenge.
            TIMED_OUT_AWAITING_CHALLENGE =
              T.let(
                :timed_out_awaiting_challenge,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            # The authentication attempt errored.
            ERRORED =
              T.let(
                :errored,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            # The authentication attempt exceeded the attempt threshold.
            EXCEEDED_ATTEMPT_THRESHOLD =
              T.let(
                :exceeded_attempt_threshold,
                Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthentication::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_authentication`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthentication::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_AUTHENTICATION =
              T.let(
                :card_authentication,
                Increase::CardPayment::Element::CardAuthentication::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthentication::Type::TaggedSymbol
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
                Increase::CardPayment::Element::CardAuthorization,
                Increase::Internal::AnyHash
              )
            end

          # The Card Authorization identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorization::Actioner::TaggedSymbol
            )
          end
          attr_accessor :actioner

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts
            )
          end
          attr_reader :additional_amounts

          sig do
            params(
              additional_amounts:
                Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::OrHash
            ).void
          end
          attr_writer :additional_amounts

          # The pending amount in the minor unit of the transaction's currency. For dollars,
          # for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorization::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :digital_wallet_token_id

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorization::Direction::TaggedSymbol
            )
          end
          attr_accessor :direction

          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) when this authorization
          # will expire and the pending transaction will be released.
          sig { returns(Time) }
          attr_accessor :expires_at

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
            returns(
              Increase::CardPayment::Element::CardAuthorization::NetworkDetails
            )
          end
          attr_reader :network_details

          sig do
            params(
              network_details:
                Increase::CardPayment::Element::CardAuthorization::NetworkDetails::OrHash
            ).void
          end
          attr_writer :network_details

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorization::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardAuthorization::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          # score is from 0 to 999, where 999 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # The identifier of the Pending Transaction associated with this Transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :pending_transaction_id

          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :physical_card_id

          # The pending amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # The processing category describes the intent behind the authorization, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
            )
          end
          attr_accessor :processing_category

          # The identifier of the Real-Time Decision sent to approve or decline this
          # transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization`.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorization::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Fields related to verification of cardholder-provided values.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorization::Verification
            )
          end
          attr_reader :verification

          sig do
            params(
              verification:
                Increase::CardPayment::Element::CardAuthorization::Verification::OrHash
            ).void
          end
          attr_writer :verification

          # A Card Authorization object. This field will be present in the JSON response if
          # and only if `category` is equal to `card_authorization`. Card Authorizations are
          # temporary holds placed on a customers funds with the intent to later clear a
          # transaction.
          sig do
            params(
              id: String,
              actioner:
                Increase::CardPayment::Element::CardAuthorization::Actioner::OrSymbol,
              additional_amounts:
                Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::OrHash,
              amount: Integer,
              card_payment_id: String,
              currency:
                Increase::CardPayment::Element::CardAuthorization::Currency::OrSymbol,
              digital_wallet_token_id: T.nilable(String),
              direction:
                Increase::CardPayment::Element::CardAuthorization::Direction::OrSymbol,
              expires_at: Time,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::CardPayment::Element::CardAuthorization::NetworkDetails::OrHash,
              network_identifiers:
                Increase::CardPayment::Element::CardAuthorization::NetworkIdentifiers::OrHash,
              network_risk_score: T.nilable(Integer),
              pending_transaction_id: T.nilable(String),
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category:
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::OrSymbol,
              real_time_decision_id: T.nilable(String),
              terminal_id: T.nilable(String),
              type:
                Increase::CardPayment::Element::CardAuthorization::Type::OrSymbol,
              verification:
                Increase::CardPayment::Element::CardAuthorization::Verification::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Authorization identifier.
            id:,
            # Whether this authorization was approved by Increase, the card network through
            # stand-in processing, or the user through a real-time decision.
            actioner:,
            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            additional_amounts:,
            # The pending amount in the minor unit of the transaction's currency. For dollars,
            # for example, this is cents.
            amount:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's currency.
            currency:,
            # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
            # purchase), the identifier of the token that was used.
            digital_wallet_token_id:,
            # The direction describes the direction the funds will move, either from the
            # cardholder to the merchant or from the merchant to the cardholder.
            direction:,
            # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) when this authorization
            # will expire and the pending transaction will be released.
            expires_at:,
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
            # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
            # score is from 0 to 999, where 999 is the riskiest.
            network_risk_score:,
            # The identifier of the Pending Transaction associated with this Transaction.
            pending_transaction_id:,
            # If the authorization was made in-person with a physical card, the Physical Card
            # that was used.
            physical_card_id:,
            # The pending amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # The processing category describes the intent behind the authorization, such as
            # whether it was used for bill payments or an automatic fuel dispenser.
            processing_category:,
            # The identifier of the Real-Time Decision sent to approve or decline this
            # transaction.
            real_time_decision_id:,
            # The terminal identifier (commonly abbreviated as TID) of the terminal the card
            # is transacting with.
            terminal_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_authorization`.
            type:,
            # Fields related to verification of cardholder-provided values.
            verification:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                actioner:
                  Increase::CardPayment::Element::CardAuthorization::Actioner::TaggedSymbol,
                additional_amounts:
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts,
                amount: Integer,
                card_payment_id: String,
                currency:
                  Increase::CardPayment::Element::CardAuthorization::Currency::TaggedSymbol,
                digital_wallet_token_id: T.nilable(String),
                direction:
                  Increase::CardPayment::Element::CardAuthorization::Direction::TaggedSymbol,
                expires_at: Time,
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: T.nilable(String),
                merchant_country: String,
                merchant_descriptor: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_details:
                  Increase::CardPayment::Element::CardAuthorization::NetworkDetails,
                network_identifiers:
                  Increase::CardPayment::Element::CardAuthorization::NetworkIdentifiers,
                network_risk_score: T.nilable(Integer),
                pending_transaction_id: T.nilable(String),
                physical_card_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                processing_category:
                  Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol,
                real_time_decision_id: T.nilable(String),
                terminal_id: T.nilable(String),
                type:
                  Increase::CardPayment::Element::CardAuthorization::Type::TaggedSymbol,
                verification:
                  Increase::CardPayment::Element::CardAuthorization::Verification
              }
            )
          end
          def to_hash
          end

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          module Actioner
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthorization::Actioner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # This object was actioned by the user through a real-time decision.
            USER =
              T.let(
                :user,
                Increase::CardPayment::Element::CardAuthorization::Actioner::TaggedSymbol
              )

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(
                :increase,
                Increase::CardPayment::Element::CardAuthorization::Actioner::TaggedSymbol
              )

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(
                :network,
                Increase::CardPayment::Element::CardAuthorization::Actioner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthorization::Actioner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts,
                  Increase::Internal::AnyHash
                )
              end

            # The part of this transaction amount that was for clinic-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic
                )
              )
            end
            attr_reader :clinic

            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic::OrHash
                  )
              ).void
            end
            attr_writer :clinic

            # The part of this transaction amount that was for dental-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental
                )
              )
            end
            attr_reader :dental

            sig do
              params(
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental::OrHash
                  )
              ).void
            end
            attr_writer :dental

            # The original pre-authorized amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Original
                )
              )
            end
            attr_reader :original

            sig do
              params(
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Original::OrHash
                  )
              ).void
            end
            attr_writer :original

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription
                )
              )
            end
            attr_reader :prescription

            sig do
              params(
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription::OrHash
                  )
              ).void
            end
            attr_writer :prescription

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge
                )
              )
            end
            attr_reader :surcharge

            sig do
              params(
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge::OrHash
                  )
              ).void
            end
            attr_writer :surcharge

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative
                )
              )
            end
            attr_reader :total_cumulative

            sig do
              params(
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative::OrHash
                  )
              ).void
            end
            attr_writer :total_cumulative

            # The total amount of healthcare-related additional amounts.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare
                )
              )
            end
            attr_reader :total_healthcare

            sig do
              params(
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare::OrHash
                  )
              ).void
            end
            attr_writer :total_healthcare

            # The part of this transaction amount that was for transit-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit
                )
              )
            end
            attr_reader :transit

            sig do
              params(
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit::OrHash
                  )
              ).void
            end
            attr_writer :transit

            # An unknown additional amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown
                )
              )
            end
            attr_reader :unknown

            sig do
              params(
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown::OrHash
                  )
              ).void
            end
            attr_writer :unknown

            # The part of this transaction amount that was for vision-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision
                )
              )
            end
            attr_reader :vision

            sig do
              params(
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision::OrHash
                  )
              ).void
            end
            attr_writer :vision

            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic::OrHash
                  ),
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental::OrHash
                  ),
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Original::OrHash
                  ),
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription::OrHash
                  ),
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge::OrHash
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative::OrHash
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare::OrHash
                  ),
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit::OrHash
                  ),
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown::OrHash
                  ),
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The part of this transaction amount that was for clinic-related services.
              clinic:,
              # The part of this transaction amount that was for dental-related services.
              dental:,
              # The original pre-authorized amount.
              original:,
              # The part of this transaction amount that was for healthcare prescriptions.
              prescription:,
              # The surcharge amount charged for this transaction by the merchant.
              surcharge:,
              # The total amount of a series of incremental authorizations, optionally provided.
              total_cumulative:,
              # The total amount of healthcare-related additional amounts.
              total_healthcare:,
              # The part of this transaction amount that was for transit-related services.
              transit:,
              # An unknown additional amount.
              unknown:,
              # The part of this transaction amount that was for vision-related services.
              vision:
            )
            end

            sig do
              override.returns(
                {
                  clinic:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic
                    ),
                  dental:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental
                    ),
                  original:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Original
                    ),
                  prescription:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription
                    ),
                  surcharge:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge
                    ),
                  total_cumulative:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative
                    ),
                  total_healthcare:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare
                    ),
                  transit:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit
                    ),
                  unknown:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown
                    ),
                  vision:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision
                    )
                }
              )
            end
            def to_hash
            end

            class Clinic < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Clinic,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for clinic-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Dental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Dental,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for dental-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Original < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Original,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The original pre-authorized amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Prescription < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Prescription,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for healthcare prescriptions.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Surcharge < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Surcharge,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The surcharge amount charged for this transaction by the merchant.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalCumulative < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalCumulative,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of a series of incremental authorizations, optionally provided.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalHealthcare < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::TotalHealthcare,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of healthcare-related additional amounts.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Transit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Transit,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for transit-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Unknown < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Unknown,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # An unknown additional amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Vision < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::AdditionalAmounts::Vision,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for vision-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthorization::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardAuthorization::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthorization::Currency::TaggedSymbol
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
                  Increase::CardPayment::Element::CardAuthorization::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT =
              T.let(
                :settlement,
                Increase::CardPayment::Element::CardAuthorization::Direction::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::CardPayment::Element::CardAuthorization::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthorization::Direction::TaggedSymbol
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
                  Increase::CardPayment::Element::CardAuthorization::NetworkDetails,
                  Increase::Internal::AnyHash
                )
              end

            # The payment network used to process this card authorization.
            sig do
              returns(
                Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Fields specific to the `pulse` network.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Pulse
                )
              )
            end
            attr_reader :pulse

            sig do
              params(
                pulse:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Pulse::OrHash
                  )
              ).void
            end
            attr_writer :pulse

            # Fields specific to the `visa` network.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa
                )
              )
            end
            attr_reader :visa

            sig do
              params(
                visa:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::OrHash
                  )
              ).void
            end
            attr_writer :visa

            # Fields specific to the `network`.
            sig do
              params(
                category:
                  Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Category::OrSymbol,
                pulse:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Pulse::OrHash
                  ),
                visa:
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The payment network used to process this card authorization.
              category:,
              # Fields specific to the `pulse` network.
              pulse:,
              # Fields specific to the `visa` network.
              visa:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Category::TaggedSymbol,
                  pulse:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Pulse
                    ),
                  visa:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa
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
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Visa
              VISA =
                T.let(
                  :visa,
                  Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Category::TaggedSymbol
                )

              # Pulse
              PULSE =
                T.let(
                  :pulse,
                  Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Pulse < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Pulse,
                    Increase::Internal::AnyHash
                  )
                end

              # Fields specific to the `pulse` network.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class Visa < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :electronic_commerce_indicator

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )
                )
              end
              attr_accessor :point_of_service_entry_mode

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )
                )
              end
              attr_accessor :stand_in_processing_reason

              # Fields specific to the `visa` network.
              sig do
                params(
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
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
                        Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ),
                    point_of_service_entry_mode:
                      T.nilable(
                        Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ),
                    stand_in_processing_reason:
                      T.nilable(
                        Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER =
                  T.let(
                    :mail_phone_order,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING =
                  T.let(
                    :recurring,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT =
                  T.let(
                    :installment,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER =
                  T.let(
                    :unknown_mail_phone_order,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE =
                  T.let(
                    :secure_electronic_commerce,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  T.let(
                    :non_authenticated_security_transaction_at_3ds_capable_merchant,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION =
                  T.let(
                    :non_authenticated_security_transaction,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION =
                  T.let(
                    :non_secure_transaction,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
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
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Unknown
                UNKNOWN =
                  T.let(
                    :unknown,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Manual key entry
                MANUAL =
                  T.let(
                    :manual,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV =
                  T.let(
                    :magnetic_stripe_no_cvv,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Optical code
                OPTICAL_CODE =
                  T.let(
                    :optical_code,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD =
                  T.let(
                    :integrated_circuit_card,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of chip card
                CONTACTLESS =
                  T.let(
                    :contactless,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE =
                  T.let(
                    :credential_on_file,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read
                MAGNETIC_STRIPE =
                  T.let(
                    :magnetic_stripe,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE =
                  T.let(
                    :contactless_magnetic_stripe,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV =
                  T.let(
                    :integrated_circuit_card_no_cvv,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
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
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR =
                  T.let(
                    :issuer_error,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD =
                  T.let(
                    :invalid_physical_card,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  T.let(
                    :invalid_cardholder_authentication_verification_value,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR =
                  T.let(
                    :internal_visa_error,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  T.let(
                    :merchant_transaction_advisory_service_authentication_required,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                  T.let(
                    :payment_fraud_disruption_acquirer_block,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An unspecific reason for stand-in processing.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                  Increase::CardPayment::Element::CardAuthorization::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

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
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
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
                  authorization_identification_response: T.nilable(String),
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
                  Increase::CardPayment::Element::CardAuthorization::ProcessingCategory
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING =
              T.let(
                :account_funding,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER =
              T.let(
                :automatic_fuel_dispenser,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # A transaction used to pay a bill.
            BILL_PAYMENT =
              T.let(
                :bill_payment,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # Original credit transactions are used to send money to a cardholder.
            ORIGINAL_CREDIT =
              T.let(
                :original_credit,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # A regular purchase.
            PURCHASE =
              T.let(
                :purchase,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH =
              T.let(
                :quasi_cash,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
            CASH_DISBURSEMENT =
              T.let(
                :cash_disbursement,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # A balance inquiry transaction is used to check the balance of an account associated with a card.
            BALANCE_INQUIRY =
              T.let(
                :balance_inquiry,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            # The processing category is unknown.
            UNKNOWN =
              T.let(
                :unknown,
                Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthorization::ProcessingCategory::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthorization::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_AUTHORIZATION =
              T.let(
                :card_authorization,
                Increase::CardPayment::Element::CardAuthorization::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthorization::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Verification < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardAuthorization::Verification,
                  Increase::Internal::AnyHash
                )
              end

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              returns(
                Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode
              )
            end
            attr_reader :card_verification_code

            sig do
              params(
                card_verification_code:
                  Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::OrHash
              ).void
            end
            attr_writer :card_verification_code

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              returns(
                Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress
              )
            end
            attr_reader :cardholder_address

            sig do
              params(
                cardholder_address:
                  Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::OrHash
              ).void
            end
            attr_writer :cardholder_address

            # Fields related to verification of cardholder-provided values.
            sig do
              params(
                card_verification_code:
                  Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::OrHash,
                cardholder_address:
                  Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::OrHash
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
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode,
                  cardholder_address:
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress
                }
              )
            end
            def to_hash
            end

            class CardVerificationCode < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode,
                    Increase::Internal::AnyHash
                  )
                end

              # The result of verifying the Card Verification Code.
              sig do
                returns(
                  Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              sig do
                params(
                  result:
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result::OrSymbol
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
                      Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
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
                      Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No card verification code was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code matched the one on file.
                MATCH =
                  T.let(
                    :match,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code did not match the one on file.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
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
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress,
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
                  Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
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
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::OrSymbol
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
                      Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
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
                      Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No address information was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address does not match or was not provided.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                  T.let(
                    :postal_code_match_address_no_match,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code does not match, but the street address matches or was not provided.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                  T.let(
                    :postal_code_no_match_address_match,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address match.
                MATCH =
                  T.let(
                    :match,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address do not match.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address was not verified. (deprecated)
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                  T.let(
                    :postal_code_match_address_not_checked,
                    Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end

        class CardAuthorizationExpiration < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardAuthorizationExpiration,
                Increase::Internal::AnyHash
              )
            end

          # The Card Authorization Expiration identifier.
          sig { returns(String) }
          attr_accessor :id

          # The identifier for the Card Authorization this reverses.
          sig { returns(String) }
          attr_accessor :card_authorization_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          # currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorizationExpiration::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The amount of this authorization expiration in the minor unit of the
          # transaction's currency. For dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :expired_amount

          # The card network used to process this card authorization.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorizationExpiration::Network::TaggedSymbol
            )
          end
          attr_accessor :network

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization_expiration`.
          sig do
            returns(
              Increase::CardPayment::Element::CardAuthorizationExpiration::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A Card Authorization Expiration object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_authorization_expiration`.
          # Card Authorization Expirations are cancellations of authorizations that were
          # never settled by the acquirer.
          sig do
            params(
              id: String,
              card_authorization_id: String,
              currency:
                Increase::CardPayment::Element::CardAuthorizationExpiration::Currency::OrSymbol,
              expired_amount: Integer,
              network:
                Increase::CardPayment::Element::CardAuthorizationExpiration::Network::OrSymbol,
              type:
                Increase::CardPayment::Element::CardAuthorizationExpiration::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Authorization Expiration identifier.
            id:,
            # The identifier for the Card Authorization this reverses.
            card_authorization_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
            # currency.
            currency:,
            # The amount of this authorization expiration in the minor unit of the
            # transaction's currency. For dollars, for example, this is cents.
            expired_amount:,
            # The card network used to process this card authorization.
            network:,
            # A constant representing the object's type. For this resource it will always be
            # `card_authorization_expiration`.
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                card_authorization_id: String,
                currency:
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Currency::TaggedSymbol,
                expired_amount: Integer,
                network:
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Network::TaggedSymbol,
                type:
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardAuthorizationExpiration::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The card network used to process this card authorization.
          module Network
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Network
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::CardPayment::Element::CardAuthorizationExpiration::Network::TaggedSymbol
              )

            # Pulse
            PULSE =
              T.let(
                :pulse,
                Increase::CardPayment::Element::CardAuthorizationExpiration::Network::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Network::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_authorization_expiration`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_AUTHORIZATION_EXPIRATION =
              T.let(
                :card_authorization_expiration,
                Increase::CardPayment::Element::CardAuthorizationExpiration::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardAuthorizationExpiration::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardDecline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardDecline,
                Increase::Internal::AnyHash
              )
            end

          # The Card Decline identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          sig do
            returns(
              Increase::CardPayment::Element::CardDecline::Actioner::TaggedSymbol
            )
          end
          attr_accessor :actioner

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardDecline::AdditionalAmounts
            )
          end
          attr_reader :additional_amounts

          sig do
            params(
              additional_amounts:
                Increase::CardPayment::Element::CardDecline::AdditionalAmounts::OrHash
            ).void
          end
          attr_writer :additional_amounts

          # The declined amount in the minor unit of the destination account currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardDecline::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The identifier of the declined transaction created for this Card Decline.
          sig { returns(String) }
          attr_accessor :declined_transaction_id

          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :digital_wallet_token_id

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          sig do
            returns(
              Increase::CardPayment::Element::CardDecline::Direction::TaggedSymbol
            )
          end
          attr_accessor :direction

          # The identifier of the card authorization this request attempted to incrementally
          # authorize.
          sig { returns(T.nilable(String)) }
          attr_accessor :incremented_card_authorization_id

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
            returns(Increase::CardPayment::Element::CardDecline::NetworkDetails)
          end
          attr_reader :network_details

          sig do
            params(
              network_details:
                Increase::CardPayment::Element::CardDecline::NetworkDetails::OrHash
            ).void
          end
          attr_writer :network_details

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardDecline::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardDecline::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          # score is from 0 to 999, where 999 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :physical_card_id

          # The declined amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # The processing category describes the intent behind the authorization, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          sig do
            returns(
              Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
            )
          end
          attr_accessor :processing_category

          # The identifier of the Real-Time Decision sent to approve or decline this
          # transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # This is present if a specific decline reason was given in the real-time
          # decision.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )
            )
          end
          attr_accessor :real_time_decision_reason

          # Why the transaction was declined.
          sig do
            returns(
              Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # Fields related to verification of cardholder-provided values.
          sig do
            returns(Increase::CardPayment::Element::CardDecline::Verification)
          end
          attr_reader :verification

          sig do
            params(
              verification:
                Increase::CardPayment::Element::CardDecline::Verification::OrHash
            ).void
          end
          attr_writer :verification

          # A Card Decline object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_decline`.
          sig do
            params(
              id: String,
              actioner:
                Increase::CardPayment::Element::CardDecline::Actioner::OrSymbol,
              additional_amounts:
                Increase::CardPayment::Element::CardDecline::AdditionalAmounts::OrHash,
              amount: Integer,
              card_payment_id: String,
              currency:
                Increase::CardPayment::Element::CardDecline::Currency::OrSymbol,
              declined_transaction_id: String,
              digital_wallet_token_id: T.nilable(String),
              direction:
                Increase::CardPayment::Element::CardDecline::Direction::OrSymbol,
              incremented_card_authorization_id: T.nilable(String),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::CardPayment::Element::CardDecline::NetworkDetails::OrHash,
              network_identifiers:
                Increase::CardPayment::Element::CardDecline::NetworkIdentifiers::OrHash,
              network_risk_score: T.nilable(Integer),
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category:
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::OrSymbol,
              real_time_decision_id: T.nilable(String),
              real_time_decision_reason:
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::OrSymbol
                ),
              reason:
                Increase::CardPayment::Element::CardDecline::Reason::OrSymbol,
              terminal_id: T.nilable(String),
              verification:
                Increase::CardPayment::Element::CardDecline::Verification::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Decline identifier.
            id:,
            # Whether this authorization was approved by Increase, the card network through
            # stand-in processing, or the user through a real-time decision.
            actioner:,
            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            additional_amounts:,
            # The declined amount in the minor unit of the destination account currency. For
            # dollars, for example, this is cents.
            amount:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
            # account currency.
            currency:,
            # The identifier of the declined transaction created for this Card Decline.
            declined_transaction_id:,
            # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
            # purchase), the identifier of the token that was used.
            digital_wallet_token_id:,
            # The direction describes the direction the funds will move, either from the
            # cardholder to the merchant or from the merchant to the cardholder.
            direction:,
            # The identifier of the card authorization this request attempted to incrementally
            # authorize.
            incremented_card_authorization_id:,
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
            # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
            # score is from 0 to 999, where 999 is the riskiest.
            network_risk_score:,
            # If the authorization was made in-person with a physical card, the Physical Card
            # that was used.
            physical_card_id:,
            # The declined amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # The processing category describes the intent behind the authorization, such as
            # whether it was used for bill payments or an automatic fuel dispenser.
            processing_category:,
            # The identifier of the Real-Time Decision sent to approve or decline this
            # transaction.
            real_time_decision_id:,
            # This is present if a specific decline reason was given in the real-time
            # decision.
            real_time_decision_reason:,
            # Why the transaction was declined.
            reason:,
            # The terminal identifier (commonly abbreviated as TID) of the terminal the card
            # is transacting with.
            terminal_id:,
            # Fields related to verification of cardholder-provided values.
            verification:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                actioner:
                  Increase::CardPayment::Element::CardDecline::Actioner::TaggedSymbol,
                additional_amounts:
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts,
                amount: Integer,
                card_payment_id: String,
                currency:
                  Increase::CardPayment::Element::CardDecline::Currency::TaggedSymbol,
                declined_transaction_id: String,
                digital_wallet_token_id: T.nilable(String),
                direction:
                  Increase::CardPayment::Element::CardDecline::Direction::TaggedSymbol,
                incremented_card_authorization_id: T.nilable(String),
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: T.nilable(String),
                merchant_country: String,
                merchant_descriptor: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_details:
                  Increase::CardPayment::Element::CardDecline::NetworkDetails,
                network_identifiers:
                  Increase::CardPayment::Element::CardDecline::NetworkIdentifiers,
                network_risk_score: T.nilable(Integer),
                physical_card_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                processing_category:
                  Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol,
                real_time_decision_id: T.nilable(String),
                real_time_decision_reason:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
                  ),
                reason:
                  Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol,
                terminal_id: T.nilable(String),
                verification:
                  Increase::CardPayment::Element::CardDecline::Verification
              }
            )
          end
          def to_hash
          end

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          module Actioner
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardDecline::Actioner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # This object was actioned by the user through a real-time decision.
            USER =
              T.let(
                :user,
                Increase::CardPayment::Element::CardDecline::Actioner::TaggedSymbol
              )

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(
                :increase,
                Increase::CardPayment::Element::CardDecline::Actioner::TaggedSymbol
              )

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(
                :network,
                Increase::CardPayment::Element::CardDecline::Actioner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardDecline::Actioner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts,
                  Increase::Internal::AnyHash
                )
              end

            # The part of this transaction amount that was for clinic-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic
                )
              )
            end
            attr_reader :clinic

            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic::OrHash
                  )
              ).void
            end
            attr_writer :clinic

            # The part of this transaction amount that was for dental-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Dental
                )
              )
            end
            attr_reader :dental

            sig do
              params(
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Dental::OrHash
                  )
              ).void
            end
            attr_writer :dental

            # The original pre-authorized amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Original
                )
              )
            end
            attr_reader :original

            sig do
              params(
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Original::OrHash
                  )
              ).void
            end
            attr_writer :original

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription
                )
              )
            end
            attr_reader :prescription

            sig do
              params(
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription::OrHash
                  )
              ).void
            end
            attr_writer :prescription

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge
                )
              )
            end
            attr_reader :surcharge

            sig do
              params(
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge::OrHash
                  )
              ).void
            end
            attr_writer :surcharge

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative
                )
              )
            end
            attr_reader :total_cumulative

            sig do
              params(
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative::OrHash
                  )
              ).void
            end
            attr_writer :total_cumulative

            # The total amount of healthcare-related additional amounts.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare
                )
              )
            end
            attr_reader :total_healthcare

            sig do
              params(
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare::OrHash
                  )
              ).void
            end
            attr_writer :total_healthcare

            # The part of this transaction amount that was for transit-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Transit
                )
              )
            end
            attr_reader :transit

            sig do
              params(
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Transit::OrHash
                  )
              ).void
            end
            attr_writer :transit

            # An unknown additional amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown
                )
              )
            end
            attr_reader :unknown

            sig do
              params(
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown::OrHash
                  )
              ).void
            end
            attr_writer :unknown

            # The part of this transaction amount that was for vision-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Vision
                )
              )
            end
            attr_reader :vision

            sig do
              params(
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Vision::OrHash
                  )
              ).void
            end
            attr_writer :vision

            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic::OrHash
                  ),
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Dental::OrHash
                  ),
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Original::OrHash
                  ),
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription::OrHash
                  ),
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge::OrHash
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative::OrHash
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare::OrHash
                  ),
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Transit::OrHash
                  ),
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown::OrHash
                  ),
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Vision::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The part of this transaction amount that was for clinic-related services.
              clinic:,
              # The part of this transaction amount that was for dental-related services.
              dental:,
              # The original pre-authorized amount.
              original:,
              # The part of this transaction amount that was for healthcare prescriptions.
              prescription:,
              # The surcharge amount charged for this transaction by the merchant.
              surcharge:,
              # The total amount of a series of incremental authorizations, optionally provided.
              total_cumulative:,
              # The total amount of healthcare-related additional amounts.
              total_healthcare:,
              # The part of this transaction amount that was for transit-related services.
              transit:,
              # An unknown additional amount.
              unknown:,
              # The part of this transaction amount that was for vision-related services.
              vision:
            )
            end

            sig do
              override.returns(
                {
                  clinic:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic
                    ),
                  dental:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Dental
                    ),
                  original:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Original
                    ),
                  prescription:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription
                    ),
                  surcharge:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge
                    ),
                  total_cumulative:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative
                    ),
                  total_healthcare:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare
                    ),
                  transit:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Transit
                    ),
                  unknown:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown
                    ),
                  vision:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Vision
                    )
                }
              )
            end
            def to_hash
            end

            class Clinic < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Clinic,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for clinic-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Dental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Dental,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for dental-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Original < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Original,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The original pre-authorized amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Prescription < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Prescription,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for healthcare prescriptions.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Surcharge < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Surcharge,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The surcharge amount charged for this transaction by the merchant.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalCumulative < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalCumulative,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of a series of incremental authorizations, optionally provided.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalHealthcare < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::TotalHealthcare,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of healthcare-related additional amounts.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Transit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Transit,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for transit-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Unknown < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Unknown,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # An unknown additional amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Vision < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::AdditionalAmounts::Vision,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for vision-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the destination
          # account currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardDecline::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardDecline::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardDecline::Currency::TaggedSymbol
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
                  Increase::CardPayment::Element::CardDecline::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT =
              T.let(
                :settlement,
                Increase::CardPayment::Element::CardDecline::Direction::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::CardPayment::Element::CardDecline::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardDecline::Direction::TaggedSymbol
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
                  Increase::CardPayment::Element::CardDecline::NetworkDetails,
                  Increase::Internal::AnyHash
                )
              end

            # The payment network used to process this card authorization.
            sig do
              returns(
                Increase::CardPayment::Element::CardDecline::NetworkDetails::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Fields specific to the `pulse` network.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::NetworkDetails::Pulse
                )
              )
            end
            attr_reader :pulse

            sig do
              params(
                pulse:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Pulse::OrHash
                  )
              ).void
            end
            attr_writer :pulse

            # Fields specific to the `visa` network.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa
                )
              )
            end
            attr_reader :visa

            sig do
              params(
                visa:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::OrHash
                  )
              ).void
            end
            attr_writer :visa

            # Fields specific to the `network`.
            sig do
              params(
                category:
                  Increase::CardPayment::Element::CardDecline::NetworkDetails::Category::OrSymbol,
                pulse:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Pulse::OrHash
                  ),
                visa:
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The payment network used to process this card authorization.
              category:,
              # Fields specific to the `pulse` network.
              pulse:,
              # Fields specific to the `visa` network.
              visa:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Category::TaggedSymbol,
                  pulse:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Pulse
                    ),
                  visa:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa
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
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Visa
              VISA =
                T.let(
                  :visa,
                  Increase::CardPayment::Element::CardDecline::NetworkDetails::Category::TaggedSymbol
                )

              # Pulse
              PULSE =
                T.let(
                  :pulse,
                  Increase::CardPayment::Element::CardDecline::NetworkDetails::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Pulse < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Pulse,
                    Increase::Internal::AnyHash
                  )
                end

              # Fields specific to the `pulse` network.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class Visa < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :electronic_commerce_indicator

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )
                )
              end
              attr_accessor :point_of_service_entry_mode

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )
                )
              end
              attr_accessor :stand_in_processing_reason

              # Fields specific to the `visa` network.
              sig do
                params(
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
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
                        Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ),
                    point_of_service_entry_mode:
                      T.nilable(
                        Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ),
                    stand_in_processing_reason:
                      T.nilable(
                        Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER =
                  T.let(
                    :mail_phone_order,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING =
                  T.let(
                    :recurring,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT =
                  T.let(
                    :installment,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER =
                  T.let(
                    :unknown_mail_phone_order,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE =
                  T.let(
                    :secure_electronic_commerce,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  T.let(
                    :non_authenticated_security_transaction_at_3ds_capable_merchant,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION =
                  T.let(
                    :non_authenticated_security_transaction,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION =
                  T.let(
                    :non_secure_transaction,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
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
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Unknown
                UNKNOWN =
                  T.let(
                    :unknown,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Manual key entry
                MANUAL =
                  T.let(
                    :manual,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV =
                  T.let(
                    :magnetic_stripe_no_cvv,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Optical code
                OPTICAL_CODE =
                  T.let(
                    :optical_code,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD =
                  T.let(
                    :integrated_circuit_card,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of chip card
                CONTACTLESS =
                  T.let(
                    :contactless,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE =
                  T.let(
                    :credential_on_file,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read
                MAGNETIC_STRIPE =
                  T.let(
                    :magnetic_stripe,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE =
                  T.let(
                    :contactless_magnetic_stripe,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV =
                  T.let(
                    :integrated_circuit_card_no_cvv,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
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
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR =
                  T.let(
                    :issuer_error,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD =
                  T.let(
                    :invalid_physical_card,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  T.let(
                    :invalid_cardholder_authentication_verification_value,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR =
                  T.let(
                    :internal_visa_error,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  T.let(
                    :merchant_transaction_advisory_service_authentication_required,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                  T.let(
                    :payment_fraud_disruption_acquirer_block,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An unspecific reason for stand-in processing.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardDecline::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                  Increase::CardPayment::Element::CardDecline::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

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
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
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
                  authorization_identification_response: T.nilable(String),
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
                  Increase::CardPayment::Element::CardDecline::ProcessingCategory
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING =
              T.let(
                :account_funding,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER =
              T.let(
                :automatic_fuel_dispenser,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A transaction used to pay a bill.
            BILL_PAYMENT =
              T.let(
                :bill_payment,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Original credit transactions are used to send money to a cardholder.
            ORIGINAL_CREDIT =
              T.let(
                :original_credit,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A regular purchase.
            PURCHASE =
              T.let(
                :purchase,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH =
              T.let(
                :quasi_cash,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
            CASH_DISBURSEMENT =
              T.let(
                :cash_disbursement,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # A balance inquiry transaction is used to check the balance of an account associated with a card.
            BALANCE_INQUIRY =
              T.let(
                :balance_inquiry,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            # The processing category is unknown.
            UNKNOWN =
              T.let(
                :unknown,
                Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardDecline::ProcessingCategory::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # This is present if a specific decline reason was given in the real-time
          # decision.
          module RealTimeDecisionReason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # This type of transaction is not allowed for this card. This transaction should not be retried.
            TRANSACTION_NEVER_ALLOWED =
              T.let(
                :transaction_never_allowed,
                Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
            EXCEEDS_APPROVAL_LIMIT =
              T.let(
                :exceeds_approval_limit,
                Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
            CARD_TEMPORARILY_DISABLED =
              T.let(
                :card_temporarily_disabled,
                Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
            OTHER =
              T.let(
                :other,
                Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardDecline::RealTimeDecisionReason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Why the transaction was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardDecline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The account has been closed.
            ACCOUNT_CLOSED =
              T.let(
                :account_closed,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The Card was not active.
            CARD_NOT_ACTIVE =
              T.let(
                :card_not_active,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The Card has been canceled.
            CARD_CANCELED =
              T.let(
                :card_canceled,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The Physical Card was not active.
            PHYSICAL_CARD_NOT_ACTIVE =
              T.let(
                :physical_card_not_active,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The account's entity was not active.
            ENTITY_NOT_ACTIVE =
              T.let(
                :entity_not_active,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The account was inactive.
            GROUP_LOCKED =
              T.let(
                :group_locked,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The Card's Account did not have a sufficient available balance.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The given CVV2 did not match the card's value.
            CVV2_MISMATCH =
              T.let(
                :cvv2_mismatch,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The given PIN did not match the card's value.
            PIN_MISMATCH =
              T.let(
                :pin_mismatch,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The given expiration date did not match the card's value. Only applies when a CVV2 is present.
            CARD_EXPIRATION_MISMATCH =
              T.let(
                :card_expiration_mismatch,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The attempted card transaction is not allowed per Increase's terms.
            TRANSACTION_NOT_ALLOWED =
              T.let(
                :transaction_not_allowed,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was blocked by a Limit.
            BREACHES_LIMIT =
              T.let(
                :breaches_limit,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # Your application declined the transaction via webhook.
            WEBHOOK_DECLINED =
              T.let(
                :webhook_declined,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # Your application webhook did not respond without the required timeout.
            WEBHOOK_TIMED_OUT =
              T.let(
                :webhook_timed_out,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # Declined by stand-in processing.
            DECLINED_BY_STAND_IN_PROCESSING =
              T.let(
                :declined_by_stand_in_processing,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The card read had an invalid CVV, dCVV, or authorization request cryptogram.
            INVALID_PHYSICAL_CARD =
              T.let(
                :invalid_physical_card,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The original card authorization for this incremental authorization does not exist.
            MISSING_ORIGINAL_AUTHORIZATION =
              T.let(
                :missing_original_authorization,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was declined because the 3DS authentication failed.
            FAILED_3DS_AUTHENTICATION =
              T.let(
                :failed_3ds_authentication,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was suspected to be used by a card tester to test for valid card numbers.
            SUSPECTED_CARD_TESTING =
              T.let(
                :suspected_card_testing,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            # The transaction was suspected to be fraudulent. Please reach out to support@increase.com for more information.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardDecline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Verification < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardDecline::Verification,
                  Increase::Internal::AnyHash
                )
              end

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              returns(
                Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode
              )
            end
            attr_reader :card_verification_code

            sig do
              params(
                card_verification_code:
                  Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::OrHash
              ).void
            end
            attr_writer :card_verification_code

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              returns(
                Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress
              )
            end
            attr_reader :cardholder_address

            sig do
              params(
                cardholder_address:
                  Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::OrHash
              ).void
            end
            attr_writer :cardholder_address

            # Fields related to verification of cardholder-provided values.
            sig do
              params(
                card_verification_code:
                  Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::OrHash,
                cardholder_address:
                  Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::OrHash
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
                    Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode,
                  cardholder_address:
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress
                }
              )
            end
            def to_hash
            end

            class CardVerificationCode < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode,
                    Increase::Internal::AnyHash
                  )
                end

              # The result of verifying the Card Verification Code.
              sig do
                returns(
                  Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              sig do
                params(
                  result:
                    Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result::OrSymbol
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
                      Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
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
                      Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No card verification code was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code matched the one on file.
                MATCH =
                  T.let(
                    :match,
                    Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code did not match the one on file.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardDecline::Verification::CardVerificationCode::Result::TaggedSymbol
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
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress,
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
                  Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
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
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::OrSymbol
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
                      Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
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
                      Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No address information was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address does not match or was not provided.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                  T.let(
                    :postal_code_match_address_no_match,
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code does not match, but the street address matches or was not provided.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                  T.let(
                    :postal_code_no_match_address_match,
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address match.
                MATCH =
                  T.let(
                    :match,
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address do not match.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address was not verified. (deprecated)
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                  T.let(
                    :postal_code_match_address_not_checked,
                    Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardDecline::Verification::CardholderAddress::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end

        class CardFinancial < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardFinancial,
                Increase::Internal::AnyHash
              )
            end

          # The Card Financial identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this financial was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          sig do
            returns(
              Increase::CardPayment::Element::CardFinancial::Actioner::TaggedSymbol
            )
          end
          attr_accessor :actioner

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardFinancial::AdditionalAmounts
            )
          end
          attr_reader :additional_amounts

          sig do
            params(
              additional_amounts:
                Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::OrHash
            ).void
          end
          attr_writer :additional_amounts

          # The pending amount in the minor unit of the transaction's currency. For dollars,
          # for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardFinancial::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :digital_wallet_token_id

          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          sig do
            returns(
              Increase::CardPayment::Element::CardFinancial::Direction::TaggedSymbol
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
            returns(
              Increase::CardPayment::Element::CardFinancial::NetworkDetails
            )
          end
          attr_reader :network_details

          sig do
            params(
              network_details:
                Increase::CardPayment::Element::CardFinancial::NetworkDetails::OrHash
            ).void
          end
          attr_writer :network_details

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardFinancial::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardFinancial::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          # score is from 0 to 999, where 999 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :physical_card_id

          # The pending amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # The processing category describes the intent behind the financial, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          sig do
            returns(
              Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
            )
          end
          attr_accessor :processing_category

          # The identifier of the Real-Time Decision sent to approve or decline this
          # transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # The identifier of the Transaction associated with this Transaction.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A constant representing the object's type. For this resource it will always be
          # `card_financial`.
          sig do
            returns(
              Increase::CardPayment::Element::CardFinancial::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Fields related to verification of cardholder-provided values.
          sig do
            returns(Increase::CardPayment::Element::CardFinancial::Verification)
          end
          attr_reader :verification

          sig do
            params(
              verification:
                Increase::CardPayment::Element::CardFinancial::Verification::OrHash
            ).void
          end
          attr_writer :verification

          # A Card Financial object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_financial`. Card Financials are temporary
          # holds placed on a customers funds with the intent to later clear a transaction.
          sig do
            params(
              id: String,
              actioner:
                Increase::CardPayment::Element::CardFinancial::Actioner::OrSymbol,
              additional_amounts:
                Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::OrHash,
              amount: Integer,
              card_payment_id: String,
              currency:
                Increase::CardPayment::Element::CardFinancial::Currency::OrSymbol,
              digital_wallet_token_id: T.nilable(String),
              direction:
                Increase::CardPayment::Element::CardFinancial::Direction::OrSymbol,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::CardPayment::Element::CardFinancial::NetworkDetails::OrHash,
              network_identifiers:
                Increase::CardPayment::Element::CardFinancial::NetworkIdentifiers::OrHash,
              network_risk_score: T.nilable(Integer),
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category:
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::OrSymbol,
              real_time_decision_id: T.nilable(String),
              terminal_id: T.nilable(String),
              transaction_id: String,
              type:
                Increase::CardPayment::Element::CardFinancial::Type::OrSymbol,
              verification:
                Increase::CardPayment::Element::CardFinancial::Verification::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Financial identifier.
            id:,
            # Whether this financial was approved by Increase, the card network through
            # stand-in processing, or the user through a real-time decision.
            actioner:,
            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            additional_amounts:,
            # The pending amount in the minor unit of the transaction's currency. For dollars,
            # for example, this is cents.
            amount:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's currency.
            currency:,
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
            # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
            # score is from 0 to 999, where 999 is the riskiest.
            network_risk_score:,
            # If the authorization was made in-person with a physical card, the Physical Card
            # that was used.
            physical_card_id:,
            # The pending amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # The processing category describes the intent behind the financial, such as
            # whether it was used for bill payments or an automatic fuel dispenser.
            processing_category:,
            # The identifier of the Real-Time Decision sent to approve or decline this
            # transaction.
            real_time_decision_id:,
            # The terminal identifier (commonly abbreviated as TID) of the terminal the card
            # is transacting with.
            terminal_id:,
            # The identifier of the Transaction associated with this Transaction.
            transaction_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_financial`.
            type:,
            # Fields related to verification of cardholder-provided values.
            verification:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                actioner:
                  Increase::CardPayment::Element::CardFinancial::Actioner::TaggedSymbol,
                additional_amounts:
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts,
                amount: Integer,
                card_payment_id: String,
                currency:
                  Increase::CardPayment::Element::CardFinancial::Currency::TaggedSymbol,
                digital_wallet_token_id: T.nilable(String),
                direction:
                  Increase::CardPayment::Element::CardFinancial::Direction::TaggedSymbol,
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: T.nilable(String),
                merchant_country: String,
                merchant_descriptor: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_details:
                  Increase::CardPayment::Element::CardFinancial::NetworkDetails,
                network_identifiers:
                  Increase::CardPayment::Element::CardFinancial::NetworkIdentifiers,
                network_risk_score: T.nilable(Integer),
                physical_card_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                processing_category:
                  Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol,
                real_time_decision_id: T.nilable(String),
                terminal_id: T.nilable(String),
                transaction_id: String,
                type:
                  Increase::CardPayment::Element::CardFinancial::Type::TaggedSymbol,
                verification:
                  Increase::CardPayment::Element::CardFinancial::Verification
              }
            )
          end
          def to_hash
          end

          # Whether this financial was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          module Actioner
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardFinancial::Actioner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # This object was actioned by the user through a real-time decision.
            USER =
              T.let(
                :user,
                Increase::CardPayment::Element::CardFinancial::Actioner::TaggedSymbol
              )

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(
                :increase,
                Increase::CardPayment::Element::CardFinancial::Actioner::TaggedSymbol
              )

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(
                :network,
                Increase::CardPayment::Element::CardFinancial::Actioner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardFinancial::Actioner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts,
                  Increase::Internal::AnyHash
                )
              end

            # The part of this transaction amount that was for clinic-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Clinic
                )
              )
            end
            attr_reader :clinic

            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Clinic::OrHash
                  )
              ).void
            end
            attr_writer :clinic

            # The part of this transaction amount that was for dental-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Dental
                )
              )
            end
            attr_reader :dental

            sig do
              params(
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Dental::OrHash
                  )
              ).void
            end
            attr_writer :dental

            # The original pre-authorized amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Original
                )
              )
            end
            attr_reader :original

            sig do
              params(
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Original::OrHash
                  )
              ).void
            end
            attr_writer :original

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Prescription
                )
              )
            end
            attr_reader :prescription

            sig do
              params(
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Prescription::OrHash
                  )
              ).void
            end
            attr_writer :prescription

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Surcharge
                )
              )
            end
            attr_reader :surcharge

            sig do
              params(
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Surcharge::OrHash
                  )
              ).void
            end
            attr_writer :surcharge

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalCumulative
                )
              )
            end
            attr_reader :total_cumulative

            sig do
              params(
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalCumulative::OrHash
                  )
              ).void
            end
            attr_writer :total_cumulative

            # The total amount of healthcare-related additional amounts.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalHealthcare
                )
              )
            end
            attr_reader :total_healthcare

            sig do
              params(
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalHealthcare::OrHash
                  )
              ).void
            end
            attr_writer :total_healthcare

            # The part of this transaction amount that was for transit-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Transit
                )
              )
            end
            attr_reader :transit

            sig do
              params(
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Transit::OrHash
                  )
              ).void
            end
            attr_writer :transit

            # An unknown additional amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Unknown
                )
              )
            end
            attr_reader :unknown

            sig do
              params(
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Unknown::OrHash
                  )
              ).void
            end
            attr_writer :unknown

            # The part of this transaction amount that was for vision-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Vision
                )
              )
            end
            attr_reader :vision

            sig do
              params(
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Vision::OrHash
                  )
              ).void
            end
            attr_writer :vision

            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Clinic::OrHash
                  ),
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Dental::OrHash
                  ),
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Original::OrHash
                  ),
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Prescription::OrHash
                  ),
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Surcharge::OrHash
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalCumulative::OrHash
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalHealthcare::OrHash
                  ),
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Transit::OrHash
                  ),
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Unknown::OrHash
                  ),
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Vision::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The part of this transaction amount that was for clinic-related services.
              clinic:,
              # The part of this transaction amount that was for dental-related services.
              dental:,
              # The original pre-authorized amount.
              original:,
              # The part of this transaction amount that was for healthcare prescriptions.
              prescription:,
              # The surcharge amount charged for this transaction by the merchant.
              surcharge:,
              # The total amount of a series of incremental authorizations, optionally provided.
              total_cumulative:,
              # The total amount of healthcare-related additional amounts.
              total_healthcare:,
              # The part of this transaction amount that was for transit-related services.
              transit:,
              # An unknown additional amount.
              unknown:,
              # The part of this transaction amount that was for vision-related services.
              vision:
            )
            end

            sig do
              override.returns(
                {
                  clinic:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Clinic
                    ),
                  dental:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Dental
                    ),
                  original:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Original
                    ),
                  prescription:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Prescription
                    ),
                  surcharge:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Surcharge
                    ),
                  total_cumulative:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalCumulative
                    ),
                  total_healthcare:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalHealthcare
                    ),
                  transit:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Transit
                    ),
                  unknown:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Unknown
                    ),
                  vision:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Vision
                    )
                }
              )
            end
            def to_hash
            end

            class Clinic < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Clinic,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for clinic-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Dental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Dental,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for dental-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Original < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Original,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The original pre-authorized amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Prescription < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Prescription,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for healthcare prescriptions.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Surcharge < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Surcharge,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The surcharge amount charged for this transaction by the merchant.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalCumulative < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalCumulative,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of a series of incremental authorizations, optionally provided.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalHealthcare < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::TotalHealthcare,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of healthcare-related additional amounts.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Transit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Transit,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for transit-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Unknown < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Unknown,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # An unknown additional amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Vision < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::AdditionalAmounts::Vision,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for vision-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardFinancial::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardFinancial::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardFinancial::Currency::TaggedSymbol
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
                  Increase::CardPayment::Element::CardFinancial::Direction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A regular card authorization where funds are debited from the cardholder.
            SETTLEMENT =
              T.let(
                :settlement,
                Increase::CardPayment::Element::CardFinancial::Direction::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::CardPayment::Element::CardFinancial::Direction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardFinancial::Direction::TaggedSymbol
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
                  Increase::CardPayment::Element::CardFinancial::NetworkDetails,
                  Increase::Internal::AnyHash
                )
              end

            # The payment network used to process this card authorization.
            sig do
              returns(
                Increase::CardPayment::Element::CardFinancial::NetworkDetails::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Fields specific to the `pulse` network.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::NetworkDetails::Pulse
                )
              )
            end
            attr_reader :pulse

            sig do
              params(
                pulse:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Pulse::OrHash
                  )
              ).void
            end
            attr_writer :pulse

            # Fields specific to the `visa` network.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa
                )
              )
            end
            attr_reader :visa

            sig do
              params(
                visa:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::OrHash
                  )
              ).void
            end
            attr_writer :visa

            # Fields specific to the `network`.
            sig do
              params(
                category:
                  Increase::CardPayment::Element::CardFinancial::NetworkDetails::Category::OrSymbol,
                pulse:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Pulse::OrHash
                  ),
                visa:
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The payment network used to process this card authorization.
              category:,
              # Fields specific to the `pulse` network.
              pulse:,
              # Fields specific to the `visa` network.
              visa:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Category::TaggedSymbol,
                  pulse:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Pulse
                    ),
                  visa:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa
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
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Visa
              VISA =
                T.let(
                  :visa,
                  Increase::CardPayment::Element::CardFinancial::NetworkDetails::Category::TaggedSymbol
                )

              # Pulse
              PULSE =
                T.let(
                  :pulse,
                  Increase::CardPayment::Element::CardFinancial::NetworkDetails::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Pulse < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Pulse,
                    Increase::Internal::AnyHash
                  )
                end

              # Fields specific to the `pulse` network.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class Visa < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :electronic_commerce_indicator

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )
                )
              end
              attr_accessor :point_of_service_entry_mode

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )
                )
              end
              attr_accessor :stand_in_processing_reason

              # Fields specific to the `visa` network.
              sig do
                params(
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
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
                        Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ),
                    point_of_service_entry_mode:
                      T.nilable(
                        Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ),
                    stand_in_processing_reason:
                      T.nilable(
                        Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER =
                  T.let(
                    :mail_phone_order,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING =
                  T.let(
                    :recurring,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT =
                  T.let(
                    :installment,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER =
                  T.let(
                    :unknown_mail_phone_order,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE =
                  T.let(
                    :secure_electronic_commerce,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  T.let(
                    :non_authenticated_security_transaction_at_3ds_capable_merchant,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION =
                  T.let(
                    :non_authenticated_security_transaction,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION =
                  T.let(
                    :non_secure_transaction,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
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
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Unknown
                UNKNOWN =
                  T.let(
                    :unknown,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Manual key entry
                MANUAL =
                  T.let(
                    :manual,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV =
                  T.let(
                    :magnetic_stripe_no_cvv,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Optical code
                OPTICAL_CODE =
                  T.let(
                    :optical_code,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD =
                  T.let(
                    :integrated_circuit_card,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of chip card
                CONTACTLESS =
                  T.let(
                    :contactless,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE =
                  T.let(
                    :credential_on_file,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read
                MAGNETIC_STRIPE =
                  T.let(
                    :magnetic_stripe,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE =
                  T.let(
                    :contactless_magnetic_stripe,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV =
                  T.let(
                    :integrated_circuit_card_no_cvv,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
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
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR =
                  T.let(
                    :issuer_error,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD =
                  T.let(
                    :invalid_physical_card,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  T.let(
                    :invalid_cardholder_authentication_verification_value,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR =
                  T.let(
                    :internal_visa_error,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  T.let(
                    :merchant_transaction_advisory_service_authentication_required,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                  T.let(
                    :payment_fraud_disruption_acquirer_block,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An unspecific reason for stand-in processing.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardFinancial::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                  Increase::CardPayment::Element::CardFinancial::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

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
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
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
                  authorization_identification_response: T.nilable(String),
                  retrieval_reference_number: T.nilable(String),
                  trace_number: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          # The processing category describes the intent behind the financial, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          module ProcessingCategory
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardFinancial::ProcessingCategory
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
            ACCOUNT_FUNDING =
              T.let(
                :account_funding,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
            AUTOMATIC_FUEL_DISPENSER =
              T.let(
                :automatic_fuel_dispenser,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # A transaction used to pay a bill.
            BILL_PAYMENT =
              T.let(
                :bill_payment,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # Original credit transactions are used to send money to a cardholder.
            ORIGINAL_CREDIT =
              T.let(
                :original_credit,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # A regular purchase.
            PURCHASE =
              T.let(
                :purchase,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # Quasi-cash transactions represent purchases of items which may be convertible to cash.
            QUASI_CASH =
              T.let(
                :quasi_cash,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
            REFUND =
              T.let(
                :refund,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
            CASH_DISBURSEMENT =
              T.let(
                :cash_disbursement,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # A balance inquiry transaction is used to check the balance of an account associated with a card.
            BALANCE_INQUIRY =
              T.let(
                :balance_inquiry,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            # The processing category is unknown.
            UNKNOWN =
              T.let(
                :unknown,
                Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardFinancial::ProcessingCategory::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_financial`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardFinancial::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_FINANCIAL =
              T.let(
                :card_financial,
                Increase::CardPayment::Element::CardFinancial::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardFinancial::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Verification < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardFinancial::Verification,
                  Increase::Internal::AnyHash
                )
              end

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              returns(
                Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode
              )
            end
            attr_reader :card_verification_code

            sig do
              params(
                card_verification_code:
                  Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::OrHash
              ).void
            end
            attr_writer :card_verification_code

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              returns(
                Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress
              )
            end
            attr_reader :cardholder_address

            sig do
              params(
                cardholder_address:
                  Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::OrHash
              ).void
            end
            attr_writer :cardholder_address

            # Fields related to verification of cardholder-provided values.
            sig do
              params(
                card_verification_code:
                  Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::OrHash,
                cardholder_address:
                  Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::OrHash
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
                    Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode,
                  cardholder_address:
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress
                }
              )
            end
            def to_hash
            end

            class CardVerificationCode < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode,
                    Increase::Internal::AnyHash
                  )
                end

              # The result of verifying the Card Verification Code.
              sig do
                returns(
                  Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              sig do
                params(
                  result:
                    Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::Result::OrSymbol
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
                      Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
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
                      Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No card verification code was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code matched the one on file.
                MATCH =
                  T.let(
                    :match,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code did not match the one on file.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardFinancial::Verification::CardVerificationCode::Result::TaggedSymbol
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
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress,
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
                  Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
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
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::OrSymbol
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
                      Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
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
                      Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No address information was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address does not match or was not provided.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                  T.let(
                    :postal_code_match_address_no_match,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code does not match, but the street address matches or was not provided.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                  T.let(
                    :postal_code_no_match_address_match,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address match.
                MATCH =
                  T.let(
                    :match,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address do not match.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address was not verified. (deprecated)
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                  T.let(
                    :postal_code_match_address_not_checked,
                    Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardFinancial::Verification::CardholderAddress::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end

        class CardFuelConfirmation < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardFuelConfirmation,
                Increase::Internal::AnyHash
              )
            end

          # The Card Fuel Confirmation identifier.
          sig { returns(String) }
          attr_accessor :id

          # The identifier for the Card Authorization this updates.
          sig { returns(String) }
          attr_accessor :card_authorization_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          # currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardFuelConfirmation::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The card network used to process this card authorization.
          sig do
            returns(
              Increase::CardPayment::Element::CardFuelConfirmation::Network::TaggedSymbol
            )
          end
          attr_accessor :network

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The identifier of the Pending Transaction associated with this Card Fuel
          # Confirmation.
          sig { returns(T.nilable(String)) }
          attr_accessor :pending_transaction_id

          # A constant representing the object's type. For this resource it will always be
          # `card_fuel_confirmation`.
          sig do
            returns(
              Increase::CardPayment::Element::CardFuelConfirmation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The updated authorization amount after this fuel confirmation, in the minor unit
          # of the transaction's currency. For dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :updated_authorization_amount

          # A Card Fuel Confirmation object. This field will be present in the JSON response
          # if and only if `category` is equal to `card_fuel_confirmation`. Card Fuel
          # Confirmations update the amount of a Card Authorization after a fuel pump
          # transaction is completed.
          sig do
            params(
              id: String,
              card_authorization_id: String,
              currency:
                Increase::CardPayment::Element::CardFuelConfirmation::Currency::OrSymbol,
              network:
                Increase::CardPayment::Element::CardFuelConfirmation::Network::OrSymbol,
              network_identifiers:
                Increase::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers::OrHash,
              pending_transaction_id: T.nilable(String),
              type:
                Increase::CardPayment::Element::CardFuelConfirmation::Type::OrSymbol,
              updated_authorization_amount: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Fuel Confirmation identifier.
            id:,
            # The identifier for the Card Authorization this updates.
            card_authorization_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
            # currency.
            currency:,
            # The card network used to process this card authorization.
            network:,
            # Network-specific identifiers for a specific request or transaction.
            network_identifiers:,
            # The identifier of the Pending Transaction associated with this Card Fuel
            # Confirmation.
            pending_transaction_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_fuel_confirmation`.
            type:,
            # The updated authorization amount after this fuel confirmation, in the minor unit
            # of the transaction's currency. For dollars, for example, this is cents.
            updated_authorization_amount:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                card_authorization_id: String,
                currency:
                  Increase::CardPayment::Element::CardFuelConfirmation::Currency::TaggedSymbol,
                network:
                  Increase::CardPayment::Element::CardFuelConfirmation::Network::TaggedSymbol,
                network_identifiers:
                  Increase::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers,
                pending_transaction_id: T.nilable(String),
                type:
                  Increase::CardPayment::Element::CardFuelConfirmation::Type::TaggedSymbol,
                updated_authorization_amount: Integer
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardFuelConfirmation::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardFuelConfirmation::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardFuelConfirmation::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The card network used to process this card authorization.
          module Network
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardFuelConfirmation::Network
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::CardPayment::Element::CardFuelConfirmation::Network::TaggedSymbol
              )

            # Pulse
            PULSE =
              T.let(
                :pulse,
                Increase::CardPayment::Element::CardFuelConfirmation::Network::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardFuelConfirmation::Network::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardFuelConfirmation::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

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
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
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
                  authorization_identification_response: T.nilable(String),
                  retrieval_reference_number: T.nilable(String),
                  trace_number: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_fuel_confirmation`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardFuelConfirmation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_FUEL_CONFIRMATION =
              T.let(
                :card_fuel_confirmation,
                Increase::CardPayment::Element::CardFuelConfirmation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardFuelConfirmation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardIncrement < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardIncrement,
                Increase::Internal::AnyHash
              )
            end

          # The Card Increment identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          sig do
            returns(
              Increase::CardPayment::Element::CardIncrement::Actioner::TaggedSymbol
            )
          end
          attr_accessor :actioner

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardIncrement::AdditionalAmounts
            )
          end
          attr_reader :additional_amounts

          sig do
            params(
              additional_amounts:
                Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::OrHash
            ).void
          end
          attr_writer :additional_amounts

          # The amount of this increment in the minor unit of the transaction's currency.
          # For dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The identifier for the Card Authorization this increments.
          sig { returns(String) }
          attr_accessor :card_authorization_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          # currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardIncrement::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # The card network used to process this card authorization.
          sig do
            returns(
              Increase::CardPayment::Element::CardIncrement::Network::TaggedSymbol
            )
          end
          attr_accessor :network

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardIncrement::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardIncrement::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # The identifier of the Pending Transaction associated with this Card Increment.
          sig { returns(T.nilable(String)) }
          attr_accessor :pending_transaction_id

          # The amount of this increment in the minor unit of the transaction's presentment
          # currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # The identifier of the Real-Time Decision sent to approve or decline this
          # incremental authorization.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # A constant representing the object's type. For this resource it will always be
          # `card_increment`.
          sig do
            returns(
              Increase::CardPayment::Element::CardIncrement::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The updated authorization amount after this increment, in the minor unit of the
          # transaction's currency. For dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :updated_authorization_amount

          # A Card Increment object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_increment`. Card Increments increase the
          # pending amount of an authorized transaction.
          sig do
            params(
              id: String,
              actioner:
                Increase::CardPayment::Element::CardIncrement::Actioner::OrSymbol,
              additional_amounts:
                Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::OrHash,
              amount: Integer,
              card_authorization_id: String,
              currency:
                Increase::CardPayment::Element::CardIncrement::Currency::OrSymbol,
              network:
                Increase::CardPayment::Element::CardIncrement::Network::OrSymbol,
              network_identifiers:
                Increase::CardPayment::Element::CardIncrement::NetworkIdentifiers::OrHash,
              network_risk_score: T.nilable(Integer),
              pending_transaction_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              real_time_decision_id: T.nilable(String),
              type:
                Increase::CardPayment::Element::CardIncrement::Type::OrSymbol,
              updated_authorization_amount: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Increment identifier.
            id:,
            # Whether this authorization was approved by Increase, the card network through
            # stand-in processing, or the user through a real-time decision.
            actioner:,
            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            additional_amounts:,
            # The amount of this increment in the minor unit of the transaction's currency.
            # For dollars, for example, this is cents.
            amount:,
            # The identifier for the Card Authorization this increments.
            card_authorization_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
            # currency.
            currency:,
            # The card network used to process this card authorization.
            network:,
            # Network-specific identifiers for a specific request or transaction.
            network_identifiers:,
            # The risk score generated by the card network. For Visa this is the Visa Advanced
            # Authorization risk score, from 0 to 99, where 99 is the riskiest.
            network_risk_score:,
            # The identifier of the Pending Transaction associated with this Card Increment.
            pending_transaction_id:,
            # The amount of this increment in the minor unit of the transaction's presentment
            # currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # The identifier of the Real-Time Decision sent to approve or decline this
            # incremental authorization.
            real_time_decision_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_increment`.
            type:,
            # The updated authorization amount after this increment, in the minor unit of the
            # transaction's currency. For dollars, for example, this is cents.
            updated_authorization_amount:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                actioner:
                  Increase::CardPayment::Element::CardIncrement::Actioner::TaggedSymbol,
                additional_amounts:
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts,
                amount: Integer,
                card_authorization_id: String,
                currency:
                  Increase::CardPayment::Element::CardIncrement::Currency::TaggedSymbol,
                network:
                  Increase::CardPayment::Element::CardIncrement::Network::TaggedSymbol,
                network_identifiers:
                  Increase::CardPayment::Element::CardIncrement::NetworkIdentifiers,
                network_risk_score: T.nilable(Integer),
                pending_transaction_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                real_time_decision_id: T.nilable(String),
                type:
                  Increase::CardPayment::Element::CardIncrement::Type::TaggedSymbol,
                updated_authorization_amount: Integer
              }
            )
          end
          def to_hash
          end

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          module Actioner
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardIncrement::Actioner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # This object was actioned by the user through a real-time decision.
            USER =
              T.let(
                :user,
                Increase::CardPayment::Element::CardIncrement::Actioner::TaggedSymbol
              )

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(
                :increase,
                Increase::CardPayment::Element::CardIncrement::Actioner::TaggedSymbol
              )

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(
                :network,
                Increase::CardPayment::Element::CardIncrement::Actioner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardIncrement::Actioner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts,
                  Increase::Internal::AnyHash
                )
              end

            # The part of this transaction amount that was for clinic-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic
                )
              )
            end
            attr_reader :clinic

            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic::OrHash
                  )
              ).void
            end
            attr_writer :clinic

            # The part of this transaction amount that was for dental-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental
                )
              )
            end
            attr_reader :dental

            sig do
              params(
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental::OrHash
                  )
              ).void
            end
            attr_writer :dental

            # The original pre-authorized amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Original
                )
              )
            end
            attr_reader :original

            sig do
              params(
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Original::OrHash
                  )
              ).void
            end
            attr_writer :original

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription
                )
              )
            end
            attr_reader :prescription

            sig do
              params(
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription::OrHash
                  )
              ).void
            end
            attr_writer :prescription

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge
                )
              )
            end
            attr_reader :surcharge

            sig do
              params(
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge::OrHash
                  )
              ).void
            end
            attr_writer :surcharge

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative
                )
              )
            end
            attr_reader :total_cumulative

            sig do
              params(
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative::OrHash
                  )
              ).void
            end
            attr_writer :total_cumulative

            # The total amount of healthcare-related additional amounts.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare
                )
              )
            end
            attr_reader :total_healthcare

            sig do
              params(
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare::OrHash
                  )
              ).void
            end
            attr_writer :total_healthcare

            # The part of this transaction amount that was for transit-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit
                )
              )
            end
            attr_reader :transit

            sig do
              params(
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit::OrHash
                  )
              ).void
            end
            attr_writer :transit

            # An unknown additional amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown
                )
              )
            end
            attr_reader :unknown

            sig do
              params(
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown::OrHash
                  )
              ).void
            end
            attr_writer :unknown

            # The part of this transaction amount that was for vision-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision
                )
              )
            end
            attr_reader :vision

            sig do
              params(
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision::OrHash
                  )
              ).void
            end
            attr_writer :vision

            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic::OrHash
                  ),
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental::OrHash
                  ),
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Original::OrHash
                  ),
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription::OrHash
                  ),
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge::OrHash
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative::OrHash
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare::OrHash
                  ),
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit::OrHash
                  ),
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown::OrHash
                  ),
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The part of this transaction amount that was for clinic-related services.
              clinic:,
              # The part of this transaction amount that was for dental-related services.
              dental:,
              # The original pre-authorized amount.
              original:,
              # The part of this transaction amount that was for healthcare prescriptions.
              prescription:,
              # The surcharge amount charged for this transaction by the merchant.
              surcharge:,
              # The total amount of a series of incremental authorizations, optionally provided.
              total_cumulative:,
              # The total amount of healthcare-related additional amounts.
              total_healthcare:,
              # The part of this transaction amount that was for transit-related services.
              transit:,
              # An unknown additional amount.
              unknown:,
              # The part of this transaction amount that was for vision-related services.
              vision:
            )
            end

            sig do
              override.returns(
                {
                  clinic:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic
                    ),
                  dental:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental
                    ),
                  original:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Original
                    ),
                  prescription:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription
                    ),
                  surcharge:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge
                    ),
                  total_cumulative:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative
                    ),
                  total_healthcare:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare
                    ),
                  transit:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit
                    ),
                  unknown:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown
                    ),
                  vision:
                    T.nilable(
                      Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision
                    )
                }
              )
            end
            def to_hash
            end

            class Clinic < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Clinic,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for clinic-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Dental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Dental,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for dental-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Original < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Original,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The original pre-authorized amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Prescription < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Prescription,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for healthcare prescriptions.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Surcharge < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Surcharge,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The surcharge amount charged for this transaction by the merchant.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalCumulative < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalCumulative,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of a series of incremental authorizations, optionally provided.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalHealthcare < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::TotalHealthcare,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of healthcare-related additional amounts.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Transit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Transit,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for transit-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Unknown < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Unknown,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # An unknown additional amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Vision < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardIncrement::AdditionalAmounts::Vision,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for vision-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the increment's
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardIncrement::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardIncrement::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardIncrement::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The card network used to process this card authorization.
          module Network
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardIncrement::Network
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::CardPayment::Element::CardIncrement::Network::TaggedSymbol
              )

            # Pulse
            PULSE =
              T.let(
                :pulse,
                Increase::CardPayment::Element::CardIncrement::Network::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardIncrement::Network::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardIncrement::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

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
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
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
                  authorization_identification_response: T.nilable(String),
                  retrieval_reference_number: T.nilable(String),
                  trace_number: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_increment`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardIncrement::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_INCREMENT =
              T.let(
                :card_increment,
                Increase::CardPayment::Element::CardIncrement::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardIncrement::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardRefund < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardRefund,
                Increase::Internal::AnyHash
              )
            end

          # The Card Refund identifier.
          sig { returns(String) }
          attr_accessor :id

          # The amount in the minor unit of the transaction's settlement currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # Cashback debited for this transaction, if eligible. Cashback is paid out in
          # aggregate, monthly.
          sig do
            returns(
              T.nilable(Increase::CardPayment::Element::CardRefund::Cashback)
            )
          end
          attr_reader :cashback

          sig do
            params(
              cashback:
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::Cashback::OrHash
                )
            ).void
          end
          attr_writer :cashback

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardRefund::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # Interchange assessed as a part of this transaciton.
          sig do
            returns(
              T.nilable(Increase::CardPayment::Element::CardRefund::Interchange)
            )
          end
          attr_reader :interchange

          sig do
            params(
              interchange:
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::Interchange::OrHash
                )
            ).void
          end
          attr_writer :interchange

          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_acceptor_id

          # The 4-digit MCC describing the merchant's business.
          sig { returns(String) }
          attr_accessor :merchant_category_code

          # The city the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_city

          # The country the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_country

          # The name of the merchant.
          sig { returns(String) }
          attr_accessor :merchant_name

          # The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_postal_code

          # The state the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_state

          # Network-specific identifiers for this refund.
          sig do
            returns(
              Increase::CardPayment::Element::CardRefund::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardRefund::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # Additional details about the card purchase, such as tax and industry-specific
          # fields.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardRefund::PurchaseDetails
              )
            )
          end
          attr_reader :purchase_details

          sig do
            params(
              purchase_details:
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::OrHash
                )
            ).void
          end
          attr_writer :purchase_details

          # The identifier of the Transaction associated with this Transaction.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A constant representing the object's type. For this resource it will always be
          # `card_refund`.
          sig do
            returns(
              Increase::CardPayment::Element::CardRefund::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A Card Refund object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_refund`. Card Refunds move money back to
          # the cardholder. While they are usually connected to a Card Settlement an
          # acquirer can also refund money directly to a card without relation to a
          # transaction.
          sig do
            params(
              id: String,
              amount: Integer,
              card_payment_id: String,
              cashback:
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::Cashback::OrHash
                ),
              currency:
                Increase::CardPayment::Element::CardRefund::Currency::OrSymbol,
              interchange:
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::Interchange::OrHash
                ),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: String,
              merchant_country: String,
              merchant_name: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_identifiers:
                Increase::CardPayment::Element::CardRefund::NetworkIdentifiers::OrHash,
              presentment_amount: Integer,
              presentment_currency: String,
              purchase_details:
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::OrHash
                ),
              transaction_id: String,
              type: Increase::CardPayment::Element::CardRefund::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Refund identifier.
            id:,
            # The amount in the minor unit of the transaction's settlement currency. For
            # dollars, for example, this is cents.
            amount:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # Cashback debited for this transaction, if eligible. Cashback is paid out in
            # aggregate, monthly.
            cashback:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's settlement currency.
            currency:,
            # Interchange assessed as a part of this transaciton.
            interchange:,
            # The merchant identifier (commonly abbreviated as MID) of the merchant the card
            # is transacting with.
            merchant_acceptor_id:,
            # The 4-digit MCC describing the merchant's business.
            merchant_category_code:,
            # The city the merchant resides in.
            merchant_city:,
            # The country the merchant resides in.
            merchant_country:,
            # The name of the merchant.
            merchant_name:,
            # The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
            merchant_postal_code:,
            # The state the merchant resides in.
            merchant_state:,
            # Network-specific identifiers for this refund.
            network_identifiers:,
            # The amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # Additional details about the card purchase, such as tax and industry-specific
            # fields.
            purchase_details:,
            # The identifier of the Transaction associated with this Transaction.
            transaction_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_refund`.
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                amount: Integer,
                card_payment_id: String,
                cashback:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::Cashback
                  ),
                currency:
                  Increase::CardPayment::Element::CardRefund::Currency::TaggedSymbol,
                interchange:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::Interchange
                  ),
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: String,
                merchant_country: String,
                merchant_name: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_identifiers:
                  Increase::CardPayment::Element::CardRefund::NetworkIdentifiers,
                presentment_amount: Integer,
                presentment_currency: String,
                purchase_details:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails
                  ),
                transaction_id: String,
                type:
                  Increase::CardPayment::Element::CardRefund::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          class Cashback < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardRefund::Cashback,
                  Increase::Internal::AnyHash
                )
              end

            # The cashback amount given as a string containing a decimal number. The amount is
            # a positive number if it will be credited to you (e.g., settlements) and a
            # negative number if it will be debited (e.g., refunds).
            sig { returns(String) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            sig do
              returns(
                Increase::CardPayment::Element::CardRefund::Cashback::Currency::TaggedSymbol
              )
            end
            attr_accessor :currency

            # Cashback debited for this transaction, if eligible. Cashback is paid out in
            # aggregate, monthly.
            sig do
              params(
                amount: String,
                currency:
                  Increase::CardPayment::Element::CardRefund::Cashback::Currency::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The cashback amount given as a string containing a decimal number. The amount is
              # a positive number if it will be credited to you (e.g., settlements) and a
              # negative number if it will be debited (e.g., refunds).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
              currency:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  currency:
                    Increase::CardPayment::Element::CardRefund::Cashback::Currency::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            module Currency
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardPayment::Element::CardRefund::Cashback::Currency
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # US Dollar (USD)
              USD =
                T.let(
                  :USD,
                  Increase::CardPayment::Element::CardRefund::Cashback::Currency::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardRefund::Cashback::Currency::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardRefund::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardRefund::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardRefund::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Interchange < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardRefund::Interchange,
                  Increase::Internal::AnyHash
                )
              end

            # The interchange amount given as a string containing a decimal number in major
            # units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
            # credited to Increase (e.g., settlements) and a negative number if it is debited
            # (e.g., refunds).
            sig { returns(String) }
            attr_accessor :amount

            # The card network specific interchange code.
            sig { returns(T.nilable(String)) }
            attr_accessor :code

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            sig do
              returns(
                Increase::CardPayment::Element::CardRefund::Interchange::Currency::TaggedSymbol
              )
            end
            attr_accessor :currency

            # Interchange assessed as a part of this transaciton.
            sig do
              params(
                amount: String,
                code: T.nilable(String),
                currency:
                  Increase::CardPayment::Element::CardRefund::Interchange::Currency::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The interchange amount given as a string containing a decimal number in major
              # units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
              # credited to Increase (e.g., settlements) and a negative number if it is debited
              # (e.g., refunds).
              amount:,
              # The card network specific interchange code.
              code:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
              # reimbursement.
              currency:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  code: T.nilable(String),
                  currency:
                    Increase::CardPayment::Element::CardRefund::Interchange::Currency::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            module Currency
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardPayment::Element::CardRefund::Interchange::Currency
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # US Dollar (USD)
              USD =
                T.let(
                  :USD,
                  Increase::CardPayment::Element::CardRefund::Interchange::Currency::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardRefund::Interchange::Currency::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardRefund::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # A network assigned business ID that identifies the acquirer that processed this
            # transaction.
            sig { returns(String) }
            attr_accessor :acquirer_business_id

            # A globally unique identifier for this settlement.
            sig { returns(String) }
            attr_accessor :acquirer_reference_number

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            sig { returns(T.nilable(String)) }
            attr_accessor :transaction_id

            # Network-specific identifiers for this refund.
            sig do
              params(
                acquirer_business_id: String,
                acquirer_reference_number: String,
                authorization_identification_response: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # A network assigned business ID that identifies the acquirer that processed this
              # transaction.
              acquirer_business_id:,
              # A globally unique identifier for this settlement.
              acquirer_reference_number:,
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
              # A globally unique transaction identifier provided by the card network, used
              # across multiple life-cycle requests.
              transaction_id:
            )
            end

            sig do
              override.returns(
                {
                  acquirer_business_id: String,
                  acquirer_reference_number: String,
                  authorization_identification_response: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          class PurchaseDetails < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails,
                  Increase::Internal::AnyHash
                )
              end

            # Fields specific to car rentals.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental
                )
              )
            end
            attr_reader :car_rental

            sig do
              params(
                car_rental:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::OrHash
                  )
              ).void
            end
            attr_writer :car_rental

            # An identifier from the merchant for the customer or consumer.
            sig { returns(T.nilable(String)) }
            attr_accessor :customer_reference_identifier

            # The state or provincial tax amount in minor units.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :local_tax_amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            # assessed.
            sig { returns(T.nilable(String)) }
            attr_accessor :local_tax_currency

            # Fields specific to lodging.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging
                )
              )
            end
            attr_reader :lodging

            sig do
              params(
                lodging:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::OrHash
                  )
              ).void
            end
            attr_writer :lodging

            # The national tax amount in minor units.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :national_tax_amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            # assessed.
            sig { returns(T.nilable(String)) }
            attr_accessor :national_tax_currency

            # An identifier from the merchant for the purchase to the issuer and cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :purchase_identifier

            # The format of the purchase identifier.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )
              )
            end
            attr_accessor :purchase_identifier_format

            # Fields specific to travel.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel
                )
              )
            end
            attr_reader :travel

            sig do
              params(
                travel:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::OrHash
                  )
              ).void
            end
            attr_writer :travel

            # Additional details about the card purchase, such as tax and industry-specific
            # fields.
            sig do
              params(
                car_rental:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::OrHash
                  ),
                customer_reference_identifier: T.nilable(String),
                local_tax_amount: T.nilable(Integer),
                local_tax_currency: T.nilable(String),
                lodging:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::OrHash
                  ),
                national_tax_amount: T.nilable(Integer),
                national_tax_currency: T.nilable(String),
                purchase_identifier: T.nilable(String),
                purchase_identifier_format:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::OrSymbol
                  ),
                travel:
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Fields specific to car rentals.
              car_rental:,
              # An identifier from the merchant for the customer or consumer.
              customer_reference_identifier:,
              # The state or provincial tax amount in minor units.
              local_tax_amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
              # assessed.
              local_tax_currency:,
              # Fields specific to lodging.
              lodging:,
              # The national tax amount in minor units.
              national_tax_amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
              # assessed.
              national_tax_currency:,
              # An identifier from the merchant for the purchase to the issuer and cardholder.
              purchase_identifier:,
              # The format of the purchase identifier.
              purchase_identifier_format:,
              # Fields specific to travel.
              travel:
            )
            end

            sig do
              override.returns(
                {
                  car_rental:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental
                    ),
                  customer_reference_identifier: T.nilable(String),
                  local_tax_amount: T.nilable(Integer),
                  local_tax_currency: T.nilable(String),
                  lodging:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging
                    ),
                  national_tax_amount: T.nilable(Integer),
                  national_tax_currency: T.nilable(String),
                  purchase_identifier: T.nilable(String),
                  purchase_identifier_format:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                    ),
                  travel:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel
                    )
                }
              )
            end
            def to_hash
            end

            class CarRental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental,
                    Increase::Internal::AnyHash
                  )
                end

              # Code indicating the vehicle's class.
              sig { returns(T.nilable(String)) }
              attr_accessor :car_class_code

              # Date the customer picked up the car or, in the case of a no-show or pre-pay
              # transaction, the scheduled pick up date.
              sig { returns(T.nilable(Date)) }
              attr_accessor :checkout_date

              # Daily rate being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :daily_rental_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              # rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :daily_rental_rate_currency

              # Number of days the vehicle was rented.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :days_rented

              # Additional charges (gas, late fee, etc.) being billed.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )
                )
              end
              attr_accessor :extra_charges

              # Fuel charges for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :fuel_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              # assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :fuel_charges_currency

              # Any insurance being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :insurance_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
              # charges assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :insurance_charges_currency

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :no_show_indicator

              # Charges for returning the vehicle at a different location than where it was
              # picked up.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :one_way_drop_off_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
              # drop-off charges assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :one_way_drop_off_charges_currency

              # Name of the person renting the vehicle.
              sig { returns(T.nilable(String)) }
              attr_accessor :renter_name

              # Weekly rate being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :weekly_rental_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
              # rental rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :weekly_rental_rate_currency

              # Fields specific to car rentals.
              sig do
                params(
                  car_class_code: T.nilable(String),
                  checkout_date: T.nilable(Date),
                  daily_rental_rate_amount: T.nilable(Integer),
                  daily_rental_rate_currency: T.nilable(String),
                  days_rented: T.nilable(Integer),
                  extra_charges:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::OrSymbol
                    ),
                  fuel_charges_amount: T.nilable(Integer),
                  fuel_charges_currency: T.nilable(String),
                  insurance_charges_amount: T.nilable(Integer),
                  insurance_charges_currency: T.nilable(String),
                  no_show_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::OrSymbol
                    ),
                  one_way_drop_off_charges_amount: T.nilable(Integer),
                  one_way_drop_off_charges_currency: T.nilable(String),
                  renter_name: T.nilable(String),
                  weekly_rental_rate_amount: T.nilable(Integer),
                  weekly_rental_rate_currency: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Code indicating the vehicle's class.
                car_class_code:,
                # Date the customer picked up the car or, in the case of a no-show or pre-pay
                # transaction, the scheduled pick up date.
                checkout_date:,
                # Daily rate being charged for the vehicle.
                daily_rental_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
                # rate.
                daily_rental_rate_currency:,
                # Number of days the vehicle was rented.
                days_rented:,
                # Additional charges (gas, late fee, etc.) being billed.
                extra_charges:,
                # Fuel charges for the vehicle.
                fuel_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
                # assessed.
                fuel_charges_currency:,
                # Any insurance being charged for the vehicle.
                insurance_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
                # charges assessed.
                insurance_charges_currency:,
                # An indicator that the cardholder is being billed for a reserved vehicle that was
                # not actually rented (that is, a "no-show" charge).
                no_show_indicator:,
                # Charges for returning the vehicle at a different location than where it was
                # picked up.
                one_way_drop_off_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
                # drop-off charges assessed.
                one_way_drop_off_charges_currency:,
                # Name of the person renting the vehicle.
                renter_name:,
                # Weekly rate being charged for the vehicle.
                weekly_rental_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
                # rental rate.
                weekly_rental_rate_currency:
              )
              end

              sig do
                override.returns(
                  {
                    car_class_code: T.nilable(String),
                    checkout_date: T.nilable(Date),
                    daily_rental_rate_amount: T.nilable(Integer),
                    daily_rental_rate_currency: T.nilable(String),
                    days_rented: T.nilable(Integer),
                    extra_charges:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                      ),
                    fuel_charges_amount: T.nilable(Integer),
                    fuel_charges_currency: T.nilable(String),
                    insurance_charges_amount: T.nilable(Integer),
                    insurance_charges_currency: T.nilable(String),
                    no_show_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                      ),
                    one_way_drop_off_charges_amount: T.nilable(Integer),
                    one_way_drop_off_charges_currency: T.nilable(String),
                    renter_name: T.nilable(String),
                    weekly_rental_rate_amount: T.nilable(Integer),
                    weekly_rental_rate_currency: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Additional charges (gas, late fee, etc.) being billed.
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No extra charge
                NO_EXTRA_CHARGE =
                  T.let(
                    :no_extra_charge,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Gas
                GAS =
                  T.let(
                    :gas,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Extra mileage
                EXTRA_MILEAGE =
                  T.let(
                    :extra_mileage,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Late return
                LATE_RETURN =
                  T.let(
                    :late_return,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # One way service fee
                ONE_WAY_SERVICE_FEE =
                  T.let(
                    :one_way_service_fee,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Parking violation
                PARKING_VIOLATION =
                  T.let(
                    :parking_violation,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not applicable
                NOT_APPLICABLE =
                  T.let(
                    :not_applicable,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )

                # No show for specialized vehicle
                NO_SHOW_FOR_SPECIALIZED_VEHICLE =
                  T.let(
                    :no_show_for_specialized_vehicle,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Lodging < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging,
                    Increase::Internal::AnyHash
                  )
                end

              # Date the customer checked in.
              sig { returns(T.nilable(Date)) }
              attr_accessor :check_in_date

              # Daily rate being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :daily_room_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
              # rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :daily_room_rate_currency

              # Additional charges (phone, late check-out, etc.) being billed.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )
                )
              end
              attr_accessor :extra_charges

              # Folio cash advances for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :folio_cash_advances_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
              # advances.
              sig { returns(T.nilable(String)) }
              attr_accessor :folio_cash_advances_currency

              # Food and beverage charges for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :food_beverage_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
              # beverage charges.
              sig { returns(T.nilable(String)) }
              attr_accessor :food_beverage_charges_currency

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :no_show_indicator

              # Prepaid expenses being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :prepaid_expenses_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
              # expenses.
              sig { returns(T.nilable(String)) }
              attr_accessor :prepaid_expenses_currency

              # Number of nights the room was rented.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :room_nights

              # Total room tax being charged.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :total_room_tax_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
              # tax.
              sig { returns(T.nilable(String)) }
              attr_accessor :total_room_tax_currency

              # Total tax being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :total_tax_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
              # assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :total_tax_currency

              # Fields specific to lodging.
              sig do
                params(
                  check_in_date: T.nilable(Date),
                  daily_room_rate_amount: T.nilable(Integer),
                  daily_room_rate_currency: T.nilable(String),
                  extra_charges:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::OrSymbol
                    ),
                  folio_cash_advances_amount: T.nilable(Integer),
                  folio_cash_advances_currency: T.nilable(String),
                  food_beverage_charges_amount: T.nilable(Integer),
                  food_beverage_charges_currency: T.nilable(String),
                  no_show_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::OrSymbol
                    ),
                  prepaid_expenses_amount: T.nilable(Integer),
                  prepaid_expenses_currency: T.nilable(String),
                  room_nights: T.nilable(Integer),
                  total_room_tax_amount: T.nilable(Integer),
                  total_room_tax_currency: T.nilable(String),
                  total_tax_amount: T.nilable(Integer),
                  total_tax_currency: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Date the customer checked in.
                check_in_date:,
                # Daily rate being charged for the room.
                daily_room_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
                # rate.
                daily_room_rate_currency:,
                # Additional charges (phone, late check-out, etc.) being billed.
                extra_charges:,
                # Folio cash advances for the room.
                folio_cash_advances_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
                # advances.
                folio_cash_advances_currency:,
                # Food and beverage charges for the room.
                food_beverage_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
                # beverage charges.
                food_beverage_charges_currency:,
                # Indicator that the cardholder is being billed for a reserved room that was not
                # actually used.
                no_show_indicator:,
                # Prepaid expenses being charged for the room.
                prepaid_expenses_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
                # expenses.
                prepaid_expenses_currency:,
                # Number of nights the room was rented.
                room_nights:,
                # Total room tax being charged.
                total_room_tax_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
                # tax.
                total_room_tax_currency:,
                # Total tax being charged for the room.
                total_tax_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
                # assessed.
                total_tax_currency:
              )
              end

              sig do
                override.returns(
                  {
                    check_in_date: T.nilable(Date),
                    daily_room_rate_amount: T.nilable(Integer),
                    daily_room_rate_currency: T.nilable(String),
                    extra_charges:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                      ),
                    folio_cash_advances_amount: T.nilable(Integer),
                    folio_cash_advances_currency: T.nilable(String),
                    food_beverage_charges_amount: T.nilable(Integer),
                    food_beverage_charges_currency: T.nilable(String),
                    no_show_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                      ),
                    prepaid_expenses_amount: T.nilable(Integer),
                    prepaid_expenses_currency: T.nilable(String),
                    room_nights: T.nilable(Integer),
                    total_room_tax_amount: T.nilable(Integer),
                    total_room_tax_currency: T.nilable(String),
                    total_tax_amount: T.nilable(Integer),
                    total_tax_currency: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Additional charges (phone, late check-out, etc.) being billed.
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No extra charge
                NO_EXTRA_CHARGE =
                  T.let(
                    :no_extra_charge,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Restaurant
                RESTAURANT =
                  T.let(
                    :restaurant,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Gift shop
                GIFT_SHOP =
                  T.let(
                    :gift_shop,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Mini bar
                MINI_BAR =
                  T.let(
                    :mini_bar,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Telephone
                TELEPHONE =
                  T.let(
                    :telephone,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Other
                OTHER =
                  T.let(
                    :other,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Laundry
                LAUNDRY =
                  T.let(
                    :laundry,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not applicable
                NOT_APPLICABLE =
                  T.let(
                    :not_applicable,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )

                # No show
                NO_SHOW =
                  T.let(
                    :no_show,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            # The format of the purchase identifier.
            module PurchaseIdentifierFormat
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Free text
              FREE_TEXT =
                T.let(
                  :free_text,
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Order number
              ORDER_NUMBER =
                T.let(
                  :order_number,
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Rental agreement number
              RENTAL_AGREEMENT_NUMBER =
                T.let(
                  :rental_agreement_number,
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Hotel folio number
              HOTEL_FOLIO_NUMBER =
                T.let(
                  :hotel_folio_number,
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Invoice number
              INVOICE_NUMBER =
                T.let(
                  :invoice_number,
                  Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Travel < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel,
                    Increase::Internal::AnyHash
                  )
                end

              # Ancillary purchases in addition to the airfare.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary
                  )
                )
              end
              attr_reader :ancillary

              sig do
                params(
                  ancillary:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::OrHash
                    )
                ).void
              end
              attr_writer :ancillary

              # Indicates the computerized reservation system used to book the ticket.
              sig { returns(T.nilable(String)) }
              attr_accessor :computerized_reservation_system

              # Indicates the reason for a credit to the cardholder.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :credit_reason_indicator

              # Date of departure.
              sig { returns(T.nilable(Date)) }
              attr_accessor :departure_date

              # Code for the originating city or airport.
              sig { returns(T.nilable(String)) }
              attr_accessor :origination_city_airport_code

              # Name of the passenger.
              sig { returns(T.nilable(String)) }
              attr_accessor :passenger_name

              # Indicates whether this ticket is non-refundable.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :restricted_ticket_indicator

              # Indicates why a ticket was changed.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :ticket_change_indicator

              # Ticket number.
              sig { returns(T.nilable(String)) }
              attr_accessor :ticket_number

              # Code for the travel agency if the ticket was issued by a travel agency.
              sig { returns(T.nilable(String)) }
              attr_accessor :travel_agency_code

              # Name of the travel agency if the ticket was issued by a travel agency.
              sig { returns(T.nilable(String)) }
              attr_accessor :travel_agency_name

              # Fields specific to each leg of the journey.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg
                    ]
                  )
                )
              end
              attr_accessor :trip_legs

              # Fields specific to travel.
              sig do
                params(
                  ancillary:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::OrHash
                    ),
                  computerized_reservation_system: T.nilable(String),
                  credit_reason_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::OrSymbol
                    ),
                  departure_date: T.nilable(Date),
                  origination_city_airport_code: T.nilable(String),
                  passenger_name: T.nilable(String),
                  restricted_ticket_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::OrSymbol
                    ),
                  ticket_change_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::OrSymbol
                    ),
                  ticket_number: T.nilable(String),
                  travel_agency_code: T.nilable(String),
                  travel_agency_name: T.nilable(String),
                  trip_legs:
                    T.nilable(
                      T::Array[
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::OrHash
                      ]
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Ancillary purchases in addition to the airfare.
                ancillary:,
                # Indicates the computerized reservation system used to book the ticket.
                computerized_reservation_system:,
                # Indicates the reason for a credit to the cardholder.
                credit_reason_indicator:,
                # Date of departure.
                departure_date:,
                # Code for the originating city or airport.
                origination_city_airport_code:,
                # Name of the passenger.
                passenger_name:,
                # Indicates whether this ticket is non-refundable.
                restricted_ticket_indicator:,
                # Indicates why a ticket was changed.
                ticket_change_indicator:,
                # Ticket number.
                ticket_number:,
                # Code for the travel agency if the ticket was issued by a travel agency.
                travel_agency_code:,
                # Name of the travel agency if the ticket was issued by a travel agency.
                travel_agency_name:,
                # Fields specific to each leg of the journey.
                trip_legs:
              )
              end

              sig do
                override.returns(
                  {
                    ancillary:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary
                      ),
                    computerized_reservation_system: T.nilable(String),
                    credit_reason_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                      ),
                    departure_date: T.nilable(Date),
                    origination_city_airport_code: T.nilable(String),
                    passenger_name: T.nilable(String),
                    restricted_ticket_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                      ),
                    ticket_change_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                      ),
                    ticket_number: T.nilable(String),
                    travel_agency_code: T.nilable(String),
                    travel_agency_name: T.nilable(String),
                    trip_legs:
                      T.nilable(
                        T::Array[
                          Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg
                        ]
                      )
                  }
                )
              end
              def to_hash
              end

              class Ancillary < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary,
                      Increase::Internal::AnyHash
                    )
                  end

                # If this purchase has a connection or relationship to another purchase, such as a
                # baggage fee for a passenger transport ticket, this field should contain the
                # ticket document number for the other purchase.
                sig { returns(T.nilable(String)) }
                attr_accessor :connected_ticket_document_number

                # Indicates the reason for a credit to the cardholder.
                sig do
                  returns(
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )
                  )
                end
                attr_accessor :credit_reason_indicator

                # Name of the passenger or description of the ancillary purchase.
                sig { returns(T.nilable(String)) }
                attr_accessor :passenger_name_or_description

                # Additional travel charges, such as baggage fees.
                sig do
                  returns(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service
                    ]
                  )
                end
                attr_accessor :services

                # Ticket document number.
                sig { returns(T.nilable(String)) }
                attr_accessor :ticket_document_number

                # Ancillary purchases in addition to the airfare.
                sig do
                  params(
                    connected_ticket_document_number: T.nilable(String),
                    credit_reason_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::OrSymbol
                      ),
                    passenger_name_or_description: T.nilable(String),
                    services:
                      T::Array[
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::OrHash
                      ],
                    ticket_document_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # If this purchase has a connection or relationship to another purchase, such as a
                  # baggage fee for a passenger transport ticket, this field should contain the
                  # ticket document number for the other purchase.
                  connected_ticket_document_number:,
                  # Indicates the reason for a credit to the cardholder.
                  credit_reason_indicator:,
                  # Name of the passenger or description of the ancillary purchase.
                  passenger_name_or_description:,
                  # Additional travel charges, such as baggage fees.
                  services:,
                  # Ticket document number.
                  ticket_document_number:
                )
                end

                sig do
                  override.returns(
                    {
                      connected_ticket_document_number: T.nilable(String),
                      credit_reason_indicator:
                        T.nilable(
                          Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                        ),
                      passenger_name_or_description: T.nilable(String),
                      services:
                        T::Array[
                          Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service
                        ],
                      ticket_document_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Indicates the reason for a credit to the cardholder.
                module CreditReasonIndicator
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # No credit
                  NO_CREDIT =
                    T.let(
                      :no_credit,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Passenger transport ancillary purchase cancellation
                  PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    T.let(
                      :passenger_transport_ancillary_purchase_cancellation,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Airline ticket and passenger transport ancillary purchase cancellation
                  AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    T.let(
                      :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Other
                  OTHER =
                    T.let(
                      :other,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Service < Increase::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service,
                        Increase::Internal::AnyHash
                      )
                    end

                  # Category of the ancillary service.
                  sig do
                    returns(
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )
                    )
                  end
                  attr_accessor :category

                  # Sub-category of the ancillary service, free-form.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :sub_category

                  sig do
                    params(
                      category:
                        T.nilable(
                          Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::OrSymbol
                        ),
                      sub_category: T.nilable(String)
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Category of the ancillary service.
                    category:,
                    # Sub-category of the ancillary service, free-form.
                    sub_category:
                  )
                  end

                  sig do
                    override.returns(
                      {
                        category:
                          T.nilable(
                            Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                          ),
                        sub_category: T.nilable(String)
                      }
                    )
                  end
                  def to_hash
                  end

                  # Category of the ancillary service.
                  module Category
                    extend Increase::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    # None
                    NONE =
                      T.let(
                        :none,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Bundled service
                    BUNDLED_SERVICE =
                      T.let(
                        :bundled_service,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Baggage fee
                    BAGGAGE_FEE =
                      T.let(
                        :baggage_fee,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Change fee
                    CHANGE_FEE =
                      T.let(
                        :change_fee,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Cargo
                    CARGO =
                      T.let(
                        :cargo,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Carbon offset
                    CARBON_OFFSET =
                      T.let(
                        :carbon_offset,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Frequent flyer
                    FREQUENT_FLYER =
                      T.let(
                        :frequent_flyer,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Gift card
                    GIFT_CARD =
                      T.let(
                        :gift_card,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Ground transport
                    GROUND_TRANSPORT =
                      T.let(
                        :ground_transport,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # In-flight entertainment
                    IN_FLIGHT_ENTERTAINMENT =
                      T.let(
                        :in_flight_entertainment,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Lounge
                    LOUNGE =
                      T.let(
                        :lounge,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Medical
                    MEDICAL =
                      T.let(
                        :medical,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Meal beverage
                    MEAL_BEVERAGE =
                      T.let(
                        :meal_beverage,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Other
                    OTHER =
                      T.let(
                        :other,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Passenger assist fee
                    PASSENGER_ASSIST_FEE =
                      T.let(
                        :passenger_assist_fee,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Pets
                    PETS =
                      T.let(
                        :pets,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Seat fees
                    SEAT_FEES =
                      T.let(
                        :seat_fees,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Standby
                    STANDBY =
                      T.let(
                        :standby,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Service fee
                    SERVICE_FEE =
                      T.let(
                        :service_fee,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Store
                    STORE =
                      T.let(
                        :store,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Travel service
                    TRAVEL_SERVICE =
                      T.let(
                        :travel_service,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Unaccompanied travel
                    UNACCOMPANIED_TRAVEL =
                      T.let(
                        :unaccompanied_travel,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Upgrades
                    UPGRADES =
                      T.let(
                        :upgrades,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Wi-fi
                    WIFI =
                      T.let(
                        :wifi,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end
              end

              # Indicates the reason for a credit to the cardholder.
              module CreditReasonIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No credit
                NO_CREDIT =
                  T.let(
                    :no_credit,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Passenger transport ancillary purchase cancellation
                PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  T.let(
                    :passenger_transport_ancillary_purchase_cancellation,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Airline ticket and passenger transport ancillary purchase cancellation
                AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  T.let(
                    :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Airline ticket cancellation
                AIRLINE_TICKET_CANCELLATION =
                  T.let(
                    :airline_ticket_cancellation,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Other
                OTHER =
                  T.let(
                    :other,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Partial refund of airline ticket
                PARTIAL_REFUND_OF_AIRLINE_TICKET =
                  T.let(
                    :partial_refund_of_airline_ticket,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicates whether this ticket is non-refundable.
              module RestrictedTicketIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No restrictions
                NO_RESTRICTIONS =
                  T.let(
                    :no_restrictions,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )

                # Restricted non-refundable ticket
                RESTRICTED_NON_REFUNDABLE_TICKET =
                  T.let(
                    :restricted_non_refundable_ticket,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicates why a ticket was changed.
              module TicketChangeIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # None
                NONE =
                  T.let(
                    :none,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                # Change to existing ticket
                CHANGE_TO_EXISTING_TICKET =
                  T.let(
                    :change_to_existing_ticket,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                # New ticket
                NEW_TICKET =
                  T.let(
                    :new_ticket,
                    Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class TripLeg < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg,
                      Increase::Internal::AnyHash
                    )
                  end

                # Carrier code (e.g., United Airlines, Jet Blue, etc.).
                sig { returns(T.nilable(String)) }
                attr_accessor :carrier_code

                # Code for the destination city or airport.
                sig { returns(T.nilable(String)) }
                attr_accessor :destination_city_airport_code

                # Fare basis code.
                sig { returns(T.nilable(String)) }
                attr_accessor :fare_basis_code

                # Flight number.
                sig { returns(T.nilable(String)) }
                attr_accessor :flight_number

                # Service class (e.g., first class, business class, etc.).
                sig { returns(T.nilable(String)) }
                attr_accessor :service_class

                # Indicates whether a stopover is allowed on this ticket.
                sig do
                  returns(
                    T.nilable(
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )
                  )
                end
                attr_accessor :stop_over_code

                sig do
                  params(
                    carrier_code: T.nilable(String),
                    destination_city_airport_code: T.nilable(String),
                    fare_basis_code: T.nilable(String),
                    flight_number: T.nilable(String),
                    service_class: T.nilable(String),
                    stop_over_code:
                      T.nilable(
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::OrSymbol
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Carrier code (e.g., United Airlines, Jet Blue, etc.).
                  carrier_code:,
                  # Code for the destination city or airport.
                  destination_city_airport_code:,
                  # Fare basis code.
                  fare_basis_code:,
                  # Flight number.
                  flight_number:,
                  # Service class (e.g., first class, business class, etc.).
                  service_class:,
                  # Indicates whether a stopover is allowed on this ticket.
                  stop_over_code:
                )
                end

                sig do
                  override.returns(
                    {
                      carrier_code: T.nilable(String),
                      destination_city_airport_code: T.nilable(String),
                      fare_basis_code: T.nilable(String),
                      flight_number: T.nilable(String),
                      service_class: T.nilable(String),
                      stop_over_code:
                        T.nilable(
                          Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                        )
                    }
                  )
                end
                def to_hash
                end

                # Indicates whether a stopover is allowed on this ticket.
                module StopOverCode
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # None
                  NONE =
                    T.let(
                      :none,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  # Stop over allowed
                  STOP_OVER_ALLOWED =
                    T.let(
                      :stop_over_allowed,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  # Stop over not allowed
                  STOP_OVER_NOT_ALLOWED =
                    T.let(
                      :stop_over_not_allowed,
                      Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardPayment::Element::CardRefund::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_refund`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Increase::CardPayment::Element::CardRefund::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_REFUND =
              T.let(
                :card_refund,
                Increase::CardPayment::Element::CardRefund::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardRefund::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardReversal < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardReversal,
                Increase::Internal::AnyHash
              )
            end

          # The Card Reversal identifier.
          sig { returns(String) }
          attr_accessor :id

          # The identifier for the Card Authorization this reverses.
          sig { returns(String) }
          attr_accessor :card_authorization_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          # currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardReversal::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

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
          sig { returns(T.nilable(String)) }
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

          # The card network used to process this card authorization.
          sig do
            returns(
              Increase::CardPayment::Element::CardReversal::Network::TaggedSymbol
            )
          end
          attr_accessor :network

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardReversal::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardReversal::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The identifier of the Pending Transaction associated with this Card Reversal.
          sig { returns(T.nilable(String)) }
          attr_accessor :pending_transaction_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          # presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # The amount of this reversal in the minor unit of the transaction's currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :reversal_amount

          # The amount of this reversal in the minor unit of the transaction's presentment
          # currency. For dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :reversal_presentment_amount

          # Why this reversal was initiated.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardReversal::ReversalReason::TaggedSymbol
              )
            )
          end
          attr_accessor :reversal_reason

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # A constant representing the object's type. For this resource it will always be
          # `card_reversal`.
          sig do
            returns(
              Increase::CardPayment::Element::CardReversal::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The amount left pending on the Card Authorization in the minor unit of the
          # transaction's currency. For dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :updated_authorization_amount

          # The amount left pending on the Card Authorization in the minor unit of the
          # transaction's presentment currency. For dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :updated_authorization_presentment_amount

          # A Card Reversal object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_reversal`. Card Reversals cancel parts of
          # or the entirety of an existing Card Authorization.
          sig do
            params(
              id: String,
              card_authorization_id: String,
              currency:
                Increase::CardPayment::Element::CardReversal::Currency::OrSymbol,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: T.nilable(String),
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network:
                Increase::CardPayment::Element::CardReversal::Network::OrSymbol,
              network_identifiers:
                Increase::CardPayment::Element::CardReversal::NetworkIdentifiers::OrHash,
              pending_transaction_id: T.nilable(String),
              presentment_currency: String,
              reversal_amount: Integer,
              reversal_presentment_amount: Integer,
              reversal_reason:
                T.nilable(
                  Increase::CardPayment::Element::CardReversal::ReversalReason::OrSymbol
                ),
              terminal_id: T.nilable(String),
              type:
                Increase::CardPayment::Element::CardReversal::Type::OrSymbol,
              updated_authorization_amount: Integer,
              updated_authorization_presentment_amount: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Reversal identifier.
            id:,
            # The identifier for the Card Authorization this reverses.
            card_authorization_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
            # currency.
            currency:,
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
            # The card network used to process this card authorization.
            network:,
            # Network-specific identifiers for a specific request or transaction.
            network_identifiers:,
            # The identifier of the Pending Transaction associated with this Card Reversal.
            pending_transaction_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
            # presentment currency.
            presentment_currency:,
            # The amount of this reversal in the minor unit of the transaction's currency. For
            # dollars, for example, this is cents.
            reversal_amount:,
            # The amount of this reversal in the minor unit of the transaction's presentment
            # currency. For dollars, for example, this is cents.
            reversal_presentment_amount:,
            # Why this reversal was initiated.
            reversal_reason:,
            # The terminal identifier (commonly abbreviated as TID) of the terminal the card
            # is transacting with.
            terminal_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_reversal`.
            type:,
            # The amount left pending on the Card Authorization in the minor unit of the
            # transaction's currency. For dollars, for example, this is cents.
            updated_authorization_amount:,
            # The amount left pending on the Card Authorization in the minor unit of the
            # transaction's presentment currency. For dollars, for example, this is cents.
            updated_authorization_presentment_amount:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                card_authorization_id: String,
                currency:
                  Increase::CardPayment::Element::CardReversal::Currency::TaggedSymbol,
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: T.nilable(String),
                merchant_country: T.nilable(String),
                merchant_descriptor: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network:
                  Increase::CardPayment::Element::CardReversal::Network::TaggedSymbol,
                network_identifiers:
                  Increase::CardPayment::Element::CardReversal::NetworkIdentifiers,
                pending_transaction_id: T.nilable(String),
                presentment_currency: String,
                reversal_amount: Integer,
                reversal_presentment_amount: Integer,
                reversal_reason:
                  T.nilable(
                    Increase::CardPayment::Element::CardReversal::ReversalReason::TaggedSymbol
                  ),
                terminal_id: T.nilable(String),
                type:
                  Increase::CardPayment::Element::CardReversal::Type::TaggedSymbol,
                updated_authorization_amount: Integer,
                updated_authorization_presentment_amount: Integer
              }
            )
          end
          def to_hash
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the reversal's
          # currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardReversal::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardReversal::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardReversal::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The card network used to process this card authorization.
          module Network
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardReversal::Network
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::CardPayment::Element::CardReversal::Network::TaggedSymbol
              )

            # Pulse
            PULSE =
              T.let(
                :pulse,
                Increase::CardPayment::Element::CardReversal::Network::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardReversal::Network::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardReversal::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

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
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
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
                  authorization_identification_response: T.nilable(String),
                  retrieval_reference_number: T.nilable(String),
                  trace_number: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          # Why this reversal was initiated.
          module ReversalReason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardReversal::ReversalReason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The Card Reversal was initiated at the customer's request.
            REVERSED_BY_CUSTOMER =
              T.let(
                :reversed_by_customer,
                Increase::CardPayment::Element::CardReversal::ReversalReason::TaggedSymbol
              )

            # The Card Reversal was initiated by the network or acquirer.
            REVERSED_BY_NETWORK_OR_ACQUIRER =
              T.let(
                :reversed_by_network_or_acquirer,
                Increase::CardPayment::Element::CardReversal::ReversalReason::TaggedSymbol
              )

            # The Card Reversal was initiated by the point of sale device.
            REVERSED_BY_POINT_OF_SALE =
              T.let(
                :reversed_by_point_of_sale,
                Increase::CardPayment::Element::CardReversal::ReversalReason::TaggedSymbol
              )

            # The Card Reversal was a partial reversal, for any reason.
            PARTIAL_REVERSAL =
              T.let(
                :partial_reversal,
                Increase::CardPayment::Element::CardReversal::ReversalReason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardReversal::ReversalReason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_reversal`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardReversal::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_REVERSAL =
              T.let(
                :card_reversal,
                Increase::CardPayment::Element::CardReversal::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardReversal::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardSettlement < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardSettlement,
                Increase::Internal::AnyHash
              )
            end

          # The Card Settlement identifier.
          sig { returns(String) }
          attr_accessor :id

          # The amount in the minor unit of the transaction's settlement currency. For
          # dollars, for example, this is cents.
          sig { returns(Integer) }
          attr_accessor :amount

          # The Card Authorization that was created prior to this Card Settlement, if one
          # exists.
          sig { returns(T.nilable(String)) }
          attr_accessor :card_authorization

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # Cashback earned on this transaction, if eligible. Cashback is paid out in
          # aggregate, monthly.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardSettlement::Cashback
              )
            )
          end
          attr_reader :cashback

          sig do
            params(
              cashback:
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::Cashback::OrHash
                )
            ).void
          end
          attr_writer :cashback

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardSettlement::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # Interchange assessed as a part of this transaction.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardSettlement::Interchange
              )
            )
          end
          attr_reader :interchange

          sig do
            params(
              interchange:
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::Interchange::OrHash
                )
            ).void
          end
          attr_writer :interchange

          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          sig { returns(String) }
          attr_accessor :merchant_acceptor_id

          # The 4-digit MCC describing the merchant's business.
          sig { returns(String) }
          attr_accessor :merchant_category_code

          # The city the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_city

          # The country the merchant resides in.
          sig { returns(String) }
          attr_accessor :merchant_country

          # The name of the merchant.
          sig { returns(String) }
          attr_accessor :merchant_name

          # The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_postal_code

          # The state the merchant resides in.
          sig { returns(T.nilable(String)) }
          attr_accessor :merchant_state

          # The card network on which this transaction was processed.
          sig do
            returns(
              Increase::CardPayment::Element::CardSettlement::Network::TaggedSymbol
            )
          end
          attr_accessor :network

          # Network-specific identifiers for this refund.
          sig do
            returns(
              Increase::CardPayment::Element::CardSettlement::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardSettlement::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The identifier of the Pending Transaction associated with this Transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :pending_transaction_id

          # The amount in the minor unit of the transaction's presentment currency.
          sig { returns(Integer) }
          attr_accessor :presentment_amount

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's presentment currency.
          sig { returns(String) }
          attr_accessor :presentment_currency

          # Additional details about the card purchase, such as tax and industry-specific
          # fields.
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardSettlement::PurchaseDetails
              )
            )
          end
          attr_reader :purchase_details

          sig do
            params(
              purchase_details:
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::OrHash
                )
            ).void
          end
          attr_writer :purchase_details

          # Surcharge amount details, if applicable. The amount is positive if the surcharge
          # is added to to the overall transaction amount (surcharge), and negative if the
          # surcharge is deducted from the overall transaction amount (discount).
          sig do
            returns(
              T.nilable(
                Increase::CardPayment::Element::CardSettlement::Surcharge
              )
            )
          end
          attr_reader :surcharge

          sig do
            params(
              surcharge:
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::Surcharge::OrHash
                )
            ).void
          end
          attr_writer :surcharge

          # The identifier of the Transaction associated with this Transaction.
          sig { returns(String) }
          attr_accessor :transaction_id

          # A constant representing the object's type. For this resource it will always be
          # `card_settlement`.
          sig do
            returns(
              Increase::CardPayment::Element::CardSettlement::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A Card Settlement object. This field will be present in the JSON response if and
          # only if `category` is equal to `card_settlement`. Card Settlements are card
          # transactions that have cleared and settled. While a settlement is usually
          # preceded by an authorization, an acquirer can also directly clear a transaction
          # without first authorizing it.
          sig do
            params(
              id: String,
              amount: Integer,
              card_authorization: T.nilable(String),
              card_payment_id: String,
              cashback:
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::Cashback::OrHash
                ),
              currency:
                Increase::CardPayment::Element::CardSettlement::Currency::OrSymbol,
              interchange:
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::Interchange::OrHash
                ),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: String,
              merchant_country: String,
              merchant_name: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network:
                Increase::CardPayment::Element::CardSettlement::Network::OrSymbol,
              network_identifiers:
                Increase::CardPayment::Element::CardSettlement::NetworkIdentifiers::OrHash,
              pending_transaction_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              purchase_details:
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::OrHash
                ),
              surcharge:
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::Surcharge::OrHash
                ),
              transaction_id: String,
              type:
                Increase::CardPayment::Element::CardSettlement::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Settlement identifier.
            id:,
            # The amount in the minor unit of the transaction's settlement currency. For
            # dollars, for example, this is cents.
            amount:,
            # The Card Authorization that was created prior to this Card Settlement, if one
            # exists.
            card_authorization:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # Cashback earned on this transaction, if eligible. Cashback is paid out in
            # aggregate, monthly.
            cashback:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's settlement currency.
            currency:,
            # Interchange assessed as a part of this transaction.
            interchange:,
            # The merchant identifier (commonly abbreviated as MID) of the merchant the card
            # is transacting with.
            merchant_acceptor_id:,
            # The 4-digit MCC describing the merchant's business.
            merchant_category_code:,
            # The city the merchant resides in.
            merchant_city:,
            # The country the merchant resides in.
            merchant_country:,
            # The name of the merchant.
            merchant_name:,
            # The merchant's postal code. For US merchants this is always a 5-digit ZIP code.
            merchant_postal_code:,
            # The state the merchant resides in.
            merchant_state:,
            # The card network on which this transaction was processed.
            network:,
            # Network-specific identifiers for this refund.
            network_identifiers:,
            # The identifier of the Pending Transaction associated with this Transaction.
            pending_transaction_id:,
            # The amount in the minor unit of the transaction's presentment currency.
            presentment_amount:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's presentment currency.
            presentment_currency:,
            # Additional details about the card purchase, such as tax and industry-specific
            # fields.
            purchase_details:,
            # Surcharge amount details, if applicable. The amount is positive if the surcharge
            # is added to to the overall transaction amount (surcharge), and negative if the
            # surcharge is deducted from the overall transaction amount (discount).
            surcharge:,
            # The identifier of the Transaction associated with this Transaction.
            transaction_id:,
            # A constant representing the object's type. For this resource it will always be
            # `card_settlement`.
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                amount: Integer,
                card_authorization: T.nilable(String),
                card_payment_id: String,
                cashback:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::Cashback
                  ),
                currency:
                  Increase::CardPayment::Element::CardSettlement::Currency::TaggedSymbol,
                interchange:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::Interchange
                  ),
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: String,
                merchant_country: String,
                merchant_name: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network:
                  Increase::CardPayment::Element::CardSettlement::Network::TaggedSymbol,
                network_identifiers:
                  Increase::CardPayment::Element::CardSettlement::NetworkIdentifiers,
                pending_transaction_id: T.nilable(String),
                presentment_amount: Integer,
                presentment_currency: String,
                purchase_details:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails
                  ),
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::Surcharge
                  ),
                transaction_id: String,
                type:
                  Increase::CardPayment::Element::CardSettlement::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          class Cashback < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardSettlement::Cashback,
                  Increase::Internal::AnyHash
                )
              end

            # The cashback amount given as a string containing a decimal number. The amount is
            # a positive number if it will be credited to you (e.g., settlements) and a
            # negative number if it will be debited (e.g., refunds).
            sig { returns(String) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            sig do
              returns(
                Increase::CardPayment::Element::CardSettlement::Cashback::Currency::TaggedSymbol
              )
            end
            attr_accessor :currency

            # Cashback earned on this transaction, if eligible. Cashback is paid out in
            # aggregate, monthly.
            sig do
              params(
                amount: String,
                currency:
                  Increase::CardPayment::Element::CardSettlement::Cashback::Currency::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The cashback amount given as a string containing a decimal number. The amount is
              # a positive number if it will be credited to you (e.g., settlements) and a
              # negative number if it will be debited (e.g., refunds).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
              currency:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  currency:
                    Increase::CardPayment::Element::CardSettlement::Cashback::Currency::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the cashback.
            module Currency
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardPayment::Element::CardSettlement::Cashback::Currency
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # US Dollar (USD)
              USD =
                T.let(
                  :USD,
                  Increase::CardPayment::Element::CardSettlement::Cashback::Currency::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardSettlement::Cashback::Currency::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's settlement currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardSettlement::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardSettlement::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardSettlement::Currency::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Interchange < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardSettlement::Interchange,
                  Increase::Internal::AnyHash
                )
              end

            # The interchange amount given as a string containing a decimal number in major
            # units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
            # credited to Increase (e.g., settlements) and a negative number if it is debited
            # (e.g., refunds).
            sig { returns(String) }
            attr_accessor :amount

            # The card network specific interchange code.
            sig { returns(T.nilable(String)) }
            attr_accessor :code

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            sig do
              returns(
                Increase::CardPayment::Element::CardSettlement::Interchange::Currency::TaggedSymbol
              )
            end
            attr_accessor :currency

            # Interchange assessed as a part of this transaction.
            sig do
              params(
                amount: String,
                code: T.nilable(String),
                currency:
                  Increase::CardPayment::Element::CardSettlement::Interchange::Currency::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The interchange amount given as a string containing a decimal number in major
              # units (so e.g., "3.14" for $3.14). The amount is a positive number if it is
              # credited to Increase (e.g., settlements) and a negative number if it is debited
              # (e.g., refunds).
              amount:,
              # The card network specific interchange code.
              code:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
              # reimbursement.
              currency:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  code: T.nilable(String),
                  currency:
                    Increase::CardPayment::Element::CardSettlement::Interchange::Currency::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the interchange
            # reimbursement.
            module Currency
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardPayment::Element::CardSettlement::Interchange::Currency
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # US Dollar (USD)
              USD =
                T.let(
                  :USD,
                  Increase::CardPayment::Element::CardSettlement::Interchange::Currency::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardSettlement::Interchange::Currency::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The card network on which this transaction was processed.
          module Network
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardSettlement::Network
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::CardPayment::Element::CardSettlement::Network::TaggedSymbol
              )

            # Pulse
            PULSE =
              T.let(
                :pulse,
                Increase::CardPayment::Element::CardSettlement::Network::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardSettlement::Network::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NetworkIdentifiers < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardSettlement::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # A network assigned business ID that identifies the acquirer that processed this
            # transaction.
            sig { returns(String) }
            attr_accessor :acquirer_business_id

            # A globally unique identifier for this settlement.
            sig { returns(String) }
            attr_accessor :acquirer_reference_number

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            sig { returns(T.nilable(String)) }
            attr_accessor :transaction_id

            # Network-specific identifiers for this refund.
            sig do
              params(
                acquirer_business_id: String,
                acquirer_reference_number: String,
                authorization_identification_response: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # A network assigned business ID that identifies the acquirer that processed this
              # transaction.
              acquirer_business_id:,
              # A globally unique identifier for this settlement.
              acquirer_reference_number:,
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
              # A globally unique transaction identifier provided by the card network, used
              # across multiple life-cycle requests.
              transaction_id:
            )
            end

            sig do
              override.returns(
                {
                  acquirer_business_id: String,
                  acquirer_reference_number: String,
                  authorization_identification_response: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          class PurchaseDetails < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails,
                  Increase::Internal::AnyHash
                )
              end

            # Fields specific to car rentals.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental
                )
              )
            end
            attr_reader :car_rental

            sig do
              params(
                car_rental:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::OrHash
                  )
              ).void
            end
            attr_writer :car_rental

            # An identifier from the merchant for the customer or consumer.
            sig { returns(T.nilable(String)) }
            attr_accessor :customer_reference_identifier

            # The state or provincial tax amount in minor units.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :local_tax_amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            # assessed.
            sig { returns(T.nilable(String)) }
            attr_accessor :local_tax_currency

            # Fields specific to lodging.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging
                )
              )
            end
            attr_reader :lodging

            sig do
              params(
                lodging:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::OrHash
                  )
              ).void
            end
            attr_writer :lodging

            # The national tax amount in minor units.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :national_tax_amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
            # assessed.
            sig { returns(T.nilable(String)) }
            attr_accessor :national_tax_currency

            # An identifier from the merchant for the purchase to the issuer and cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :purchase_identifier

            # The format of the purchase identifier.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )
              )
            end
            attr_accessor :purchase_identifier_format

            # Fields specific to travel.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel
                )
              )
            end
            attr_reader :travel

            sig do
              params(
                travel:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::OrHash
                  )
              ).void
            end
            attr_writer :travel

            # Additional details about the card purchase, such as tax and industry-specific
            # fields.
            sig do
              params(
                car_rental:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::OrHash
                  ),
                customer_reference_identifier: T.nilable(String),
                local_tax_amount: T.nilable(Integer),
                local_tax_currency: T.nilable(String),
                lodging:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::OrHash
                  ),
                national_tax_amount: T.nilable(Integer),
                national_tax_currency: T.nilable(String),
                purchase_identifier: T.nilable(String),
                purchase_identifier_format:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::OrSymbol
                  ),
                travel:
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Fields specific to car rentals.
              car_rental:,
              # An identifier from the merchant for the customer or consumer.
              customer_reference_identifier:,
              # The state or provincial tax amount in minor units.
              local_tax_amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
              # assessed.
              local_tax_currency:,
              # Fields specific to lodging.
              lodging:,
              # The national tax amount in minor units.
              national_tax_amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the local tax
              # assessed.
              national_tax_currency:,
              # An identifier from the merchant for the purchase to the issuer and cardholder.
              purchase_identifier:,
              # The format of the purchase identifier.
              purchase_identifier_format:,
              # Fields specific to travel.
              travel:
            )
            end

            sig do
              override.returns(
                {
                  car_rental:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental
                    ),
                  customer_reference_identifier: T.nilable(String),
                  local_tax_amount: T.nilable(Integer),
                  local_tax_currency: T.nilable(String),
                  lodging:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging
                    ),
                  national_tax_amount: T.nilable(Integer),
                  national_tax_currency: T.nilable(String),
                  purchase_identifier: T.nilable(String),
                  purchase_identifier_format:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                    ),
                  travel:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel
                    )
                }
              )
            end
            def to_hash
            end

            class CarRental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental,
                    Increase::Internal::AnyHash
                  )
                end

              # Code indicating the vehicle's class.
              sig { returns(T.nilable(String)) }
              attr_accessor :car_class_code

              # Date the customer picked up the car or, in the case of a no-show or pre-pay
              # transaction, the scheduled pick up date.
              sig { returns(T.nilable(Date)) }
              attr_accessor :checkout_date

              # Daily rate being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :daily_rental_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
              # rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :daily_rental_rate_currency

              # Number of days the vehicle was rented.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :days_rented

              # Additional charges (gas, late fee, etc.) being billed.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )
                )
              end
              attr_accessor :extra_charges

              # Fuel charges for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :fuel_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
              # assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :fuel_charges_currency

              # Any insurance being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :insurance_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
              # charges assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :insurance_charges_currency

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :no_show_indicator

              # Charges for returning the vehicle at a different location than where it was
              # picked up.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :one_way_drop_off_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
              # drop-off charges assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :one_way_drop_off_charges_currency

              # Name of the person renting the vehicle.
              sig { returns(T.nilable(String)) }
              attr_accessor :renter_name

              # Weekly rate being charged for the vehicle.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :weekly_rental_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
              # rental rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :weekly_rental_rate_currency

              # Fields specific to car rentals.
              sig do
                params(
                  car_class_code: T.nilable(String),
                  checkout_date: T.nilable(Date),
                  daily_rental_rate_amount: T.nilable(Integer),
                  daily_rental_rate_currency: T.nilable(String),
                  days_rented: T.nilable(Integer),
                  extra_charges:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::OrSymbol
                    ),
                  fuel_charges_amount: T.nilable(Integer),
                  fuel_charges_currency: T.nilable(String),
                  insurance_charges_amount: T.nilable(Integer),
                  insurance_charges_currency: T.nilable(String),
                  no_show_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::OrSymbol
                    ),
                  one_way_drop_off_charges_amount: T.nilable(Integer),
                  one_way_drop_off_charges_currency: T.nilable(String),
                  renter_name: T.nilable(String),
                  weekly_rental_rate_amount: T.nilable(Integer),
                  weekly_rental_rate_currency: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Code indicating the vehicle's class.
                car_class_code:,
                # Date the customer picked up the car or, in the case of a no-show or pre-pay
                # transaction, the scheduled pick up date.
                checkout_date:,
                # Daily rate being charged for the vehicle.
                daily_rental_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily rental
                # rate.
                daily_rental_rate_currency:,
                # Number of days the vehicle was rented.
                days_rented:,
                # Additional charges (gas, late fee, etc.) being billed.
                extra_charges:,
                # Fuel charges for the vehicle.
                fuel_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the fuel charges
                # assessed.
                fuel_charges_currency:,
                # Any insurance being charged for the vehicle.
                insurance_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the insurance
                # charges assessed.
                insurance_charges_currency:,
                # An indicator that the cardholder is being billed for a reserved vehicle that was
                # not actually rented (that is, a "no-show" charge).
                no_show_indicator:,
                # Charges for returning the vehicle at a different location than where it was
                # picked up.
                one_way_drop_off_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the one-way
                # drop-off charges assessed.
                one_way_drop_off_charges_currency:,
                # Name of the person renting the vehicle.
                renter_name:,
                # Weekly rate being charged for the vehicle.
                weekly_rental_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the weekly
                # rental rate.
                weekly_rental_rate_currency:
              )
              end

              sig do
                override.returns(
                  {
                    car_class_code: T.nilable(String),
                    checkout_date: T.nilable(Date),
                    daily_rental_rate_amount: T.nilable(Integer),
                    daily_rental_rate_currency: T.nilable(String),
                    days_rented: T.nilable(Integer),
                    extra_charges:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                      ),
                    fuel_charges_amount: T.nilable(Integer),
                    fuel_charges_currency: T.nilable(String),
                    insurance_charges_amount: T.nilable(Integer),
                    insurance_charges_currency: T.nilable(String),
                    no_show_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                      ),
                    one_way_drop_off_charges_amount: T.nilable(Integer),
                    one_way_drop_off_charges_currency: T.nilable(String),
                    renter_name: T.nilable(String),
                    weekly_rental_rate_amount: T.nilable(Integer),
                    weekly_rental_rate_currency: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Additional charges (gas, late fee, etc.) being billed.
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No extra charge
                NO_EXTRA_CHARGE =
                  T.let(
                    :no_extra_charge,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Gas
                GAS =
                  T.let(
                    :gas,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Extra mileage
                EXTRA_MILEAGE =
                  T.let(
                    :extra_mileage,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Late return
                LATE_RETURN =
                  T.let(
                    :late_return,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # One way service fee
                ONE_WAY_SERVICE_FEE =
                  T.let(
                    :one_way_service_fee,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                # Parking violation
                PARKING_VIOLATION =
                  T.let(
                    :parking_violation,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::ExtraCharges::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # An indicator that the cardholder is being billed for a reserved vehicle that was
              # not actually rented (that is, a "no-show" charge).
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not applicable
                NOT_APPLICABLE =
                  T.let(
                    :not_applicable,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )

                # No show for specialized vehicle
                NO_SHOW_FOR_SPECIALIZED_VEHICLE =
                  T.let(
                    :no_show_for_specialized_vehicle,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::CarRental::NoShowIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Lodging < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging,
                    Increase::Internal::AnyHash
                  )
                end

              # Date the customer checked in.
              sig { returns(T.nilable(Date)) }
              attr_accessor :check_in_date

              # Daily rate being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :daily_room_rate_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
              # rate.
              sig { returns(T.nilable(String)) }
              attr_accessor :daily_room_rate_currency

              # Additional charges (phone, late check-out, etc.) being billed.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )
                )
              end
              attr_accessor :extra_charges

              # Folio cash advances for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :folio_cash_advances_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
              # advances.
              sig { returns(T.nilable(String)) }
              attr_accessor :folio_cash_advances_currency

              # Food and beverage charges for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :food_beverage_charges_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
              # beverage charges.
              sig { returns(T.nilable(String)) }
              attr_accessor :food_beverage_charges_currency

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :no_show_indicator

              # Prepaid expenses being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :prepaid_expenses_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
              # expenses.
              sig { returns(T.nilable(String)) }
              attr_accessor :prepaid_expenses_currency

              # Number of nights the room was rented.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :room_nights

              # Total room tax being charged.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :total_room_tax_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
              # tax.
              sig { returns(T.nilable(String)) }
              attr_accessor :total_room_tax_currency

              # Total tax being charged for the room.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :total_tax_amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
              # assessed.
              sig { returns(T.nilable(String)) }
              attr_accessor :total_tax_currency

              # Fields specific to lodging.
              sig do
                params(
                  check_in_date: T.nilable(Date),
                  daily_room_rate_amount: T.nilable(Integer),
                  daily_room_rate_currency: T.nilable(String),
                  extra_charges:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::OrSymbol
                    ),
                  folio_cash_advances_amount: T.nilable(Integer),
                  folio_cash_advances_currency: T.nilable(String),
                  food_beverage_charges_amount: T.nilable(Integer),
                  food_beverage_charges_currency: T.nilable(String),
                  no_show_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::OrSymbol
                    ),
                  prepaid_expenses_amount: T.nilable(Integer),
                  prepaid_expenses_currency: T.nilable(String),
                  room_nights: T.nilable(Integer),
                  total_room_tax_amount: T.nilable(Integer),
                  total_room_tax_currency: T.nilable(String),
                  total_tax_amount: T.nilable(Integer),
                  total_tax_currency: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Date the customer checked in.
                check_in_date:,
                # Daily rate being charged for the room.
                daily_room_rate_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the daily room
                # rate.
                daily_room_rate_currency:,
                # Additional charges (phone, late check-out, etc.) being billed.
                extra_charges:,
                # Folio cash advances for the room.
                folio_cash_advances_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the folio cash
                # advances.
                folio_cash_advances_currency:,
                # Food and beverage charges for the room.
                food_beverage_charges_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the food and
                # beverage charges.
                food_beverage_charges_currency:,
                # Indicator that the cardholder is being billed for a reserved room that was not
                # actually used.
                no_show_indicator:,
                # Prepaid expenses being charged for the room.
                prepaid_expenses_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the prepaid
                # expenses.
                prepaid_expenses_currency:,
                # Number of nights the room was rented.
                room_nights:,
                # Total room tax being charged.
                total_room_tax_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total room
                # tax.
                total_room_tax_currency:,
                # Total tax being charged for the room.
                total_tax_amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the total tax
                # assessed.
                total_tax_currency:
              )
              end

              sig do
                override.returns(
                  {
                    check_in_date: T.nilable(Date),
                    daily_room_rate_amount: T.nilable(Integer),
                    daily_room_rate_currency: T.nilable(String),
                    extra_charges:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                      ),
                    folio_cash_advances_amount: T.nilable(Integer),
                    folio_cash_advances_currency: T.nilable(String),
                    food_beverage_charges_amount: T.nilable(Integer),
                    food_beverage_charges_currency: T.nilable(String),
                    no_show_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                      ),
                    prepaid_expenses_amount: T.nilable(Integer),
                    prepaid_expenses_currency: T.nilable(String),
                    room_nights: T.nilable(Integer),
                    total_room_tax_amount: T.nilable(Integer),
                    total_room_tax_currency: T.nilable(String),
                    total_tax_amount: T.nilable(Integer),
                    total_tax_currency: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Additional charges (phone, late check-out, etc.) being billed.
              module ExtraCharges
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No extra charge
                NO_EXTRA_CHARGE =
                  T.let(
                    :no_extra_charge,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Restaurant
                RESTAURANT =
                  T.let(
                    :restaurant,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Gift shop
                GIFT_SHOP =
                  T.let(
                    :gift_shop,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Mini bar
                MINI_BAR =
                  T.let(
                    :mini_bar,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Telephone
                TELEPHONE =
                  T.let(
                    :telephone,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Other
                OTHER =
                  T.let(
                    :other,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                # Laundry
                LAUNDRY =
                  T.let(
                    :laundry,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::ExtraCharges::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicator that the cardholder is being billed for a reserved room that was not
              # actually used.
              module NoShowIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not applicable
                NOT_APPLICABLE =
                  T.let(
                    :not_applicable,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )

                # No show
                NO_SHOW =
                  T.let(
                    :no_show,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Lodging::NoShowIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            # The format of the purchase identifier.
            module PurchaseIdentifierFormat
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Free text
              FREE_TEXT =
                T.let(
                  :free_text,
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Order number
              ORDER_NUMBER =
                T.let(
                  :order_number,
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Rental agreement number
              RENTAL_AGREEMENT_NUMBER =
                T.let(
                  :rental_agreement_number,
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Hotel folio number
              HOTEL_FOLIO_NUMBER =
                T.let(
                  :hotel_folio_number,
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              # Invoice number
              INVOICE_NUMBER =
                T.let(
                  :invoice_number,
                  Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::PurchaseIdentifierFormat::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Travel < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel,
                    Increase::Internal::AnyHash
                  )
                end

              # Ancillary purchases in addition to the airfare.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary
                  )
                )
              end
              attr_reader :ancillary

              sig do
                params(
                  ancillary:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::OrHash
                    )
                ).void
              end
              attr_writer :ancillary

              # Indicates the computerized reservation system used to book the ticket.
              sig { returns(T.nilable(String)) }
              attr_accessor :computerized_reservation_system

              # Indicates the reason for a credit to the cardholder.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :credit_reason_indicator

              # Date of departure.
              sig { returns(T.nilable(Date)) }
              attr_accessor :departure_date

              # Code for the originating city or airport.
              sig { returns(T.nilable(String)) }
              attr_accessor :origination_city_airport_code

              # Name of the passenger.
              sig { returns(T.nilable(String)) }
              attr_accessor :passenger_name

              # Indicates whether this ticket is non-refundable.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :restricted_ticket_indicator

              # Indicates why a ticket was changed.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :ticket_change_indicator

              # Ticket number.
              sig { returns(T.nilable(String)) }
              attr_accessor :ticket_number

              # Code for the travel agency if the ticket was issued by a travel agency.
              sig { returns(T.nilable(String)) }
              attr_accessor :travel_agency_code

              # Name of the travel agency if the ticket was issued by a travel agency.
              sig { returns(T.nilable(String)) }
              attr_accessor :travel_agency_name

              # Fields specific to each leg of the journey.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg
                    ]
                  )
                )
              end
              attr_accessor :trip_legs

              # Fields specific to travel.
              sig do
                params(
                  ancillary:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::OrHash
                    ),
                  computerized_reservation_system: T.nilable(String),
                  credit_reason_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::OrSymbol
                    ),
                  departure_date: T.nilable(Date),
                  origination_city_airport_code: T.nilable(String),
                  passenger_name: T.nilable(String),
                  restricted_ticket_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::OrSymbol
                    ),
                  ticket_change_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::OrSymbol
                    ),
                  ticket_number: T.nilable(String),
                  travel_agency_code: T.nilable(String),
                  travel_agency_name: T.nilable(String),
                  trip_legs:
                    T.nilable(
                      T::Array[
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::OrHash
                      ]
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Ancillary purchases in addition to the airfare.
                ancillary:,
                # Indicates the computerized reservation system used to book the ticket.
                computerized_reservation_system:,
                # Indicates the reason for a credit to the cardholder.
                credit_reason_indicator:,
                # Date of departure.
                departure_date:,
                # Code for the originating city or airport.
                origination_city_airport_code:,
                # Name of the passenger.
                passenger_name:,
                # Indicates whether this ticket is non-refundable.
                restricted_ticket_indicator:,
                # Indicates why a ticket was changed.
                ticket_change_indicator:,
                # Ticket number.
                ticket_number:,
                # Code for the travel agency if the ticket was issued by a travel agency.
                travel_agency_code:,
                # Name of the travel agency if the ticket was issued by a travel agency.
                travel_agency_name:,
                # Fields specific to each leg of the journey.
                trip_legs:
              )
              end

              sig do
                override.returns(
                  {
                    ancillary:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary
                      ),
                    computerized_reservation_system: T.nilable(String),
                    credit_reason_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                      ),
                    departure_date: T.nilable(Date),
                    origination_city_airport_code: T.nilable(String),
                    passenger_name: T.nilable(String),
                    restricted_ticket_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                      ),
                    ticket_change_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                      ),
                    ticket_number: T.nilable(String),
                    travel_agency_code: T.nilable(String),
                    travel_agency_name: T.nilable(String),
                    trip_legs:
                      T.nilable(
                        T::Array[
                          Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg
                        ]
                      )
                  }
                )
              end
              def to_hash
              end

              class Ancillary < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary,
                      Increase::Internal::AnyHash
                    )
                  end

                # If this purchase has a connection or relationship to another purchase, such as a
                # baggage fee for a passenger transport ticket, this field should contain the
                # ticket document number for the other purchase.
                sig { returns(T.nilable(String)) }
                attr_accessor :connected_ticket_document_number

                # Indicates the reason for a credit to the cardholder.
                sig do
                  returns(
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )
                  )
                end
                attr_accessor :credit_reason_indicator

                # Name of the passenger or description of the ancillary purchase.
                sig { returns(T.nilable(String)) }
                attr_accessor :passenger_name_or_description

                # Additional travel charges, such as baggage fees.
                sig do
                  returns(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service
                    ]
                  )
                end
                attr_accessor :services

                # Ticket document number.
                sig { returns(T.nilable(String)) }
                attr_accessor :ticket_document_number

                # Ancillary purchases in addition to the airfare.
                sig do
                  params(
                    connected_ticket_document_number: T.nilable(String),
                    credit_reason_indicator:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::OrSymbol
                      ),
                    passenger_name_or_description: T.nilable(String),
                    services:
                      T::Array[
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::OrHash
                      ],
                    ticket_document_number: T.nilable(String)
                  ).returns(T.attached_class)
                end
                def self.new(
                  # If this purchase has a connection or relationship to another purchase, such as a
                  # baggage fee for a passenger transport ticket, this field should contain the
                  # ticket document number for the other purchase.
                  connected_ticket_document_number:,
                  # Indicates the reason for a credit to the cardholder.
                  credit_reason_indicator:,
                  # Name of the passenger or description of the ancillary purchase.
                  passenger_name_or_description:,
                  # Additional travel charges, such as baggage fees.
                  services:,
                  # Ticket document number.
                  ticket_document_number:
                )
                end

                sig do
                  override.returns(
                    {
                      connected_ticket_document_number: T.nilable(String),
                      credit_reason_indicator:
                        T.nilable(
                          Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                        ),
                      passenger_name_or_description: T.nilable(String),
                      services:
                        T::Array[
                          Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service
                        ],
                      ticket_document_number: T.nilable(String)
                    }
                  )
                end
                def to_hash
                end

                # Indicates the reason for a credit to the cardholder.
                module CreditReasonIndicator
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # No credit
                  NO_CREDIT =
                    T.let(
                      :no_credit,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Passenger transport ancillary purchase cancellation
                  PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    T.let(
                      :passenger_transport_ancillary_purchase_cancellation,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Airline ticket and passenger transport ancillary purchase cancellation
                  AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                    T.let(
                      :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  # Other
                  OTHER =
                    T.let(
                      :other,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::CreditReasonIndicator::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Service < Increase::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service,
                        Increase::Internal::AnyHash
                      )
                    end

                  # Category of the ancillary service.
                  sig do
                    returns(
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )
                    )
                  end
                  attr_accessor :category

                  # Sub-category of the ancillary service, free-form.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :sub_category

                  sig do
                    params(
                      category:
                        T.nilable(
                          Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::OrSymbol
                        ),
                      sub_category: T.nilable(String)
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Category of the ancillary service.
                    category:,
                    # Sub-category of the ancillary service, free-form.
                    sub_category:
                  )
                  end

                  sig do
                    override.returns(
                      {
                        category:
                          T.nilable(
                            Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                          ),
                        sub_category: T.nilable(String)
                      }
                    )
                  end
                  def to_hash
                  end

                  # Category of the ancillary service.
                  module Category
                    extend Increase::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    # None
                    NONE =
                      T.let(
                        :none,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Bundled service
                    BUNDLED_SERVICE =
                      T.let(
                        :bundled_service,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Baggage fee
                    BAGGAGE_FEE =
                      T.let(
                        :baggage_fee,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Change fee
                    CHANGE_FEE =
                      T.let(
                        :change_fee,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Cargo
                    CARGO =
                      T.let(
                        :cargo,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Carbon offset
                    CARBON_OFFSET =
                      T.let(
                        :carbon_offset,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Frequent flyer
                    FREQUENT_FLYER =
                      T.let(
                        :frequent_flyer,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Gift card
                    GIFT_CARD =
                      T.let(
                        :gift_card,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Ground transport
                    GROUND_TRANSPORT =
                      T.let(
                        :ground_transport,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # In-flight entertainment
                    IN_FLIGHT_ENTERTAINMENT =
                      T.let(
                        :in_flight_entertainment,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Lounge
                    LOUNGE =
                      T.let(
                        :lounge,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Medical
                    MEDICAL =
                      T.let(
                        :medical,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Meal beverage
                    MEAL_BEVERAGE =
                      T.let(
                        :meal_beverage,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Other
                    OTHER =
                      T.let(
                        :other,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Passenger assist fee
                    PASSENGER_ASSIST_FEE =
                      T.let(
                        :passenger_assist_fee,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Pets
                    PETS =
                      T.let(
                        :pets,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Seat fees
                    SEAT_FEES =
                      T.let(
                        :seat_fees,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Standby
                    STANDBY =
                      T.let(
                        :standby,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Service fee
                    SERVICE_FEE =
                      T.let(
                        :service_fee,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Store
                    STORE =
                      T.let(
                        :store,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Travel service
                    TRAVEL_SERVICE =
                      T.let(
                        :travel_service,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Unaccompanied travel
                    UNACCOMPANIED_TRAVEL =
                      T.let(
                        :unaccompanied_travel,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Upgrades
                    UPGRADES =
                      T.let(
                        :upgrades,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    # Wi-fi
                    WIFI =
                      T.let(
                        :wifi,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::Ancillary::Service::Category::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end
              end

              # Indicates the reason for a credit to the cardholder.
              module CreditReasonIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No credit
                NO_CREDIT =
                  T.let(
                    :no_credit,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Passenger transport ancillary purchase cancellation
                PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  T.let(
                    :passenger_transport_ancillary_purchase_cancellation,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Airline ticket and passenger transport ancillary purchase cancellation
                AIRLINE_TICKET_AND_PASSENGER_TRANSPORT_ANCILLARY_PURCHASE_CANCELLATION =
                  T.let(
                    :airline_ticket_and_passenger_transport_ancillary_purchase_cancellation,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Airline ticket cancellation
                AIRLINE_TICKET_CANCELLATION =
                  T.let(
                    :airline_ticket_cancellation,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Other
                OTHER =
                  T.let(
                    :other,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                # Partial refund of airline ticket
                PARTIAL_REFUND_OF_AIRLINE_TICKET =
                  T.let(
                    :partial_refund_of_airline_ticket,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::CreditReasonIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicates whether this ticket is non-refundable.
              module RestrictedTicketIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No restrictions
                NO_RESTRICTIONS =
                  T.let(
                    :no_restrictions,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )

                # Restricted non-refundable ticket
                RESTRICTED_NON_REFUNDABLE_TICKET =
                  T.let(
                    :restricted_non_refundable_ticket,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::RestrictedTicketIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # Indicates why a ticket was changed.
              module TicketChangeIndicator
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # None
                NONE =
                  T.let(
                    :none,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                # Change to existing ticket
                CHANGE_TO_EXISTING_TICKET =
                  T.let(
                    :change_to_existing_ticket,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                # New ticket
                NEW_TICKET =
                  T.let(
                    :new_ticket,
                    Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TicketChangeIndicator::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class TripLeg < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg,
                      Increase::Internal::AnyHash
                    )
                  end

                # Carrier code (e.g., United Airlines, Jet Blue, etc.).
                sig { returns(T.nilable(String)) }
                attr_accessor :carrier_code

                # Code for the destination city or airport.
                sig { returns(T.nilable(String)) }
                attr_accessor :destination_city_airport_code

                # Fare basis code.
                sig { returns(T.nilable(String)) }
                attr_accessor :fare_basis_code

                # Flight number.
                sig { returns(T.nilable(String)) }
                attr_accessor :flight_number

                # Service class (e.g., first class, business class, etc.).
                sig { returns(T.nilable(String)) }
                attr_accessor :service_class

                # Indicates whether a stopover is allowed on this ticket.
                sig do
                  returns(
                    T.nilable(
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )
                  )
                end
                attr_accessor :stop_over_code

                sig do
                  params(
                    carrier_code: T.nilable(String),
                    destination_city_airport_code: T.nilable(String),
                    fare_basis_code: T.nilable(String),
                    flight_number: T.nilable(String),
                    service_class: T.nilable(String),
                    stop_over_code:
                      T.nilable(
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::OrSymbol
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Carrier code (e.g., United Airlines, Jet Blue, etc.).
                  carrier_code:,
                  # Code for the destination city or airport.
                  destination_city_airport_code:,
                  # Fare basis code.
                  fare_basis_code:,
                  # Flight number.
                  flight_number:,
                  # Service class (e.g., first class, business class, etc.).
                  service_class:,
                  # Indicates whether a stopover is allowed on this ticket.
                  stop_over_code:
                )
                end

                sig do
                  override.returns(
                    {
                      carrier_code: T.nilable(String),
                      destination_city_airport_code: T.nilable(String),
                      fare_basis_code: T.nilable(String),
                      flight_number: T.nilable(String),
                      service_class: T.nilable(String),
                      stop_over_code:
                        T.nilable(
                          Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                        )
                    }
                  )
                end
                def to_hash
                end

                # Indicates whether a stopover is allowed on this ticket.
                module StopOverCode
                  extend Increase::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  # None
                  NONE =
                    T.let(
                      :none,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  # Stop over allowed
                  STOP_OVER_ALLOWED =
                    T.let(
                      :stop_over_allowed,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  # Stop over not allowed
                  STOP_OVER_NOT_ALLOWED =
                    T.let(
                      :stop_over_not_allowed,
                      Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Increase::CardPayment::Element::CardSettlement::PurchaseDetails::Travel::TripLeg::StopOverCode::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end
          end

          class Surcharge < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardSettlement::Surcharge,
                  Increase::Internal::AnyHash
                )
              end

            # The surcharge amount in the minor unit of the transaction's settlement currency.
            sig { returns(Integer) }
            attr_accessor :amount

            # The surcharge amount in the minor unit of the transaction's presentment
            # currency.
            sig { returns(Integer) }
            attr_accessor :presentment_amount

            # Surcharge amount details, if applicable. The amount is positive if the surcharge
            # is added to to the overall transaction amount (surcharge), and negative if the
            # surcharge is deducted from the overall transaction amount (discount).
            sig do
              params(amount: Integer, presentment_amount: Integer).returns(
                T.attached_class
              )
            end
            def self.new(
              # The surcharge amount in the minor unit of the transaction's settlement currency.
              amount:,
              # The surcharge amount in the minor unit of the transaction's presentment
              # currency.
              presentment_amount:
            )
            end

            sig do
              override.returns({ amount: Integer, presentment_amount: Integer })
            end
            def to_hash
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `card_settlement`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardSettlement::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CARD_SETTLEMENT =
              T.let(
                :card_settlement,
                Increase::CardPayment::Element::CardSettlement::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardSettlement::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class CardValidation < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::CardValidation,
                Increase::Internal::AnyHash
              )
            end

          # The Card Validation identifier.
          sig { returns(String) }
          attr_accessor :id

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          sig do
            returns(
              Increase::CardPayment::Element::CardValidation::Actioner::TaggedSymbol
            )
          end
          attr_accessor :actioner

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardValidation::AdditionalAmounts
            )
          end
          attr_reader :additional_amounts

          sig do
            params(
              additional_amounts:
                Increase::CardPayment::Element::CardValidation::AdditionalAmounts::OrHash
            ).void
          end
          attr_writer :additional_amounts

          # The ID of the Card Payment this transaction belongs to.
          sig { returns(String) }
          attr_accessor :card_payment_id

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          sig do
            returns(
              Increase::CardPayment::Element::CardValidation::Currency::TaggedSymbol
            )
          end
          attr_accessor :currency

          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :digital_wallet_token_id

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
            returns(
              Increase::CardPayment::Element::CardValidation::NetworkDetails
            )
          end
          attr_reader :network_details

          sig do
            params(
              network_details:
                Increase::CardPayment::Element::CardValidation::NetworkDetails::OrHash
            ).void
          end
          attr_writer :network_details

          # Network-specific identifiers for a specific request or transaction.
          sig do
            returns(
              Increase::CardPayment::Element::CardValidation::NetworkIdentifiers
            )
          end
          attr_reader :network_identifiers

          sig do
            params(
              network_identifiers:
                Increase::CardPayment::Element::CardValidation::NetworkIdentifiers::OrHash
            ).void
          end
          attr_writer :network_identifiers

          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          # score is from 0 to 999, where 999 is the riskiest.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :network_risk_score

          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          sig { returns(T.nilable(String)) }
          attr_accessor :physical_card_id

          # The identifier of the Real-Time Decision sent to approve or decline this
          # transaction.
          sig { returns(T.nilable(String)) }
          attr_accessor :real_time_decision_id

          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          sig { returns(T.nilable(String)) }
          attr_accessor :terminal_id

          # A constant representing the object's type. For this resource it will always be
          # `inbound_card_validation`.
          sig do
            returns(
              Increase::CardPayment::Element::CardValidation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Fields related to verification of cardholder-provided values.
          sig do
            returns(
              Increase::CardPayment::Element::CardValidation::Verification
            )
          end
          attr_reader :verification

          sig do
            params(
              verification:
                Increase::CardPayment::Element::CardValidation::Verification::OrHash
            ).void
          end
          attr_writer :verification

          # An Inbound Card Validation object. This field will be present in the JSON
          # response if and only if `category` is equal to `card_validation`. Inbound Card
          # Validations are requests from a merchant to verify that a card number and
          # optionally its address and/or Card Verification Value are valid.
          sig do
            params(
              id: String,
              actioner:
                Increase::CardPayment::Element::CardValidation::Actioner::OrSymbol,
              additional_amounts:
                Increase::CardPayment::Element::CardValidation::AdditionalAmounts::OrHash,
              card_payment_id: String,
              currency:
                Increase::CardPayment::Element::CardValidation::Currency::OrSymbol,
              digital_wallet_token_id: T.nilable(String),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::CardPayment::Element::CardValidation::NetworkDetails::OrHash,
              network_identifiers:
                Increase::CardPayment::Element::CardValidation::NetworkIdentifiers::OrHash,
              network_risk_score: T.nilable(Integer),
              physical_card_id: T.nilable(String),
              real_time_decision_id: T.nilable(String),
              terminal_id: T.nilable(String),
              type:
                Increase::CardPayment::Element::CardValidation::Type::OrSymbol,
              verification:
                Increase::CardPayment::Element::CardValidation::Verification::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The Card Validation identifier.
            id:,
            # Whether this authorization was approved by Increase, the card network through
            # stand-in processing, or the user through a real-time decision.
            actioner:,
            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            additional_amounts:,
            # The ID of the Card Payment this transaction belongs to.
            card_payment_id:,
            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # transaction's currency.
            currency:,
            # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
            # purchase), the identifier of the token that was used.
            digital_wallet_token_id:,
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
            # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
            # score is from 0 to 999, where 999 is the riskiest.
            network_risk_score:,
            # If the authorization was made in-person with a physical card, the Physical Card
            # that was used.
            physical_card_id:,
            # The identifier of the Real-Time Decision sent to approve or decline this
            # transaction.
            real_time_decision_id:,
            # The terminal identifier (commonly abbreviated as TID) of the terminal the card
            # is transacting with.
            terminal_id:,
            # A constant representing the object's type. For this resource it will always be
            # `inbound_card_validation`.
            type:,
            # Fields related to verification of cardholder-provided values.
            verification:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                actioner:
                  Increase::CardPayment::Element::CardValidation::Actioner::TaggedSymbol,
                additional_amounts:
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts,
                card_payment_id: String,
                currency:
                  Increase::CardPayment::Element::CardValidation::Currency::TaggedSymbol,
                digital_wallet_token_id: T.nilable(String),
                merchant_acceptor_id: String,
                merchant_category_code: String,
                merchant_city: T.nilable(String),
                merchant_country: String,
                merchant_descriptor: String,
                merchant_postal_code: T.nilable(String),
                merchant_state: T.nilable(String),
                network_details:
                  Increase::CardPayment::Element::CardValidation::NetworkDetails,
                network_identifiers:
                  Increase::CardPayment::Element::CardValidation::NetworkIdentifiers,
                network_risk_score: T.nilable(Integer),
                physical_card_id: T.nilable(String),
                real_time_decision_id: T.nilable(String),
                terminal_id: T.nilable(String),
                type:
                  Increase::CardPayment::Element::CardValidation::Type::TaggedSymbol,
                verification:
                  Increase::CardPayment::Element::CardValidation::Verification
              }
            )
          end
          def to_hash
          end

          # Whether this authorization was approved by Increase, the card network through
          # stand-in processing, or the user through a real-time decision.
          module Actioner
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardValidation::Actioner
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # This object was actioned by the user through a real-time decision.
            USER =
              T.let(
                :user,
                Increase::CardPayment::Element::CardValidation::Actioner::TaggedSymbol
              )

            # This object was actioned by Increase without user intervention.
            INCREASE =
              T.let(
                :increase,
                Increase::CardPayment::Element::CardValidation::Actioner::TaggedSymbol
              )

            # This object was actioned by the network, through stand-in processing.
            NETWORK =
              T.let(
                :network,
                Increase::CardPayment::Element::CardValidation::Actioner::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardValidation::Actioner::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class AdditionalAmounts < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts,
                  Increase::Internal::AnyHash
                )
              end

            # The part of this transaction amount that was for clinic-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic
                )
              )
            end
            attr_reader :clinic

            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic::OrHash
                  )
              ).void
            end
            attr_writer :clinic

            # The part of this transaction amount that was for dental-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Dental
                )
              )
            end
            attr_reader :dental

            sig do
              params(
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Dental::OrHash
                  )
              ).void
            end
            attr_writer :dental

            # The original pre-authorized amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Original
                )
              )
            end
            attr_reader :original

            sig do
              params(
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Original::OrHash
                  )
              ).void
            end
            attr_writer :original

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription
                )
              )
            end
            attr_reader :prescription

            sig do
              params(
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription::OrHash
                  )
              ).void
            end
            attr_writer :prescription

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge
                )
              )
            end
            attr_reader :surcharge

            sig do
              params(
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge::OrHash
                  )
              ).void
            end
            attr_writer :surcharge

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative
                )
              )
            end
            attr_reader :total_cumulative

            sig do
              params(
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative::OrHash
                  )
              ).void
            end
            attr_writer :total_cumulative

            # The total amount of healthcare-related additional amounts.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare
                )
              )
            end
            attr_reader :total_healthcare

            sig do
              params(
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare::OrHash
                  )
              ).void
            end
            attr_writer :total_healthcare

            # The part of this transaction amount that was for transit-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Transit
                )
              )
            end
            attr_reader :transit

            sig do
              params(
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Transit::OrHash
                  )
              ).void
            end
            attr_writer :transit

            # An unknown additional amount.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown
                )
              )
            end
            attr_reader :unknown

            sig do
              params(
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown::OrHash
                  )
              ).void
            end
            attr_writer :unknown

            # The part of this transaction amount that was for vision-related services.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Vision
                )
              )
            end
            attr_reader :vision

            sig do
              params(
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Vision::OrHash
                  )
              ).void
            end
            attr_writer :vision

            # Additional amounts associated with the card authorization, such as ATM
            # surcharges fees. These are usually a subset of the `amount` field and are used
            # to provide more detailed information about the transaction.
            sig do
              params(
                clinic:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic::OrHash
                  ),
                dental:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Dental::OrHash
                  ),
                original:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Original::OrHash
                  ),
                prescription:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription::OrHash
                  ),
                surcharge:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge::OrHash
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative::OrHash
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare::OrHash
                  ),
                transit:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Transit::OrHash
                  ),
                unknown:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown::OrHash
                  ),
                vision:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Vision::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The part of this transaction amount that was for clinic-related services.
              clinic:,
              # The part of this transaction amount that was for dental-related services.
              dental:,
              # The original pre-authorized amount.
              original:,
              # The part of this transaction amount that was for healthcare prescriptions.
              prescription:,
              # The surcharge amount charged for this transaction by the merchant.
              surcharge:,
              # The total amount of a series of incremental authorizations, optionally provided.
              total_cumulative:,
              # The total amount of healthcare-related additional amounts.
              total_healthcare:,
              # The part of this transaction amount that was for transit-related services.
              transit:,
              # An unknown additional amount.
              unknown:,
              # The part of this transaction amount that was for vision-related services.
              vision:
            )
            end

            sig do
              override.returns(
                {
                  clinic:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic
                    ),
                  dental:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Dental
                    ),
                  original:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Original
                    ),
                  prescription:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription
                    ),
                  surcharge:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge
                    ),
                  total_cumulative:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative
                    ),
                  total_healthcare:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare
                    ),
                  transit:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Transit
                    ),
                  unknown:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown
                    ),
                  vision:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Vision
                    )
                }
              )
            end
            def to_hash
            end

            class Clinic < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Clinic,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for clinic-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Dental < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Dental,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for dental-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Original < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Original,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The original pre-authorized amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Prescription < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Prescription,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for healthcare prescriptions.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Surcharge < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Surcharge,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The surcharge amount charged for this transaction by the merchant.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalCumulative < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalCumulative,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of a series of incremental authorizations, optionally provided.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class TotalHealthcare < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::TotalHealthcare,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The total amount of healthcare-related additional amounts.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Transit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Transit,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for transit-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Unknown < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Unknown,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # An unknown additional amount.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end

            class Vision < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::AdditionalAmounts::Vision,
                    Increase::Internal::AnyHash
                  )
                end

              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              sig { returns(Integer) }
              attr_accessor :amount

              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              sig { returns(String) }
              attr_accessor :currency

              # The part of this transaction amount that was for vision-related services.
              sig do
                params(amount: Integer, currency: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The amount in minor units of the `currency` field. The amount is positive if it
                # is added to the amount (such as an ATM surcharge fee) and negative if it is
                # subtracted from the amount (such as a discount).
                amount:,
                # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
                # amount's currency.
                currency:
              )
              end

              sig { override.returns({ amount: Integer, currency: String }) }
              def to_hash
              end
            end
          end

          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
          # transaction's currency.
          module Currency
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardValidation::Currency
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # US Dollar (USD)
            USD =
              T.let(
                :USD,
                Increase::CardPayment::Element::CardValidation::Currency::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardValidation::Currency::TaggedSymbol
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
                  Increase::CardPayment::Element::CardValidation::NetworkDetails,
                  Increase::Internal::AnyHash
                )
              end

            # The payment network used to process this card authorization.
            sig do
              returns(
                Increase::CardPayment::Element::CardValidation::NetworkDetails::Category::TaggedSymbol
              )
            end
            attr_accessor :category

            # Fields specific to the `pulse` network.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::NetworkDetails::Pulse
                )
              )
            end
            attr_reader :pulse

            sig do
              params(
                pulse:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Pulse::OrHash
                  )
              ).void
            end
            attr_writer :pulse

            # Fields specific to the `visa` network.
            sig do
              returns(
                T.nilable(
                  Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa
                )
              )
            end
            attr_reader :visa

            sig do
              params(
                visa:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::OrHash
                  )
              ).void
            end
            attr_writer :visa

            # Fields specific to the `network`.
            sig do
              params(
                category:
                  Increase::CardPayment::Element::CardValidation::NetworkDetails::Category::OrSymbol,
                pulse:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Pulse::OrHash
                  ),
                visa:
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The payment network used to process this card authorization.
              category:,
              # Fields specific to the `pulse` network.
              pulse:,
              # Fields specific to the `visa` network.
              visa:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Category::TaggedSymbol,
                  pulse:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Pulse
                    ),
                  visa:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa
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
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Visa
              VISA =
                T.let(
                  :visa,
                  Increase::CardPayment::Element::CardValidation::NetworkDetails::Category::TaggedSymbol
                )

              # Pulse
              PULSE =
                T.let(
                  :pulse,
                  Increase::CardPayment::Element::CardValidation::NetworkDetails::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Category::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Pulse < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Pulse,
                    Increase::Internal::AnyHash
                  )
                end

              # Fields specific to the `pulse` network.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class Visa < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa,
                    Increase::Internal::AnyHash
                  )
                end

              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )
                )
              end
              attr_accessor :electronic_commerce_indicator

              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )
                )
              end
              attr_accessor :point_of_service_entry_mode

              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              sig do
                returns(
                  T.nilable(
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )
                )
              end
              attr_accessor :stand_in_processing_reason

              # Fields specific to the `visa` network.
              sig do
                params(
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
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
                        Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                      ),
                    point_of_service_entry_mode:
                      T.nilable(
                        Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                      ),
                    stand_in_processing_reason:
                      T.nilable(
                        Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
                MAIL_PHONE_ORDER =
                  T.let(
                    :mail_phone_order,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
                RECURRING =
                  T.let(
                    :recurring,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
                INSTALLMENT =
                  T.let(
                    :installment,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
                UNKNOWN_MAIL_PHONE_ORDER =
                  T.let(
                    :unknown_mail_phone_order,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
                SECURE_ELECTRONIC_COMMERCE =
                  T.let(
                    :secure_electronic_commerce,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
                NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                  T.let(
                    :non_authenticated_security_transaction_at_3ds_capable_merchant,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
                NON_AUTHENTICATED_SECURITY_TRANSACTION =
                  T.let(
                    :non_authenticated_security_transaction,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
                NON_SECURE_TRANSACTION =
                  T.let(
                    :non_secure_transaction,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
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
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Unknown
                UNKNOWN =
                  T.let(
                    :unknown,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Manual key entry
                MANUAL =
                  T.let(
                    :manual,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read, without card verification value
                MAGNETIC_STRIPE_NO_CVV =
                  T.let(
                    :magnetic_stripe_no_cvv,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Optical code
                OPTICAL_CODE =
                  T.let(
                    :optical_code,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card
                INTEGRATED_CIRCUIT_CARD =
                  T.let(
                    :integrated_circuit_card,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of chip card
                CONTACTLESS =
                  T.let(
                    :contactless,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Transaction initiated using a credential that has previously been stored on file
                CREDENTIAL_ON_FILE =
                  T.let(
                    :credential_on_file,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Magnetic stripe read
                MAGNETIC_STRIPE =
                  T.let(
                    :magnetic_stripe,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contactless read of magnetic stripe data
                CONTACTLESS_MAGNETIC_STRIPE =
                  T.let(
                    :contactless_magnetic_stripe,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                # Contact chip card, without card verification value
                INTEGRATED_CIRCUIT_CARD_NO_CVV =
                  T.let(
                    :integrated_circuit_card_no_cvv,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
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
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Increase failed to process the authorization in a timely manner.
                ISSUER_ERROR =
                  T.let(
                    :issuer_error,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The physical card read had an invalid CVV, dCVV, or authorization request cryptogram.
                INVALID_PHYSICAL_CARD =
                  T.let(
                    :invalid_physical_card,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The 3DS cardholder authentication verification value was invalid.
                INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                  T.let(
                    :invalid_cardholder_authentication_verification_value,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
                INTERNAL_VISA_ERROR =
                  T.let(
                    :internal_visa_error,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
                MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                  T.let(
                    :merchant_transaction_advisory_service_authentication_required,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
                PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                  T.let(
                    :payment_fraud_disruption_acquirer_block,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                # An unspecific reason for stand-in processing.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardValidation::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
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
                  Increase::CardPayment::Element::CardValidation::NetworkIdentifiers,
                  Increase::Internal::AnyHash
                )
              end

            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            sig { returns(T.nilable(String)) }
            attr_accessor :authorization_identification_response

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
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The randomly generated 6-character Authorization Identification Response code
              # sent back to the acquirer in an approved response.
              authorization_identification_response:,
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
                  authorization_identification_response: T.nilable(String),
                  retrieval_reference_number: T.nilable(String),
                  trace_number: T.nilable(String),
                  transaction_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          # A constant representing the object's type. For this resource it will always be
          # `inbound_card_validation`.
          module Type
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardPayment::Element::CardValidation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INBOUND_CARD_VALIDATION =
              T.let(
                :inbound_card_validation,
                Increase::CardPayment::Element::CardValidation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardPayment::Element::CardValidation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Verification < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardPayment::Element::CardValidation::Verification,
                  Increase::Internal::AnyHash
                )
              end

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              returns(
                Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode
              )
            end
            attr_reader :card_verification_code

            sig do
              params(
                card_verification_code:
                  Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::OrHash
              ).void
            end
            attr_writer :card_verification_code

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              returns(
                Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress
              )
            end
            attr_reader :cardholder_address

            sig do
              params(
                cardholder_address:
                  Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::OrHash
              ).void
            end
            attr_writer :cardholder_address

            # Fields related to verification of cardholder-provided values.
            sig do
              params(
                card_verification_code:
                  Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::OrHash,
                cardholder_address:
                  Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::OrHash
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
                    Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode,
                  cardholder_address:
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress
                }
              )
            end
            def to_hash
            end

            class CardVerificationCode < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode,
                    Increase::Internal::AnyHash
                  )
                end

              # The result of verifying the Card Verification Code.
              sig do
                returns(
                  Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result::TaggedSymbol
                )
              end
              attr_accessor :result

              # Fields related to verification of the Card Verification Code, a 3-digit code on
              # the back of the card.
              sig do
                params(
                  result:
                    Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result::OrSymbol
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
                      Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result::TaggedSymbol
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
                      Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No card verification code was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code matched the one on file.
                MATCH =
                  T.let(
                    :match,
                    Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                # The card verification code did not match the one on file.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardValidation::Verification::CardVerificationCode::Result::TaggedSymbol
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
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress,
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
                  Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
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
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::OrSymbol
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
                      Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
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
                      Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # No address information was provided in the authorization request.
                NOT_CHECKED =
                  T.let(
                    :not_checked,
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address does not match or was not provided.
                POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                  T.let(
                    :postal_code_match_address_no_match,
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code does not match, but the street address matches or was not provided.
                POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                  T.let(
                    :postal_code_no_match_address_match,
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address match.
                MATCH =
                  T.let(
                    :match,
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code and street address do not match.
                NO_MATCH =
                  T.let(
                    :no_match,
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                # Postal code matches, but the street address was not verified. (deprecated)
                POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                  T.let(
                    :postal_code_match_address_not_checked,
                    Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardPayment::Element::CardValidation::Verification::CardholderAddress::Result::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CardPayment::Element::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Card Authorization: details will be under the `card_authorization` object.
          CARD_AUTHORIZATION =
            T.let(
              :card_authorization,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Authentication: details will be under the `card_authentication` object.
          CARD_AUTHENTICATION =
            T.let(
              :card_authentication,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Inbound Card Validation: details will be under the `card_validation` object.
          CARD_VALIDATION =
            T.let(
              :card_validation,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Decline: details will be under the `card_decline` object.
          CARD_DECLINE =
            T.let(
              :card_decline,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Reversal: details will be under the `card_reversal` object.
          CARD_REVERSAL =
            T.let(
              :card_reversal,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Authorization Expiration: details will be under the `card_authorization_expiration` object.
          CARD_AUTHORIZATION_EXPIRATION =
            T.let(
              :card_authorization_expiration,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Increment: details will be under the `card_increment` object.
          CARD_INCREMENT =
            T.let(
              :card_increment,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Settlement: details will be under the `card_settlement` object.
          CARD_SETTLEMENT =
            T.let(
              :card_settlement,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Refund: details will be under the `card_refund` object.
          CARD_REFUND =
            T.let(
              :card_refund,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Fuel Confirmation: details will be under the `card_fuel_confirmation` object.
          CARD_FUEL_CONFIRMATION =
            T.let(
              :card_fuel_confirmation,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Card Financial: details will be under the `card_financial` object.
          CARD_FINANCIAL =
            T.let(
              :card_financial,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          # Unknown card payment element.
          OTHER =
            T.let(
              :other,
              Increase::CardPayment::Element::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::CardPayment::Element::Category::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class Other < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardPayment::Element::Other,
                Increase::Internal::AnyHash
              )
            end

          # If the category of this Transaction source is equal to `other`, this field will
          # contain an empty object, otherwise it will contain null.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end
      end

      class State < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::CardPayment::State, Increase::Internal::AnyHash)
          end

        # The total authorized amount in the minor unit of the transaction's currency. For
        # dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :authorized_amount

        # The total amount from fuel confirmations in the minor unit of the transaction's
        # currency. For dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :fuel_confirmed_amount

        # The total incrementally updated authorized amount in the minor unit of the
        # transaction's currency. For dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :incremented_amount

        # The total refund authorized amount in the minor unit of the transaction's
        # currency. For dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :refund_authorized_amount

        # The total refunded amount in the minor unit of the transaction's currency. For
        # dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :refunded_amount

        # The total reversed amount in the minor unit of the transaction's currency. For
        # dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :reversed_amount

        # The total settled amount in the minor unit of the transaction's currency. For
        # dollars, for example, this is cents.
        sig { returns(Integer) }
        attr_accessor :settled_amount

        # The summarized state of this card payment.
        sig do
          params(
            authorized_amount: Integer,
            fuel_confirmed_amount: Integer,
            incremented_amount: Integer,
            refund_authorized_amount: Integer,
            refunded_amount: Integer,
            reversed_amount: Integer,
            settled_amount: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # The total authorized amount in the minor unit of the transaction's currency. For
          # dollars, for example, this is cents.
          authorized_amount:,
          # The total amount from fuel confirmations in the minor unit of the transaction's
          # currency. For dollars, for example, this is cents.
          fuel_confirmed_amount:,
          # The total incrementally updated authorized amount in the minor unit of the
          # transaction's currency. For dollars, for example, this is cents.
          incremented_amount:,
          # The total refund authorized amount in the minor unit of the transaction's
          # currency. For dollars, for example, this is cents.
          refund_authorized_amount:,
          # The total refunded amount in the minor unit of the transaction's currency. For
          # dollars, for example, this is cents.
          refunded_amount:,
          # The total reversed amount in the minor unit of the transaction's currency. For
          # dollars, for example, this is cents.
          reversed_amount:,
          # The total settled amount in the minor unit of the transaction's currency. For
          # dollars, for example, this is cents.
          settled_amount:
        )
        end

        sig do
          override.returns(
            {
              authorized_amount: Integer,
              fuel_confirmed_amount: Integer,
              incremented_amount: Integer,
              refund_authorized_amount: Integer,
              refunded_amount: Integer,
              reversed_amount: Integer,
              settled_amount: Integer
            }
          )
        end
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_payment`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardPayment::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_PAYMENT =
          T.let(:card_payment, Increase::CardPayment::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::CardPayment::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
