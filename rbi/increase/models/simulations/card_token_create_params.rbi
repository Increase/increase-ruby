# typed: strong

module Increase
  module Models
    module Simulations
      class CardTokenCreateParams < Increase::Internal::Type::BaseModel
        extend Increase::Internal::Type::RequestParameters::Converter
        include Increase::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Increase::Simulations::CardTokenCreateParams,
              Increase::Internal::AnyHash
            )
          end

        # The capabilities of the outbound card token.
        sig do
          returns(
            T.nilable(
              T::Array[Increase::Simulations::CardTokenCreateParams::Capability]
            )
          )
        end
        attr_reader :capabilities

        sig do
          params(
            capabilities:
              T::Array[
                Increase::Simulations::CardTokenCreateParams::Capability::OrHash
              ]
          ).void
        end
        attr_writer :capabilities

        # The expiration date of the card.
        sig { returns(T.nilable(Date)) }
        attr_reader :expiration

        sig { params(expiration: Date).void }
        attr_writer :expiration

        # The last 4 digits of the card number.
        sig { returns(T.nilable(String)) }
        attr_reader :last4

        sig { params(last4: String).void }
        attr_writer :last4

        # The prefix of the card number, usually the first 8 digits.
        sig { returns(T.nilable(String)) }
        attr_reader :prefix

        sig { params(prefix: String).void }
        attr_writer :prefix

        # The total length of the card number, including prefix and last4.
        sig { returns(T.nilable(Integer)) }
        attr_reader :primary_account_number_length

        sig { params(primary_account_number_length: Integer).void }
        attr_writer :primary_account_number_length

        sig do
          params(
            capabilities:
              T::Array[
                Increase::Simulations::CardTokenCreateParams::Capability::OrHash
              ],
            expiration: Date,
            last4: String,
            prefix: String,
            primary_account_number_length: Integer,
            request_options: Increase::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The capabilities of the outbound card token.
          capabilities: nil,
          # The expiration date of the card.
          expiration: nil,
          # The last 4 digits of the card number.
          last4: nil,
          # The prefix of the card number, usually the first 8 digits.
          prefix: nil,
          # The total length of the card number, including prefix and last4.
          primary_account_number_length: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              capabilities:
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Capability
                ],
              expiration: Date,
              last4: String,
              prefix: String,
              primary_account_number_length: Integer,
              request_options: Increase::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Capability < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::Simulations::CardTokenCreateParams::Capability,
                Increase::Internal::AnyHash
              )
            end

          # The cross-border push transfers capability.
          sig do
            returns(
              Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::OrSymbol
            )
          end
          attr_accessor :cross_border_push_transfers

          # The domestic push transfers capability.
          sig do
            returns(
              Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::OrSymbol
            )
          end
          attr_accessor :domestic_push_transfers

          # The route of the capability.
          sig do
            returns(
              Increase::Simulations::CardTokenCreateParams::Capability::Route::OrSymbol
            )
          end
          attr_accessor :route

          sig do
            params(
              cross_border_push_transfers:
                Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::OrSymbol,
              domestic_push_transfers:
                Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::OrSymbol,
              route:
                Increase::Simulations::CardTokenCreateParams::Capability::Route::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The cross-border push transfers capability.
            cross_border_push_transfers:,
            # The domestic push transfers capability.
            domestic_push_transfers:,
            # The route of the capability.
            route:
          )
          end

          sig do
            override.returns(
              {
                cross_border_push_transfers:
                  Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::OrSymbol,
                domestic_push_transfers:
                  Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::OrSymbol,
                route:
                  Increase::Simulations::CardTokenCreateParams::Capability::Route::OrSymbol
              }
            )
          end
          def to_hash
          end

          # The cross-border push transfers capability.
          module CrossBorderPushTransfers
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The capability is supported.
            SUPPORTED =
              T.let(
                :supported,
                Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::TaggedSymbol
              )

            # The capability is not supported.
            NOT_SUPPORTED =
              T.let(
                :not_supported,
                Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Capability::CrossBorderPushTransfers::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The domestic push transfers capability.
          module DomesticPushTransfers
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The capability is supported.
            SUPPORTED =
              T.let(
                :supported,
                Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::TaggedSymbol
              )

            # The capability is not supported.
            NOT_SUPPORTED =
              T.let(
                :not_supported,
                Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Capability::DomesticPushTransfers::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The route of the capability.
          module Route
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::Simulations::CardTokenCreateParams::Capability::Route
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa and Interlink
            VISA =
              T.let(
                :visa,
                Increase::Simulations::CardTokenCreateParams::Capability::Route::TaggedSymbol
              )

            # Mastercard and Maestro
            MASTERCARD =
              T.let(
                :mastercard,
                Increase::Simulations::CardTokenCreateParams::Capability::Route::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::Simulations::CardTokenCreateParams::Capability::Route::TaggedSymbol
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
