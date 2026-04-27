# typed: strong

module Increase
  module Resources
    class LockboxRecipients
      # Create a Lockbox Recipient
      sig do
        params(
          account_id: String,
          lockbox_address_id: String,
          description: String,
          recipient_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::LockboxRecipient)
      end
      def create(
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

      # Retrieve a Lockbox Recipient
      sig do
        params(
          lockbox_recipient_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::LockboxRecipient)
      end
      def retrieve(
        # The identifier of the Lockbox Recipient to retrieve.
        lockbox_recipient_id,
        request_options: {}
      )
      end

      # Update a Lockbox Recipient
      sig do
        params(
          lockbox_recipient_id: String,
          description: String,
          recipient_name: String,
          status: Increase::LockboxRecipientUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::LockboxRecipient)
      end
      def update(
        # The identifier of the Lockbox Recipient.
        lockbox_recipient_id,
        # The description you choose for the Lockbox Recipient.
        description: nil,
        # The name of the Lockbox Recipient.
        recipient_name: nil,
        # The status of the Lockbox Recipient.
        status: nil,
        request_options: {}
      )
      end

      # List Lockbox Recipients
      sig do
        params(
          account_id: String,
          created_at: Increase::LockboxRecipientListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          lockbox_address_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::LockboxRecipient])
      end
      def list(
        # Filter Lockbox Recipients to those associated with the provided Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        # Filter Lockbox Recipients to those associated with the provided Lockbox Address.
        lockbox_address_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
