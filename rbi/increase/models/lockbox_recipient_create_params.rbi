# typed: strong

module Increase
  module Models
    class LockboxRecipientCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::LockboxRecipientCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The Account that checks sent to this Lockbox Recipient should be deposited into.
      sig { returns(String) }
      attr_accessor :account_id

      # The Lockbox Address where this Lockbox Recipient may receive mail.
      sig { returns(String) }
      attr_accessor :lockbox_address_id

      # The description you choose for the Lockbox Recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The name of the Lockbox Recipient
      sig { returns(T.nilable(String)) }
      attr_reader :recipient_name

      sig { params(recipient_name: String).void }
      attr_writer :recipient_name

      sig do
        params(
          account_id: String,
          lockbox_address_id: String,
          description: String,
          recipient_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account that checks sent to this Lockbox Recipient should be deposited into.
        account_id:,
        # The Lockbox Address where this Lockbox Recipient may receive mail.
        lockbox_address_id:,
        # The description you choose for the Lockbox Recipient.
        description: nil,
        # The name of the Lockbox Recipient
        recipient_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            lockbox_address_id: String,
            description: String,
            recipient_name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
