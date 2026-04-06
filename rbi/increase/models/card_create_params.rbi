# typed: strong

module Increase
  module Models
    class CardCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardCreateParams, Increase::Internal::AnyHash)
        end

      # The Account the card should belong to.
      sig { returns(String) }
      attr_accessor :account_id

      # Controls that restrict how this card can be used.
      sig do
        returns(T.nilable(Increase::CardCreateParams::AuthorizationControls))
      end
      attr_reader :authorization_controls

      sig do
        params(
          authorization_controls:
            Increase::CardCreateParams::AuthorizationControls::OrHash
        ).void
      end
      attr_writer :authorization_controls

      # The card's billing address.
      sig { returns(T.nilable(Increase::CardCreateParams::BillingAddress)) }
      attr_reader :billing_address

      sig do
        params(
          billing_address: Increase::CardCreateParams::BillingAddress::OrHash
        ).void
      end
      attr_writer :billing_address

      # The description you choose to give the card.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The contact information used in the two-factor steps for digital wallet card
      # creation. To add the card to a digital wallet, you may supply an email or phone
      # number with this request. Otherwise, subscribe and then action a Real Time
      # Decision with the category `digital_wallet_token_requested` or
      # `digital_wallet_authentication_requested`.
      sig { returns(T.nilable(Increase::CardCreateParams::DigitalWallet)) }
      attr_reader :digital_wallet

      sig do
        params(
          digital_wallet: Increase::CardCreateParams::DigitalWallet::OrHash
        ).void
      end
      attr_writer :digital_wallet

      # The Entity the card belongs to. You only need to supply this in rare situations
      # when the card is not for the Account holder.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      sig do
        params(
          account_id: String,
          authorization_controls:
            Increase::CardCreateParams::AuthorizationControls::OrHash,
          billing_address: Increase::CardCreateParams::BillingAddress::OrHash,
          description: String,
          digital_wallet: Increase::CardCreateParams::DigitalWallet::OrHash,
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account the card should belong to.
        account_id:,
        # Controls that restrict how this card can be used.
        authorization_controls: nil,
        # The card's billing address.
        billing_address: nil,
        # The description you choose to give the card.
        description: nil,
        # The contact information used in the two-factor steps for digital wallet card
        # creation. To add the card to a digital wallet, you may supply an email or phone
        # number with this request. Otherwise, subscribe and then action a Real Time
        # Decision with the category `digital_wallet_token_requested` or
        # `digital_wallet_authentication_requested`.
        digital_wallet: nil,
        # The Entity the card belongs to. You only need to supply this in rare situations
        # when the card is not for the Account holder.
        entity_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            authorization_controls:
              Increase::CardCreateParams::AuthorizationControls,
            billing_address: Increase::CardCreateParams::BillingAddress,
            description: String,
            digital_wallet: Increase::CardCreateParams::DigitalWallet,
            entity_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class AuthorizationControls < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardCreateParams::AuthorizationControls,
              Increase::Internal::AnyHash
            )
          end

        # Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
        # on this card.
        sig do
          returns(
            T.nilable(
              Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier
            )
          )
        end
        attr_reader :merchant_acceptor_identifier

        sig do
          params(
            merchant_acceptor_identifier:
              Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::OrHash
          ).void
        end
        attr_writer :merchant_acceptor_identifier

        # Restricts which Merchant Category Codes are allowed or blocked for
        # authorizations on this card.
        sig do
          returns(
            T.nilable(
              Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode
            )
          )
        end
        attr_reader :merchant_category_code

        sig do
          params(
            merchant_category_code:
              Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::OrHash
          ).void
        end
        attr_writer :merchant_category_code

        # Restricts which merchant countries are allowed or blocked for authorizations on
        # this card.
        sig do
          returns(
            T.nilable(
              Increase::CardCreateParams::AuthorizationControls::MerchantCountry
            )
          )
        end
        attr_reader :merchant_country

        sig do
          params(
            merchant_country:
              Increase::CardCreateParams::AuthorizationControls::MerchantCountry::OrHash
          ).void
        end
        attr_writer :merchant_country

        # Controls how many times this card can be used.
        sig do
          returns(
            T.nilable(Increase::CardCreateParams::AuthorizationControls::Usage)
          )
        end
        attr_reader :usage

        sig do
          params(
            usage:
              Increase::CardCreateParams::AuthorizationControls::Usage::OrHash
          ).void
        end
        attr_writer :usage

        # Controls that restrict how this card can be used.
        sig do
          params(
            merchant_acceptor_identifier:
              Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::OrHash,
            merchant_category_code:
              Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::OrHash,
            merchant_country:
              Increase::CardCreateParams::AuthorizationControls::MerchantCountry::OrHash,
            usage:
              Increase::CardCreateParams::AuthorizationControls::Usage::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
          # on this card.
          merchant_acceptor_identifier: nil,
          # Restricts which Merchant Category Codes are allowed or blocked for
          # authorizations on this card.
          merchant_category_code: nil,
          # Restricts which merchant countries are allowed or blocked for authorizations on
          # this card.
          merchant_country: nil,
          # Controls how many times this card can be used.
          usage: nil
        )
        end

        sig do
          override.returns(
            {
              merchant_acceptor_identifier:
                Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier,
              merchant_category_code:
                Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode,
              merchant_country:
                Increase::CardCreateParams::AuthorizationControls::MerchantCountry,
              usage: Increase::CardCreateParams::AuthorizationControls::Usage
            }
          )
        end
        def to_hash
        end

        class MerchantAcceptorIdentifier < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier,
                Increase::Internal::AnyHash
              )
            end

          # The Merchant Acceptor IDs that are allowed for authorizations on this card.
          # Authorizations with Merchant Acceptor IDs not in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed
                ]
              )
            )
          end
          attr_reader :allowed

          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed::OrHash
                ]
            ).void
          end
          attr_writer :allowed

          # The Merchant Acceptor IDs that are blocked for authorizations on this card.
          # Authorizations with Merchant Acceptor IDs in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked
                ]
              )
            )
          end
          attr_reader :blocked

          sig do
            params(
              blocked:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked::OrHash
                ]
            ).void
          end
          attr_writer :blocked

          # Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
          # on this card.
          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed::OrHash
                ],
              blocked:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # The Merchant Acceptor IDs that are allowed for authorizations on this card.
            # Authorizations with Merchant Acceptor IDs not in this list will be declined.
            allowed: nil,
            # The Merchant Acceptor IDs that are blocked for authorizations on this card.
            # Authorizations with Merchant Acceptor IDs in this list will be declined.
            blocked: nil
          )
          end

          sig do
            override.returns(
              {
                allowed:
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed
                  ],
                blocked:
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked
                  ]
              }
            )
          end
          def to_hash
          end

          class Allowed < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed,
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
                  Increase::CardCreateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked,
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
                Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode,
                Increase::Internal::AnyHash
              )
            end

          # The Merchant Category Codes that are allowed for authorizations on this card.
          # Authorizations with Merchant Category Codes not in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Allowed
                ]
              )
            )
          end
          attr_reader :allowed

          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Allowed::OrHash
                ]
            ).void
          end
          attr_writer :allowed

          # The Merchant Category Codes that are blocked for authorizations on this card.
          # Authorizations with Merchant Category Codes in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Blocked
                ]
              )
            )
          end
          attr_reader :blocked

          sig do
            params(
              blocked:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Blocked::OrHash
                ]
            ).void
          end
          attr_writer :blocked

          # Restricts which Merchant Category Codes are allowed or blocked for
          # authorizations on this card.
          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Allowed::OrHash
                ],
              blocked:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Blocked::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # The Merchant Category Codes that are allowed for authorizations on this card.
            # Authorizations with Merchant Category Codes not in this list will be declined.
            allowed: nil,
            # The Merchant Category Codes that are blocked for authorizations on this card.
            # Authorizations with Merchant Category Codes in this list will be declined.
            blocked: nil
          )
          end

          sig do
            override.returns(
              {
                allowed:
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Allowed
                  ],
                blocked:
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Blocked
                  ]
              }
            )
          end
          def to_hash
          end

          class Allowed < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Allowed,
                  Increase::Internal::AnyHash
                )
              end

            # The Merchant Category Code.
            sig { returns(String) }
            attr_accessor :code

            sig { params(code: String).returns(T.attached_class) }
            def self.new(
              # The Merchant Category Code.
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
                  Increase::CardCreateParams::AuthorizationControls::MerchantCategoryCode::Blocked,
                  Increase::Internal::AnyHash
                )
              end

            # The Merchant Category Code.
            sig { returns(String) }
            attr_accessor :code

            sig { params(code: String).returns(T.attached_class) }
            def self.new(
              # The Merchant Category Code.
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
                Increase::CardCreateParams::AuthorizationControls::MerchantCountry,
                Increase::Internal::AnyHash
              )
            end

          # The merchant countries that are allowed for authorizations on this card.
          # Authorizations with merchant countries not in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Allowed
                ]
              )
            )
          end
          attr_reader :allowed

          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Allowed::OrHash
                ]
            ).void
          end
          attr_writer :allowed

          # The merchant countries that are blocked for authorizations on this card.
          # Authorizations with merchant countries in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Blocked
                ]
              )
            )
          end
          attr_reader :blocked

          sig do
            params(
              blocked:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Blocked::OrHash
                ]
            ).void
          end
          attr_writer :blocked

          # Restricts which merchant countries are allowed or blocked for authorizations on
          # this card.
          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Allowed::OrHash
                ],
              blocked:
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Blocked::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # The merchant countries that are allowed for authorizations on this card.
            # Authorizations with merchant countries not in this list will be declined.
            allowed: nil,
            # The merchant countries that are blocked for authorizations on this card.
            # Authorizations with merchant countries in this list will be declined.
            blocked: nil
          )
          end

          sig do
            override.returns(
              {
                allowed:
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Allowed
                  ],
                blocked:
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Blocked
                  ]
              }
            )
          end
          def to_hash
          end

          class Allowed < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Allowed,
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
                  Increase::CardCreateParams::AuthorizationControls::MerchantCountry::Blocked,
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
                Increase::CardCreateParams::AuthorizationControls::Usage,
                Increase::Internal::AnyHash
              )
            end

          # Whether the card is for a single use or multiple uses.
          sig do
            returns(
              Increase::CardCreateParams::AuthorizationControls::Usage::Category::OrSymbol
            )
          end
          attr_accessor :category

          # Controls for multi-use cards. Required if and only if `category` is `multi_use`.
          sig do
            returns(
              T.nilable(
                Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse
              )
            )
          end
          attr_reader :multi_use

          sig do
            params(
              multi_use:
                Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::OrHash
            ).void
          end
          attr_writer :multi_use

          # Controls for single-use cards. Required if and only if `category` is
          # `single_use`.
          sig do
            returns(
              T.nilable(
                Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse
              )
            )
          end
          attr_reader :single_use

          sig do
            params(
              single_use:
                Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::OrHash
            ).void
          end
          attr_writer :single_use

          # Controls how many times this card can be used.
          sig do
            params(
              category:
                Increase::CardCreateParams::AuthorizationControls::Usage::Category::OrSymbol,
              multi_use:
                Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::OrHash,
              single_use:
                Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the card is for a single use or multiple uses.
            category:,
            # Controls for multi-use cards. Required if and only if `category` is `multi_use`.
            multi_use: nil,
            # Controls for single-use cards. Required if and only if `category` is
            # `single_use`.
            single_use: nil
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::CardCreateParams::AuthorizationControls::Usage::Category::OrSymbol,
                multi_use:
                  Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse,
                single_use:
                  Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse
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
                  Increase::CardCreateParams::AuthorizationControls::Usage::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The card can only be used for a single authorization.
            SINGLE_USE =
              T.let(
                :single_use,
                Increase::CardCreateParams::AuthorizationControls::Usage::Category::TaggedSymbol
              )

            # The card can be used for multiple authorizations.
            MULTI_USE =
              T.let(
                :multi_use,
                Increase::CardCreateParams::AuthorizationControls::Usage::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardCreateParams::AuthorizationControls::Usage::Category::TaggedSymbol
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
                  Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse,
                  Increase::Internal::AnyHash
                )
              end

            # Spending limits for this card. The most restrictive limit applies if multiple
            # limits match.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit
                  ]
                )
              )
            end
            attr_reader :spending_limits

            sig do
              params(
                spending_limits:
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::OrHash
                  ]
              ).void
            end
            attr_writer :spending_limits

            # Controls for multi-use cards. Required if and only if `category` is `multi_use`.
            sig do
              params(
                spending_limits:
                  T::Array[
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::OrHash
                  ]
              ).returns(T.attached_class)
            end
            def self.new(
              # Spending limits for this card. The most restrictive limit applies if multiple
              # limits match.
              spending_limits: nil
            )
            end

            sig do
              override.returns(
                {
                  spending_limits:
                    T::Array[
                      Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit
                    ]
                }
              )
            end
            def to_hash
            end

            class SpendingLimit < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit,
                    Increase::Internal::AnyHash
                  )
                end

              # The interval at which the spending limit is enforced.
              sig do
                returns(
                  Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::OrSymbol
                )
              end
              attr_accessor :interval

              # The maximum settlement amount permitted in the given interval.
              sig { returns(Integer) }
              attr_accessor :settlement_amount

              # The Merchant Category Codes this spending limit applies to. If not set, the
              # limit applies to all transactions.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode
                    ]
                  )
                )
              end
              attr_reader :merchant_category_codes

              sig do
                params(
                  merchant_category_codes:
                    T::Array[
                      Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode::OrHash
                    ]
                ).void
              end
              attr_writer :merchant_category_codes

              sig do
                params(
                  interval:
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::OrSymbol,
                  settlement_amount: Integer,
                  merchant_category_codes:
                    T::Array[
                      Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode::OrHash
                    ]
                ).returns(T.attached_class)
              end
              def self.new(
                # The interval at which the spending limit is enforced.
                interval:,
                # The maximum settlement amount permitted in the given interval.
                settlement_amount:,
                # The Merchant Category Codes this spending limit applies to. If not set, the
                # limit applies to all transactions.
                merchant_category_codes: nil
              )
              end

              sig do
                override.returns(
                  {
                    interval:
                      Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::OrSymbol,
                    settlement_amount: Integer,
                    merchant_category_codes:
                      T::Array[
                        Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode
                      ]
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
                      Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # The spending limit applies over the lifetime of the card.
                ALL_TIME =
                  T.let(
                    :all_time,
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                # The spending limit applies per transaction.
                PER_TRANSACTION =
                  T.let(
                    :per_transaction,
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                # The spending limit applies per day. Resets nightly at midnight UTC.
                PER_DAY =
                  T.let(
                    :per_day,
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                # The spending limit applies per week. Resets weekly on Mondays at midnight UTC.
                PER_WEEK =
                  T.let(
                    :per_week,
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                # The spending limit applies per month. Resets on the first of the month, midnight UTC.
                PER_MONTH =
                  T.let(
                    :per_month,
                    Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::Interval::TaggedSymbol
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
                      Increase::CardCreateParams::AuthorizationControls::Usage::MultiUse::SpendingLimit::MerchantCategoryCode,
                      Increase::Internal::AnyHash
                    )
                  end

                # The Merchant Category Code.
                sig { returns(String) }
                attr_accessor :code

                sig { params(code: String).returns(T.attached_class) }
                def self.new(
                  # The Merchant Category Code.
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
                  Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse,
                  Increase::Internal::AnyHash
                )
              end

            # The settlement amount constraint for this single-use card.
            sig do
              returns(
                Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount
              )
            end
            attr_reader :settlement_amount

            sig do
              params(
                settlement_amount:
                  Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::OrHash
              ).void
            end
            attr_writer :settlement_amount

            # Controls for single-use cards. Required if and only if `category` is
            # `single_use`.
            sig do
              params(
                settlement_amount:
                  Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::OrHash
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
                    Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount
                }
              )
            end
            def to_hash
            end

            class SettlementAmount < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount,
                    Increase::Internal::AnyHash
                  )
                end

              # The operator used to compare the settlement amount.
              sig do
                returns(
                  Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::OrSymbol
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
                    Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::OrSymbol,
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
                      Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::OrSymbol,
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
                      Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # The settlement amount must be exactly the specified value.
                EQUALS =
                  T.let(
                    :equals,
                    Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::TaggedSymbol
                  )

                # The settlement amount must be less than or equal to the specified value.
                LESS_THAN_OR_EQUALS =
                  T.let(
                    :less_than_or_equals,
                    Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardCreateParams::AuthorizationControls::Usage::SingleUse::SettlementAmount::Comparison::TaggedSymbol
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
            T.any(
              Increase::CardCreateParams::BillingAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city of the billing address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the billing address.
        sig { returns(String) }
        attr_accessor :line1

        # The postal code of the billing address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The US state of the billing address.
        sig { returns(String) }
        attr_accessor :state

        # The second line of the billing address.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # The card's billing address.
        sig do
          params(
            city: String,
            line1: String,
            postal_code: String,
            state: String,
            line2: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the billing address.
          city:,
          # The first line of the billing address.
          line1:,
          # The postal code of the billing address.
          postal_code:,
          # The US state of the billing address.
          state:,
          # The second line of the billing address.
          line2: nil
        )
        end

        sig do
          override.returns(
            {
              city: String,
              line1: String,
              postal_code: String,
              state: String,
              line2: String
            }
          )
        end
        def to_hash
        end
      end

      class DigitalWallet < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardCreateParams::DigitalWallet,
              Increase::Internal::AnyHash
            )
          end

        # The digital card profile assigned to this digital card.
        sig { returns(T.nilable(String)) }
        attr_reader :digital_card_profile_id

        sig { params(digital_card_profile_id: String).void }
        attr_writer :digital_card_profile_id

        # An email address that can be used to contact and verify the cardholder via
        # one-time passcode over email.
        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # A phone number that can be used to contact and verify the cardholder via
        # one-time passcode over SMS.
        sig { returns(T.nilable(String)) }
        attr_reader :phone

        sig { params(phone: String).void }
        attr_writer :phone

        # The contact information used in the two-factor steps for digital wallet card
        # creation. To add the card to a digital wallet, you may supply an email or phone
        # number with this request. Otherwise, subscribe and then action a Real Time
        # Decision with the category `digital_wallet_token_requested` or
        # `digital_wallet_authentication_requested`.
        sig do
          params(
            digital_card_profile_id: String,
            email: String,
            phone: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The digital card profile assigned to this digital card.
          digital_card_profile_id: nil,
          # An email address that can be used to contact and verify the cardholder via
          # one-time passcode over email.
          email: nil,
          # A phone number that can be used to contact and verify the cardholder via
          # one-time passcode over SMS.
          phone: nil
        )
        end

        sig do
          override.returns(
            { digital_card_profile_id: String, email: String, phone: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
