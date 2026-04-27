# typed: strong

module Increase
  module Resources
    class LockboxAddresses
      # Create a Lockbox Address
      sig do
        params(
          description: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::LockboxAddress)
      end
      def create(
        # The description you choose for the Lockbox Address.
        description: nil,
        request_options: {}
      )
      end

      # Retrieve a Lockbox Address
      sig do
        params(
          lockbox_address_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::LockboxAddress)
      end
      def retrieve(
        # The identifier of the Lockbox Address to retrieve.
        lockbox_address_id,
        request_options: {}
      )
      end

      # Update a Lockbox Address
      sig do
        params(
          lockbox_address_id: String,
          description: String,
          status: Increase::LockboxAddressUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::LockboxAddress)
      end
      def update(
        # The identifier of the Lockbox Address.
        lockbox_address_id,
        # The description you choose for the Lockbox Address.
        description: nil,
        # The status of the Lockbox Address.
        status: nil,
        request_options: {}
      )
      end

      # List Lockbox Addresses
      sig do
        params(
          created_at: Increase::LockboxAddressListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::LockboxAddress])
      end
      def list(
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
