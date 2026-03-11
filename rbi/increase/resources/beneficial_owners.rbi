# typed: strong

module Increase
  module Resources
    class BeneficialOwners
      # Retrieve a Beneficial Owner
      sig do
        params(
          entity_beneficial_owner_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntityBeneficialOwner)
      end
      def retrieve(
        # The identifier of the Beneficial Owner to retrieve.
        entity_beneficial_owner_id,
        request_options: {}
      )
      end

      # Update a Beneficial Owner
      sig do
        params(
          entity_beneficial_owner_id: String,
          address: Increase::BeneficialOwnerUpdateParams::Address::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntityBeneficialOwner)
      end
      def update(
        # The identifier of the Beneficial Owner to update.
        entity_beneficial_owner_id,
        # The individual's physical address. Mail receiving locations like PO Boxes and
        # PMB's are disallowed.
        address: nil,
        request_options: {}
      )
      end

      # List Beneficial Owners
      sig do
        params(
          entity_id: String,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::EntityBeneficialOwner])
      end
      def list(
        # The identifier of the Entity to list beneficial owners for. Only `corporation`
        # entities have beneficial owners.
        entity_id:,
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
