# typed: strong

module Increase
  module Models
    class CardTokenCapabilities < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::CardTokenCapabilities, Increase::Internal::AnyHash)
        end

      # Each route represent a path e.g., a push transfer can take.
      sig { returns(T::Array[Increase::CardTokenCapabilities::Route]) }
      attr_accessor :routes

      # A constant representing the object's type. For this resource it will always be
      # `card_token_capabilities`.
      sig { returns(Increase::CardTokenCapabilities::Type::TaggedSymbol) }
      attr_accessor :type

      # The capabilities of a Card Token describe whether the card can be used for
      # specific operations, such as Card Push Transfers. The capabilities can change
      # over time based on the issuing bank's configuration of the card range.
      sig do
        params(
          routes: T::Array[Increase::CardTokenCapabilities::Route::OrHash],
          type: Increase::CardTokenCapabilities::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Each route represent a path e.g., a push transfer can take.
        routes:,
        # A constant representing the object's type. For this resource it will always be
        # `card_token_capabilities`.
        type:
      )
      end

      sig do
        override.returns(
          {
            routes: T::Array[Increase::CardTokenCapabilities::Route],
            type: Increase::CardTokenCapabilities::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Route < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardTokenCapabilities::Route,
              Increase::Internal::AnyHash
            )
          end

        # Whether you can push funds to the card using cross-border Card Push Transfers.
        sig do
          returns(
            Increase::CardTokenCapabilities::Route::CrossBorderPushTransfers::TaggedSymbol
          )
        end
        attr_accessor :cross_border_push_transfers

        # Whether you can push funds to the card using domestic Card Push Transfers.
        sig do
          returns(
            Increase::CardTokenCapabilities::Route::DomesticPushTransfers::TaggedSymbol
          )
        end
        attr_accessor :domestic_push_transfers

        # The card network route the capabilities apply to.
        sig do
          returns(Increase::CardTokenCapabilities::Route::Route::TaggedSymbol)
        end
        attr_accessor :route

        sig do
          params(
            cross_border_push_transfers:
              Increase::CardTokenCapabilities::Route::CrossBorderPushTransfers::OrSymbol,
            domestic_push_transfers:
              Increase::CardTokenCapabilities::Route::DomesticPushTransfers::OrSymbol,
            route: Increase::CardTokenCapabilities::Route::Route::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether you can push funds to the card using cross-border Card Push Transfers.
          cross_border_push_transfers:,
          # Whether you can push funds to the card using domestic Card Push Transfers.
          domestic_push_transfers:,
          # The card network route the capabilities apply to.
          route:
        )
        end

        sig do
          override.returns(
            {
              cross_border_push_transfers:
                Increase::CardTokenCapabilities::Route::CrossBorderPushTransfers::TaggedSymbol,
              domestic_push_transfers:
                Increase::CardTokenCapabilities::Route::DomesticPushTransfers::TaggedSymbol,
              route: Increase::CardTokenCapabilities::Route::Route::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether you can push funds to the card using cross-border Card Push Transfers.
        module CrossBorderPushTransfers
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardTokenCapabilities::Route::CrossBorderPushTransfers
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The capability is supported.
          SUPPORTED =
            T.let(
              :supported,
              Increase::CardTokenCapabilities::Route::CrossBorderPushTransfers::TaggedSymbol
            )

          # The capability is not supported.
          NOT_SUPPORTED =
            T.let(
              :not_supported,
              Increase::CardTokenCapabilities::Route::CrossBorderPushTransfers::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardTokenCapabilities::Route::CrossBorderPushTransfers::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Whether you can push funds to the card using domestic Card Push Transfers.
        module DomesticPushTransfers
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardTokenCapabilities::Route::DomesticPushTransfers
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The capability is supported.
          SUPPORTED =
            T.let(
              :supported,
              Increase::CardTokenCapabilities::Route::DomesticPushTransfers::TaggedSymbol
            )

          # The capability is not supported.
          NOT_SUPPORTED =
            T.let(
              :not_supported,
              Increase::CardTokenCapabilities::Route::DomesticPushTransfers::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardTokenCapabilities::Route::DomesticPushTransfers::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The card network route the capabilities apply to.
        module Route
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CardTokenCapabilities::Route::Route)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Visa and Interlink
          VISA =
            T.let(
              :visa,
              Increase::CardTokenCapabilities::Route::Route::TaggedSymbol
            )

          # Mastercard and Maestro
          MASTERCARD =
            T.let(
              :mastercard,
              Increase::CardTokenCapabilities::Route::Route::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardTokenCapabilities::Route::Route::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `card_token_capabilities`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::CardTokenCapabilities::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CARD_TOKEN_CAPABILITIES =
          T.let(
            :card_token_capabilities,
            Increase::CardTokenCapabilities::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::CardTokenCapabilities::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
