# typed: strong

module Increase
  module Models
    class LockboxRecipientUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::LockboxRecipientUpdateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Lockbox Recipient.
      sig { returns(String) }
      attr_accessor :lockbox_recipient_id

      # The description you choose for the Lockbox Recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The name of the Lockbox Recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :recipient_name

      sig { params(recipient_name: String).void }
      attr_writer :recipient_name

      # The status of the Lockbox Recipient.
      sig do
        returns(
          T.nilable(Increase::LockboxRecipientUpdateParams::Status::OrSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: Increase::LockboxRecipientUpdateParams::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig do
        params(
          lockbox_recipient_id: String,
          description: String,
          recipient_name: String,
          status: Increase::LockboxRecipientUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Lockbox Recipient.
        lockbox_recipient_id:,
        # The description you choose for the Lockbox Recipient.
        description: nil,
        # The name of the Lockbox Recipient.
        recipient_name: nil,
        # The status of the Lockbox Recipient.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lockbox_recipient_id: String,
            description: String,
            recipient_name: String,
            status: Increase::LockboxRecipientUpdateParams::Status::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The status of the Lockbox Recipient.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::LockboxRecipientUpdateParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # This Lockbox Recipient is active.
        ACTIVE =
          T.let(
            :active,
            Increase::LockboxRecipientUpdateParams::Status::TaggedSymbol
          )

        # This Lockbox Recipient is disabled. Checks mailed to this Lockbox Recipient will be rejected.
        DISABLED =
          T.let(
            :disabled,
            Increase::LockboxRecipientUpdateParams::Status::TaggedSymbol
          )

        # This Lockbox Recipient is canceled and cannot be modified. Checks mailed to this Lockbox Recipient will be rejected.
        CANCELED =
          T.let(
            :canceled,
            Increase::LockboxRecipientUpdateParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::LockboxRecipientUpdateParams::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
