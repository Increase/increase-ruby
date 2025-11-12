# typed: strong

module Increase
  module Models
    class InboundMailItemActionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundMailItemActionParams,
            Increase::Internal::AnyHash
          )
        end

      # The actions to perform on the Inbound Mail Item.
      sig { returns(T::Array[Increase::InboundMailItemActionParams::Check]) }
      attr_accessor :checks

      sig do
        params(
          checks:
            T::Array[Increase::InboundMailItemActionParams::Check::OrHash],
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The actions to perform on the Inbound Mail Item.
        checks:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            checks: T::Array[Increase::InboundMailItemActionParams::Check],
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Check < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundMailItemActionParams::Check,
              Increase::Internal::AnyHash
            )
          end

        # The action to perform on the Inbound Mail Item.
        sig do
          returns(
            Increase::InboundMailItemActionParams::Check::Action::OrSymbol
          )
        end
        attr_accessor :action

        # The identifier of the Account to deposit the check into. If not provided, the
        # check will be deposited into the Account associated with the Lockbox.
        sig { returns(T.nilable(String)) }
        attr_reader :account

        sig { params(account: String).void }
        attr_writer :account

        sig do
          params(
            action:
              Increase::InboundMailItemActionParams::Check::Action::OrSymbol,
            account: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The action to perform on the Inbound Mail Item.
          action:,
          # The identifier of the Account to deposit the check into. If not provided, the
          # check will be deposited into the Account associated with the Lockbox.
          account: nil
        )
        end

        sig do
          override.returns(
            {
              action:
                Increase::InboundMailItemActionParams::Check::Action::OrSymbol,
              account: String
            }
          )
        end
        def to_hash
        end

        # The action to perform on the Inbound Mail Item.
        module Action
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundMailItemActionParams::Check::Action
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The check will be deposited.
          DEPOSIT =
            T.let(
              :deposit,
              Increase::InboundMailItemActionParams::Check::Action::TaggedSymbol
            )

          # The check will be ignored.
          IGNORE =
            T.let(
              :ignore,
              Increase::InboundMailItemActionParams::Check::Action::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundMailItemActionParams::Check::Action::TaggedSymbol
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
