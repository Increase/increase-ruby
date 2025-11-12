# typed: strong

module Increase
  module Models
    class LockboxUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::LockboxUpdateParams, Increase::Internal::AnyHash)
        end

      # This indicates if checks mailed to this lockbox will be deposited.
      sig do
        returns(
          T.nilable(
            Increase::LockboxUpdateParams::CheckDepositBehavior::OrSymbol
          )
        )
      end
      attr_reader :check_deposit_behavior

      sig do
        params(
          check_deposit_behavior:
            Increase::LockboxUpdateParams::CheckDepositBehavior::OrSymbol
        ).void
      end
      attr_writer :check_deposit_behavior

      # The description you choose for the Lockbox.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The recipient name you choose for the Lockbox.
      sig { returns(T.nilable(String)) }
      attr_reader :recipient_name

      sig { params(recipient_name: String).void }
      attr_writer :recipient_name

      sig do
        params(
          check_deposit_behavior:
            Increase::LockboxUpdateParams::CheckDepositBehavior::OrSymbol,
          description: String,
          recipient_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # This indicates if checks mailed to this lockbox will be deposited.
        check_deposit_behavior: nil,
        # The description you choose for the Lockbox.
        description: nil,
        # The recipient name you choose for the Lockbox.
        recipient_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            check_deposit_behavior:
              Increase::LockboxUpdateParams::CheckDepositBehavior::OrSymbol,
            description: String,
            recipient_name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # This indicates if checks mailed to this lockbox will be deposited.
      module CheckDepositBehavior
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::LockboxUpdateParams::CheckDepositBehavior)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Checks mailed to this Lockbox will be deposited.
        ENABLED =
          T.let(
            :enabled,
            Increase::LockboxUpdateParams::CheckDepositBehavior::TaggedSymbol
          )

        # Checks mailed to this Lockbox will not be deposited.
        DISABLED =
          T.let(
            :disabled,
            Increase::LockboxUpdateParams::CheckDepositBehavior::TaggedSymbol
          )

        # Checks mailed to this Lockbox will be pending until actioned.
        PEND_FOR_PROCESSING =
          T.let(
            :pend_for_processing,
            Increase::LockboxUpdateParams::CheckDepositBehavior::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::LockboxUpdateParams::CheckDepositBehavior::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
