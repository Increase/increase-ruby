# typed: strong

module Increase
  module Resources
    class Lockboxes
      # Create a Lockbox
      sig do
        params(
          account_id: String,
          description: String,
          recipient_name: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::Lockbox)
      end
      def create(
        # The Account checks sent to this Lockbox should be deposited into.
        account_id:,
        # The description you choose for the Lockbox, for display purposes.
        description: nil,
        # The name of the recipient that will receive mail at this location.
        recipient_name: nil,
        request_options: {}
      )
      end

      # Retrieve a Lockbox
      sig do
        params(
          lockbox_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::Lockbox)
      end
      def retrieve(
        # The identifier of the Lockbox to retrieve.
        lockbox_id,
        request_options: {}
      )
      end

      # Update a Lockbox
      sig do
        params(
          lockbox_id: String,
          description: String,
          recipient_name: String,
          status: Increase::Models::LockboxUpdateParams::Status::OrSymbol,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::Lockbox)
      end
      def update(
        # The identifier of the Lockbox.
        lockbox_id,
        # The description you choose for the Lockbox.
        description: nil,
        # The recipient name you choose for the Lockbox.
        recipient_name: nil,
        # This indicates if checks can be sent to the Lockbox.
        status: nil,
        request_options: {}
      )
      end

      # List Lockboxes
      sig do
        params(
          account_id: String,
          created_at: T.any(Increase::Models::LockboxListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::Lockbox])
      end
      def list(
        # Filter Lockboxes to those associated with the provided Account.
        account_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        #   that object. This value is unique across Increase and is used to ensure that a
        #   request is only processed once. Learn more about
        #   [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
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
