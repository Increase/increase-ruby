# typed: strong

module Increase
  module Models
    class Card < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Card, Increase::Internal::AnyHash) }

      # The card identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the account this card belongs to.
      sig { returns(String) }
      attr_accessor :account_id

      # Controls that restrict how this card can be used.
      sig { returns(T.nilable(Increase::Card::AuthorizationControls)) }
      attr_reader :authorization_controls

      sig do
        params(
          authorization_controls:
            T.nilable(Increase::Card::AuthorizationControls::OrHash)
        ).void
      end
      attr_writer :authorization_controls

      # The Card's billing address.
      sig { returns(Increase::Card::BillingAddress) }
      attr_reader :billing_address

      sig do
        params(billing_address: Increase::Card::BillingAddress::OrHash).void
      end
      attr_writer :billing_address

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Card was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The card's description for display purposes.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # The contact information used in the two-factor steps for digital wallet card
      # creation. At least one field must be present to complete the digital wallet
      # steps.
      sig { returns(T.nilable(Increase::Card::DigitalWallet)) }
      attr_reader :digital_wallet

      sig do
        params(
          digital_wallet: T.nilable(Increase::Card::DigitalWallet::OrHash)
        ).void
      end
      attr_writer :digital_wallet

      # The identifier for the entity associated with this card.
      sig { returns(T.nilable(String)) }
      attr_accessor :entity_id

      # The month the card expires in M format (e.g., August is 8).
      sig { returns(Integer) }
      attr_accessor :expiration_month

      # The year the card expires in YYYY format (e.g., 2025).
      sig { returns(Integer) }
      attr_accessor :expiration_year

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The last 4 digits of the Card's Primary Account Number.
      sig { returns(String) }
      attr_accessor :last4

      # This indicates if payments can be made with the card.
      sig { returns(Increase::Card::Status::TaggedSymbol) }
      attr_accessor :status

      # A constant representing the object's type. For this resource it will always be
      # `card`.
      sig { returns(Increase::Card::Type::TaggedSymbol) }
      attr_accessor :type

      # Cards may operate on credit, debit or prepaid BINs. They’ll immediately work for
      # online purchases after you create them. All cards work on a good funds model,
      # and maintain a maximum limit of 100% of the Account’s available balance at the
      # time of transaction. Funds are deducted from the Account upon transaction
      # settlement.
      sig do
        params(
          id: String,
          account_id: String,
          authorization_controls:
            T.nilable(Increase::Card::AuthorizationControls::OrHash),
          billing_address: Increase::Card::BillingAddress::OrHash,
          created_at: Time,
          description: T.nilable(String),
          digital_wallet: T.nilable(Increase::Card::DigitalWallet::OrHash),
          entity_id: T.nilable(String),
          expiration_month: Integer,
          expiration_year: Integer,
          idempotency_key: T.nilable(String),
          last4: String,
          status: Increase::Card::Status::OrSymbol,
          type: Increase::Card::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The card identifier.
        id:,
        # The identifier for the account this card belongs to.
        account_id:,
        # Controls that restrict how this card can be used.
        authorization_controls:,
        # The Card's billing address.
        billing_address:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Card was created.
        created_at:,
        # The card's description for display purposes.
        description:,
        # The contact information used in the two-factor steps for digital wallet card
        # creation. At least one field must be present to complete the digital wallet
        # steps.
        digital_wallet:,
        # The identifier for the entity associated with this card.
        entity_id:,
        # The month the card expires in M format (e.g., August is 8).
        expiration_month:,
        # The year the card expires in YYYY format (e.g., 2025).
        expiration_year:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The last 4 digits of the Card's Primary Account Number.
        last4:,
        # This indicates if payments can be made with the card.
        status:,
        # A constant representing the object's type. For this resource it will always be
        # `card`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            authorization_controls:
              T.nilable(Increase::Card::AuthorizationControls),
            billing_address: Increase::Card::BillingAddress,
            created_at: Time,
            description: T.nilable(String),
            digital_wallet: T.nilable(Increase::Card::DigitalWallet),
            entity_id: T.nilable(String),
            expiration_month: Integer,
            expiration_year: Integer,
            idempotency_key: T.nilable(String),
            last4: String,
            status: Increase::Card::Status::TaggedSymbol,
            type: Increase::Card::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class AuthorizationControls < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Card::AuthorizationControls,
              Increase::Internal::AnyHash
            )
          end

        # Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
        # on this card.
        sig do
          returns(
            T.nilable(
              Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier
            )
          )
        end
        attr_reader :merchant_acceptor_identifier

        sig do
          params(
            merchant_acceptor_identifier:
              T.nilable(
                Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::OrHash
              )
          ).void
        end
        attr_writer :merchant_acceptor_identifier

        # Restricts which Merchant Category Codes are allowed or blocked for
        # authorizations on this card.
        sig do
          returns(
            T.nilable(
              Increase::Card::AuthorizationControls::MerchantCategoryCode
            )
          )
        end
        attr_reader :merchant_category_code

        sig do
          params(
            merchant_category_code:
              T.nilable(
                Increase::Card::AuthorizationControls::MerchantCategoryCode::OrHash
              )
          ).void
        end
        attr_writer :merchant_category_code

        # Restricts which merchant countries are allowed or blocked for authorizations on
        # this card.
        sig do
          returns(
            T.nilable(Increase::Card::AuthorizationControls::MerchantCountry)
          )
        end
        attr_reader :merchant_country

        sig do
          params(
            merchant_country:
              T.nilable(
                Increase::Card::AuthorizationControls::MerchantCountry::OrHash
              )
          ).void
        end
        attr_writer :merchant_country

        # Controls how many times this card can be used.
        sig { returns(T.nilable(Increase::Card::AuthorizationControls::Usage)) }
        attr_reader :usage

        sig do
          params(
            usage:
              T.nilable(Increase::Card::AuthorizationControls::Usage::OrHash)
          ).void
        end
        attr_writer :usage

        # Controls that restrict how this card can be used.
        sig do
          params(
            merchant_acceptor_identifier:
              T.nilable(
                Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::OrHash
              ),
            merchant_category_code:
              T.nilable(
                Increase::Card::AuthorizationControls::MerchantCategoryCode::OrHash
              ),
            merchant_country:
              T.nilable(
                Increase::Card::AuthorizationControls::MerchantCountry::OrHash
              ),
            usage:
              T.nilable(Increase::Card::AuthorizationControls::Usage::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
          # on this card.
          merchant_acceptor_identifier:,
          # Restricts which Merchant Category Codes are allowed or blocked for
          # authorizations on this card.
          merchant_category_code:,
          # Restricts which merchant countries are allowed or blocked for authorizations on
          # this card.
          merchant_country:,
          # Controls how many times this card can be used.
          usage:
        )
        end

        sig do
          override.returns(
            {
              merchant_acceptor_identifier:
                T.nilable(
                  Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier
                ),
              merchant_category_code:
                T.nilable(
                  Increase::Card::AuthorizationControls::MerchantCategoryCode
                ),
              merchant_country:
                T.nilable(
                  Increase::Card::AuthorizationControls::MerchantCountry
                ),
              usage: T.nilable(Increase::Card::AuthorizationControls::Usage)
            }
          )
        end
        def to_hash
        end

        class MerchantAcceptorIdentifier < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier,
                Increase::Internal::AnyHash
              )
            end

          # The Merchant Acceptor IDs that are allowed for authorizations on this card.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Allowed
                ]
              )
            )
          end
          attr_accessor :allowed

          # The Merchant Acceptor IDs that are blocked for authorizations on this card.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Blocked
                ]
              )
            )
          end
          attr_accessor :blocked

          # Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
          # on this card.
          sig do
            params(
              allowed:
                T.nilable(
                  T::Array[
                    Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Allowed::OrHash
                  ]
                ),
              blocked:
                T.nilable(
                  T::Array[
                    Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Blocked::OrHash
                  ]
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The Merchant Acceptor IDs that are allowed for authorizations on this card.
            allowed:,
            # The Merchant Acceptor IDs that are blocked for authorizations on this card.
            blocked:
          )
          end

          sig do
            override.returns(
              {
                allowed:
                  T.nilable(
                    T::Array[
                      Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Allowed
                    ]
                  ),
                blocked:
                  T.nilable(
                    T::Array[
                      Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Blocked
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class Allowed < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Allowed,
                  Increase::Internal::AnyHash
                )
              end

            # The Merchant Acceptor ID.
            sig { returns(String) }
            attr_accessor :identifier

            sig { params(identifier: String).returns(T.attached_class) }
            def self.new(
              # The Merchant Acceptor ID.
              identifier:
            )
            end

            sig { override.returns({ identifier: String }) }
            def to_hash
            end
          end

          class Blocked < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Card::AuthorizationControls::MerchantAcceptorIdentifier::Blocked,
                  Increase::Internal::AnyHash
                )
              end

            # The Merchant Acceptor ID.
            sig { returns(String) }
            attr_accessor :identifier

            sig { params(identifier: String).returns(T.attached_class) }
            def self.new(
              # The Merchant Acceptor ID.
              identifier:
            )
            end

            sig { override.returns({ identifier: String }) }
            def to_hash
            end
          end
        end

        class MerchantCategoryCode < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Card::AuthorizationControls::MerchantCategoryCode,
                Increase::Internal::AnyHash
              )
            end

          # The Merchant Category Codes that are allowed for authorizations on this card.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::Card::AuthorizationControls::MerchantCategoryCode::Allowed
                ]
              )
            )
          end
          attr_accessor :allowed

          # The Merchant Category Codes that are blocked for authorizations on this card.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::Card::AuthorizationControls::MerchantCategoryCode::Blocked
                ]
              )
            )
          end
          attr_accessor :blocked

          # Restricts which Merchant Category Codes are allowed or blocked for
          # authorizations on this card.
          sig do
            params(
              allowed:
                T.nilable(
                  T::Array[
                    Increase::Card::AuthorizationControls::MerchantCategoryCode::Allowed::OrHash
                  ]
                ),
              blocked:
                T.nilable(
                  T::Array[
                    Increase::Card::AuthorizationControls::MerchantCategoryCode::Blocked::OrHash
                  ]
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The Merchant Category Codes that are allowed for authorizations on this card.
            allowed:,
            # The Merchant Category Codes that are blocked for authorizations on this card.
            blocked:
          )
          end

          sig do
            override.returns(
              {
                allowed:
                  T.nilable(
                    T::Array[
                      Increase::Card::AuthorizationControls::MerchantCategoryCode::Allowed
                    ]
                  ),
                blocked:
                  T.nilable(
                    T::Array[
                      Increase::Card::AuthorizationControls::MerchantCategoryCode::Blocked
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class Allowed < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Card::AuthorizationControls::MerchantCategoryCode::Allowed,
                  Increase::Internal::AnyHash
                )
              end

            # The Merchant Category Code (MCC).
            sig { returns(String) }
            attr_accessor :code

            sig { params(code: String).returns(T.attached_class) }
            def self.new(
              # The Merchant Category Code (MCC).
              code:
            )
            end

            sig { override.returns({ code: String }) }
            def to_hash
            end
          end

          class Blocked < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Card::AuthorizationControls::MerchantCategoryCode::Blocked,
                  Increase::Internal::AnyHash
                )
              end

            # The Merchant Category Code (MCC).
            sig { returns(String) }
            attr_accessor :code

            sig { params(code: String).returns(T.attached_class) }
            def self.new(
              # The Merchant Category Code (MCC).
              code:
            )
            end

            sig { override.returns({ code: String }) }
            def to_hash
            end
          end
        end

        class MerchantCountry < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Card::AuthorizationControls::MerchantCountry,
                Increase::Internal::AnyHash
              )
            end

          # The merchant countries that are allowed for authorizations on this card.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::Card::AuthorizationControls::MerchantCountry::Allowed
                ]
              )
            )
          end
          attr_accessor :allowed

          # The merchant countries that are blocked for authorizations on this card.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::Card::AuthorizationControls::MerchantCountry::Blocked
                ]
              )
            )
          end
          attr_accessor :blocked

          # Restricts which merchant countries are allowed or blocked for authorizations on
          # this card.
          sig do
            params(
              allowed:
                T.nilable(
                  T::Array[
                    Increase::Card::AuthorizationControls::MerchantCountry::Allowed::OrHash
                  ]
                ),
              blocked:
                T.nilable(
                  T::Array[
                    Increase::Card::AuthorizationControls::MerchantCountry::Blocked::OrHash
                  ]
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The merchant countries that are allowed for authorizations on this card.
            allowed:,
            # The merchant countries that are blocked for authorizations on this card.
            blocked:
          )
          end

          sig do
            override.returns(
              {
                allowed:
                  T.nilable(
                    T::Array[
                      Increase::Card::AuthorizationControls::MerchantCountry::Allowed
                    ]
                  ),
                blocked:
                  T.nilable(
                    T::Array[
                      Increase::Card::AuthorizationControls::MerchantCountry::Blocked
                    ]
                  )
              }
            )
          end
          def to_hash
          end

          class Allowed < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Card::AuthorizationControls::MerchantCountry::Allowed,
                  Increase::Internal::AnyHash
                )
              end

            # The ISO 3166-1 alpha-2 country code.
            sig { returns(String) }
            attr_accessor :country

            sig { params(country: String).returns(T.attached_class) }
            def self.new(
              # The ISO 3166-1 alpha-2 country code.
              country:
            )
            end

            sig { override.returns({ country: String }) }
            def to_hash
            end
          end

          class Blocked < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Card::AuthorizationControls::MerchantCountry::Blocked,
                  Increase::Internal::AnyHash
                )
              end

            # The ISO 3166-1 alpha-2 country code.
            sig { returns(String) }
            attr_accessor :country

            sig { params(country: String).returns(T.attached_class) }
            def self.new(
              # The ISO 3166-1 alpha-2 country code.
              country:
            )
            end

            sig { override.returns({ country: String }) }
            def to_hash
            end
          end
        end

        class Usage < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Card::AuthorizationControls::Usage,
                Increase::Internal::AnyHash
              )
            end

          # Whether the card is for a single use or multiple uses.
          sig do
            returns(
              Increase::Card::AuthorizationControls::Usage::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # Controls for multi-use cards. Required if and only if `category` is `multi_use`.
          sig do
            returns(
              T.nilable(Increase::Card::AuthorizationControls::Usage::MultiUse)
            )
          end
          attr_reader :multi_use

          sig do
            params(
              multi_use:
                T.nilable(
                  Increase::Card::AuthorizationControls::Usage::MultiUse::OrHash
                )
            ).void
          end
          attr_writer :multi_use

          # Controls for single-use cards. Required if and only if `category` is
          # `single_use`.
          sig do
            returns(
              T.nilable(Increase::Card::AuthorizationControls::Usage::SingleUse)
            )
          end
          attr_reader :single_use

          sig do
            params(
              single_use:
                T.nilable(
                  Increase::Card::AuthorizationControls::Usage::SingleUse::OrHash
                )
            ).void
          end
          attr_writer :single_use

          # Controls how many times this card can be used.
          sig do
            params(
              category:
                Increase::Card::AuthorizationControls::Usage::Category::OrSymbol,
              multi_use:
                T.nilable(
                  Increase::Card::AuthorizationControls::Usage::MultiUse::OrHash
                ),
              single_use:
                T.nilable(
                  Increase::Card::AuthorizationControls::Usage::SingleUse::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the card is for a single use or multiple uses.
            category:,
            # Controls for multi-use cards. Required if and only if `category` is `multi_use`.
            multi_use:,
            # Controls for single-use cards. Required if and only if `category` is
            # `single_use`.
            single_use:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::Card::AuthorizationControls::Usage::Category::TaggedSymbol,
                multi_use:
                  T.nilable(
                    Increase::Card::AuthorizationControls::Usage::MultiUse
                  ),
                single_use:
                  T.nilable(
                    Increase::Card::AuthorizationControls::Usage::SingleUse
                  )
              }
            )
          end
          def to_hash
          end

          # Whether the card is for a single use or multiple uses.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Card::AuthorizationControls::Usage::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The card can only be used for a single authorization.
            SINGLE_USE =
              T.let(
                :single_use,
                Increase::Card::AuthorizationControls::Usage::Category::TaggedSymbol
              )

            # The card can be used for multiple authorizations.
            MULTI_USE =
              T.let(
                :multi_use,
                Increase::Card::AuthorizationControls::Usage::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Card::AuthorizationControls::Usage::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class MultiUse < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Card::AuthorizationControls::Usage::MultiUse,
                  Increase::Internal::AnyHash
                )
              end

            # Spending limits for this card. The most restrictive limit applies if multiple
            # limits match.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit
                  ]
                )
              )
            end
            attr_accessor :spending_limits

            # Controls for multi-use cards. Required if and only if `category` is `multi_use`.
            sig do
              params(
                spending_limits:
                  T.nilable(
                    T::Array[
                      Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::OrHash
                    ]
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # Spending limits for this card. The most restrictive limit applies if multiple
              # limits match.
              spending_limits:
            )
            end

            sig do
              override.returns(
                {
                  spending_limits:
                    T.nilable(
                      T::Array[
                        Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit
                      ]
                    )
                }
              )
            end
            def to_hash
            end

            class SpendingLimit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit,
                    Increase::Internal::AnyHash
                  )
                end

              # The interval at which the spending limit is enforced.
              sig do
                returns(
                  Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                )
              end
              attr_accessor :interval

              # The Merchant Category Codes (MCCs) this spending limit applies to. If not set,
              # the limit applies to all transactions.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode
                    ]
                  )
                )
              end
              attr_accessor :merchant_category_codes

              # The maximum settlement amount permitted in the given interval.
              sig { returns(Integer) }
              attr_accessor :settlement_amount

              sig do
                params(
                  interval:
                    Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::OrSymbol,
                  merchant_category_codes:
                    T.nilable(
                      T::Array[
                        Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode::OrHash
                      ]
                    ),
                  settlement_amount: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # The interval at which the spending limit is enforced.
                interval:,
                # The Merchant Category Codes (MCCs) this spending limit applies to. If not set,
                # the limit applies to all transactions.
                merchant_category_codes:,
                # The maximum settlement amount permitted in the given interval.
                settlement_amount:
              )
              end

              sig do
                override.returns(
                  {
                    interval:
                      Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol,
                    merchant_category_codes:
                      T.nilable(
                        T::Array[
                          Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode
                        ]
                      ),
                    settlement_amount: Integer
                  }
                )
              end
              def to_hash
              end

              # The interval at which the spending limit is enforced.
              module Interval
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # The spending limit applies over the lifetime of the card.
                ALL_TIME =
                  T.let(
                    :all_time,
                    Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                # The spending limit applies per transaction.
                PER_TRANSACTION =
                  T.let(
                    :per_transaction,
                    Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                # The spending limit applies per day. Resets nightly at midnight UTC.
                PER_DAY =
                  T.let(
                    :per_day,
                    Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                # The spending limit applies per week. Resets weekly on Mondays at midnight UTC.
                PER_WEEK =
                  T.let(
                    :per_week,
                    Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                # The spending limit applies per month. Resets on the first of the month, midnight UTC.
                PER_MONTH =
                  T.let(
                    :per_month,
                    Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class MerchantCategoryCode < Increase::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Increase::Card::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode,
                      Increase::Internal::AnyHash
                    )
                  end

                # The Merchant Category Code (MCC).
                sig { returns(String) }
                attr_accessor :code

                sig { params(code: String).returns(T.attached_class) }
                def self.new(
                  # The Merchant Category Code (MCC).
                  code:
                )
                end

                sig { override.returns({ code: String }) }
                def to_hash
                end
              end
            end
          end

          class SingleUse < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::Card::AuthorizationControls::Usage::SingleUse,
                  Increase::Internal::AnyHash
                )
              end

            # The settlement amount constraint for this single-use card.
            sig do
              returns(
                Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount
              )
            end
            attr_reader :settlement_amount

            sig do
              params(
                settlement_amount:
                  Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::OrHash
              ).void
            end
            attr_writer :settlement_amount

            # Controls for single-use cards. Required if and only if `category` is
            # `single_use`.
            sig do
              params(
                settlement_amount:
                  Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The settlement amount constraint for this single-use card.
              settlement_amount:
            )
            end

            sig do
              override.returns(
                {
                  settlement_amount:
                    Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount
                }
              )
            end
            def to_hash
            end

            class SettlementAmount < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount,
                    Increase::Internal::AnyHash
                  )
                end

              # The operator used to compare the settlement amount.
              sig do
                returns(
                  Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::TaggedSymbol
                )
              end
              attr_accessor :comparison

              # The settlement amount value.
              sig { returns(Integer) }
              attr_accessor :value

              # The settlement amount constraint for this single-use card.
              sig do
                params(
                  comparison:
                    Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::OrSymbol,
                  value: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # The operator used to compare the settlement amount.
                comparison:,
                # The settlement amount value.
                value:
              )
              end

              sig do
                override.returns(
                  {
                    comparison:
                      Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::TaggedSymbol,
                    value: Integer
                  }
                )
              end
              def to_hash
              end

              # The operator used to compare the settlement amount.
              module Comparison
                extend Increase::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # The settlement amount must be exactly the specified value.
                EQUALS =
                  T.let(
                    :equals,
                    Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::TaggedSymbol
                  )

                # The settlement amount must be less than or equal to the specified value.
                LESS_THAN_OR_EQUALS =
                  T.let(
                    :less_than_or_equals,
                    Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::Card::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::TaggedSymbol
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

      class BillingAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Card::BillingAddress, Increase::Internal::AnyHash)
          end

        # The city of the billing address.
        sig { returns(T.nilable(String)) }
        attr_accessor :city

        # The first line of the billing address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line1

        # The second line of the billing address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The postal code of the billing address.
        sig { returns(T.nilable(String)) }
        attr_accessor :postal_code

        # The US state of the billing address.
        sig { returns(T.nilable(String)) }
        attr_accessor :state

        # The Card's billing address.
        sig do
          params(
            city: T.nilable(String),
            line1: T.nilable(String),
            line2: T.nilable(String),
            postal_code: T.nilable(String),
            state: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the billing address.
          city:,
          # The first line of the billing address.
          line1:,
          # The second line of the billing address.
          line2:,
          # The postal code of the billing address.
          postal_code:,
          # The US state of the billing address.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: T.nilable(String),
              line1: T.nilable(String),
              line2: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class DigitalWallet < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Card::DigitalWallet, Increase::Internal::AnyHash)
          end

        # The digital card profile assigned to this digital card. Card profiles may also
        # be assigned at the program level.
        sig { returns(T.nilable(String)) }
        attr_accessor :digital_card_profile_id

        # An email address that can be used to verify the cardholder via one-time passcode
        # over email.
        sig { returns(T.nilable(String)) }
        attr_accessor :email

        # A phone number that can be used to verify the cardholder via one-time passcode
        # over SMS.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone

        # The contact information used in the two-factor steps for digital wallet card
        # creation. At least one field must be present to complete the digital wallet
        # steps.
        sig do
          params(
            digital_card_profile_id: T.nilable(String),
            email: T.nilable(String),
            phone: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The digital card profile assigned to this digital card. Card profiles may also
          # be assigned at the program level.
          digital_card_profile_id:,
          # An email address that can be used to verify the cardholder via one-time passcode
          # over email.
          email:,
          # A phone number that can be used to verify the cardholder via one-time passcode
          # over SMS.
          phone:
        )
        end

        sig do
          override.returns(
            {
              digital_card_profile_id: T.nilable(String),
              email: T.nilable(String),
              phone: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      # This indicates if payments can be made with the card.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Card::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The card is active.
        ACTIVE = T.let(:active, Increase::Card::Status::TaggedSymbol)

        # The card is temporarily disabled.
        DISABLED = T.let(:disabled, Increase::Card::Status::TaggedSymbol)

        # The card is permanently canceled.
        CANCELED = T.let(:canceled, Increase::Card::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Card::Status::TaggedSymbol]) }
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `card`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Card::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD = T.let(:card, Increase::Card::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Card::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
