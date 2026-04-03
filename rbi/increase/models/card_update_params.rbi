# typed: strong

module Increase
  module Models
    class CardUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardUpdateParams, Increase::Internal::AnyHash)
        end

      # The card identifier.
      sig { returns(String) }
      attr_accessor :card_id

      # Controls that restrict how this card can be used.
      sig do
        returns(T.nilable(Increase::CardUpdateParams::AuthorizationControls))
      end
      attr_reader :authorization_controls

      sig do
        params(
          authorization_controls:
            Increase::CardUpdateParams::AuthorizationControls::OrHash
        ).void
      end
      attr_writer :authorization_controls

      # The card's updated billing address.
      sig { returns(T.nilable(Increase::CardUpdateParams::BillingAddress)) }
      attr_reader :billing_address

      sig do
        params(
          billing_address: Increase::CardUpdateParams::BillingAddress::OrHash
        ).void
      end
      attr_writer :billing_address

      # The description you choose to give the card.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The contact information used in the two-factor steps for digital wallet card
      # creation. At least one field must be present to complete the digital wallet
      # steps.
      sig { returns(T.nilable(Increase::CardUpdateParams::DigitalWallet)) }
      attr_reader :digital_wallet

      sig do
        params(
          digital_wallet: Increase::CardUpdateParams::DigitalWallet::OrHash
        ).void
      end
      attr_writer :digital_wallet

      # The Entity the card belongs to. You only need to supply this in rare situations
      # when the card is not for the Account holder.
      sig { returns(T.nilable(String)) }
      attr_reader :entity_id

      sig { params(entity_id: String).void }
      attr_writer :entity_id

      # The status to update the Card with.
      sig { returns(T.nilable(Increase::CardUpdateParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: Increase::CardUpdateParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          card_id: String,
          authorization_controls:
            Increase::CardUpdateParams::AuthorizationControls::OrHash,
          billing_address: Increase::CardUpdateParams::BillingAddress::OrHash,
          description: String,
          digital_wallet: Increase::CardUpdateParams::DigitalWallet::OrHash,
          entity_id: String,
          status: Increase::CardUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The card identifier.
        card_id:,
        # Controls that restrict how this card can be used.
        authorization_controls: nil,
        # The card's updated billing address.
        billing_address: nil,
        # The description you choose to give the card.
        description: nil,
        # The contact information used in the two-factor steps for digital wallet card
        # creation. At least one field must be present to complete the digital wallet
        # steps.
        digital_wallet: nil,
        # The Entity the card belongs to. You only need to supply this in rare situations
        # when the card is not for the Account holder.
        entity_id: nil,
        # The status to update the Card with.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            card_id: String,
            authorization_controls:
              Increase::CardUpdateParams::AuthorizationControls,
            billing_address: Increase::CardUpdateParams::BillingAddress,
            description: String,
            digital_wallet: Increase::CardUpdateParams::DigitalWallet,
            entity_id: String,
            status: Increase::CardUpdateParams::Status::OrSymbol,
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
              Increase::CardUpdateParams::AuthorizationControls,
              Increase::Internal::AnyHash
            )
          end

        # Limits the number of authorizations that can be approved on this card.
        sig do
          returns(
            T.nilable(
              Increase::CardUpdateParams::AuthorizationControls::MaximumAuthorizationCount
            )
          )
        end
        attr_reader :maximum_authorization_count

        sig do
          params(
            maximum_authorization_count:
              Increase::CardUpdateParams::AuthorizationControls::MaximumAuthorizationCount::OrHash
          ).void
        end
        attr_writer :maximum_authorization_count

        # Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
        # on this card.
        sig do
          returns(
            T.nilable(
              Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier
            )
          )
        end
        attr_reader :merchant_acceptor_identifier

        sig do
          params(
            merchant_acceptor_identifier:
              Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::OrHash
          ).void
        end
        attr_writer :merchant_acceptor_identifier

        # Restricts which Merchant Category Codes are allowed or blocked for
        # authorizations on this card.
        sig do
          returns(
            T.nilable(
              Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode
            )
          )
        end
        attr_reader :merchant_category_code

        sig do
          params(
            merchant_category_code:
              Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::OrHash
          ).void
        end
        attr_writer :merchant_category_code

        # Restricts which merchant countries are allowed or blocked for authorizations on
        # this card.
        sig do
          returns(
            T.nilable(
              Increase::CardUpdateParams::AuthorizationControls::MerchantCountry
            )
          )
        end
        attr_reader :merchant_country

        sig do
          params(
            merchant_country:
              Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::OrHash
          ).void
        end
        attr_writer :merchant_country

        # Spending limits for this card. The most restrictive limit is applied if multiple
        # limits match.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit
              ]
            )
          )
        end
        attr_reader :spending_limits

        sig do
          params(
            spending_limits:
              T::Array[
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::OrHash
              ]
          ).void
        end
        attr_writer :spending_limits

        # Controls that restrict how this card can be used.
        sig do
          params(
            maximum_authorization_count:
              Increase::CardUpdateParams::AuthorizationControls::MaximumAuthorizationCount::OrHash,
            merchant_acceptor_identifier:
              Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::OrHash,
            merchant_category_code:
              Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::OrHash,
            merchant_country:
              Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::OrHash,
            spending_limits:
              T::Array[
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Limits the number of authorizations that can be approved on this card.
          maximum_authorization_count: nil,
          # Restricts which Merchant Acceptor IDs are allowed or blocked for authorizations
          # on this card.
          merchant_acceptor_identifier: nil,
          # Restricts which Merchant Category Codes are allowed or blocked for
          # authorizations on this card.
          merchant_category_code: nil,
          # Restricts which merchant countries are allowed or blocked for authorizations on
          # this card.
          merchant_country: nil,
          # Spending limits for this card. The most restrictive limit is applied if multiple
          # limits match.
          spending_limits: nil
        )
        end

        sig do
          override.returns(
            {
              maximum_authorization_count:
                Increase::CardUpdateParams::AuthorizationControls::MaximumAuthorizationCount,
              merchant_acceptor_identifier:
                Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier,
              merchant_category_code:
                Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode,
              merchant_country:
                Increase::CardUpdateParams::AuthorizationControls::MerchantCountry,
              spending_limits:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::SpendingLimit
                ]
            }
          )
        end
        def to_hash
        end

        class MaximumAuthorizationCount < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardUpdateParams::AuthorizationControls::MaximumAuthorizationCount,
                Increase::Internal::AnyHash
              )
            end

          # The maximum number of authorizations that can be approved on this card over its
          # lifetime.
          sig { returns(Integer) }
          attr_accessor :all_time

          # Limits the number of authorizations that can be approved on this card.
          sig { params(all_time: Integer).returns(T.attached_class) }
          def self.new(
            # The maximum number of authorizations that can be approved on this card over its
            # lifetime.
            all_time:
          )
          end

          sig { override.returns({ all_time: Integer }) }
          def to_hash
          end
        end

        class MerchantAcceptorIdentifier < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier,
                Increase::Internal::AnyHash
              )
            end

          # The Merchant Acceptor IDs that are allowed for authorizations on this card.
          # Authorizations with Merchant Acceptor IDs not in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed
                ]
              )
            )
          end
          attr_reader :allowed

          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed::OrHash
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked
                ]
              )
            )
          end
          attr_reader :blocked

          sig do
            params(
              blocked:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked::OrHash
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed::OrHash
                ],
              blocked:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked::OrHash
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
                    Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed
                  ],
                blocked:
                  T::Array[
                    Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Allowed,
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantAcceptorIdentifier::Blocked,
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
                Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode,
                Increase::Internal::AnyHash
              )
            end

          # The Merchant Category Codes that are allowed for authorizations on this card.
          # Authorizations with Merchant Category Codes not in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Allowed
                ]
              )
            )
          end
          attr_reader :allowed

          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Allowed::OrHash
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Blocked
                ]
              )
            )
          end
          attr_reader :blocked

          sig do
            params(
              blocked:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Blocked::OrHash
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Allowed::OrHash
                ],
              blocked:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Blocked::OrHash
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
                    Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Allowed
                  ],
                blocked:
                  T::Array[
                    Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Blocked
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Allowed,
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCategoryCode::Blocked,
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
                Increase::CardUpdateParams::AuthorizationControls::MerchantCountry,
                Increase::Internal::AnyHash
              )
            end

          # The merchant countries that are allowed for authorizations on this card.
          # Authorizations with merchant countries not in this list will be declined.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Allowed
                ]
              )
            )
          end
          attr_reader :allowed

          sig do
            params(
              allowed:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Allowed::OrHash
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Blocked
                ]
              )
            )
          end
          attr_reader :blocked

          sig do
            params(
              blocked:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Blocked::OrHash
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Allowed::OrHash
                ],
              blocked:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Blocked::OrHash
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
                    Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Allowed
                  ],
                blocked:
                  T::Array[
                    Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Blocked
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Allowed,
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
                  Increase::CardUpdateParams::AuthorizationControls::MerchantCountry::Blocked,
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

        class SpendingLimit < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit,
                Increase::Internal::AnyHash
              )
            end

          # The interval at which the spending limit is enforced.
          sig do
            returns(
              Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::OrSymbol
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
                  Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::MerchantCategoryCode
                ]
              )
            )
          end
          attr_reader :merchant_category_codes

          sig do
            params(
              merchant_category_codes:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::MerchantCategoryCode::OrHash
                ]
            ).void
          end
          attr_writer :merchant_category_codes

          sig do
            params(
              interval:
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::OrSymbol,
              settlement_amount: Integer,
              merchant_category_codes:
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::MerchantCategoryCode::OrHash
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
                  Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::OrSymbol,
                settlement_amount: Integer,
                merchant_category_codes:
                  T::Array[
                    Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::MerchantCategoryCode
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
                  Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The spending limit applies over the lifetime of the card.
            ALL_TIME =
              T.let(
                :all_time,
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::TaggedSymbol
              )

            # The spending limit applies per transaction.
            PER_TRANSACTION =
              T.let(
                :per_transaction,
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::TaggedSymbol
              )

            # The spending limit applies per day. Resets nightly at midnight UTC.
            PER_DAY =
              T.let(
                :per_day,
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::TaggedSymbol
              )

            # The spending limit applies per week. Resets weekly on Mondays at midnight UTC.
            PER_WEEK =
              T.let(
                :per_week,
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::TaggedSymbol
              )

            # The spending limit applies per month. Resets on the first of the month, midnight UTC.
            PER_MONTH =
              T.let(
                :per_month,
                Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::Interval::TaggedSymbol
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
                  Increase::CardUpdateParams::AuthorizationControls::SpendingLimit::MerchantCategoryCode,
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

      class BillingAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardUpdateParams::BillingAddress,
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

        # The card's updated billing address.
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
              Increase::CardUpdateParams::DigitalWallet,
              Increase::Internal::AnyHash
            )
          end

        # The digital card profile assigned to this digital card.
        sig { returns(T.nilable(String)) }
        attr_reader :digital_card_profile_id

        sig { params(digital_card_profile_id: String).void }
        attr_writer :digital_card_profile_id

        # An email address that can be used to verify the cardholder via one-time passcode
        # over email.
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

        # The contact information used in the two-factor steps for digital wallet card
        # creation. At least one field must be present to complete the digital wallet
        # steps.
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
          # An email address that can be used to verify the cardholder via one-time passcode
          # over email.
          email: nil,
          # A phone number that can be used to verify the cardholder via one-time passcode
          # over SMS.
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

      # The status to update the Card with.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardUpdateParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The card is active.
        ACTIVE =
          T.let(:active, Increase::CardUpdateParams::Status::TaggedSymbol)

        # The card is temporarily disabled.
        DISABLED =
          T.let(:disabled, Increase::CardUpdateParams::Status::TaggedSymbol)

        # The card is permanently canceled.
        CANCELED =
          T.let(:canceled, Increase::CardUpdateParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardUpdateParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
