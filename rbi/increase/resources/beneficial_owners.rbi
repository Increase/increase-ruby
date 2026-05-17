# typed: strong

module Increase
  module Resources
    class BeneficialOwners
      # Create a Beneficial Owner
      sig do
        params(
          entity_id: String,
          individual: Increase::BeneficialOwnerCreateParams::Individual::OrHash,
          prongs:
            T::Array[Increase::BeneficialOwnerCreateParams::Prong::OrSymbol],
          company_title: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntityBeneficialOwner)
      end
      def create(
        # The identifier of the Entity to associate with the new Beneficial Owner.
        entity_id:,
        # Personal details for the beneficial owner.
        individual:,
        # Why this person is considered a beneficial owner of the entity. At least one
        # option is required, if a person is both a control person and owner, submit an
        # array containing both.
        prongs:,
        # This person's role or title within the entity.
        company_title: nil,
        request_options: {}
      )
      end

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
          confirmed_no_us_tax_id: T::Boolean,
          identification:
            Increase::BeneficialOwnerUpdateParams::Identification::OrHash,
          name: String,
          prongs:
            T::Array[Increase::BeneficialOwnerUpdateParams::Prong::OrSymbol],
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntityBeneficialOwner)
      end
      def update(
        # The identifier of the Beneficial Owner to update.
        entity_beneficial_owner_id,
        # The individual's physical address. Mail receiving locations like PO Boxes and
        # PMB's are disallowed.
        address: nil,
        # The identification method for an individual can only be a passport, driver's
        # license, or other document if you've confirmed the individual does not have a US
        # tax id (either a Social Security Number or Individual Taxpayer Identification
        # Number).
        confirmed_no_us_tax_id: nil,
        # A means of verifying the person's identity.
        identification: nil,
        # The individual's legal name.
        name: nil,
        # Why this person is considered a beneficial owner of the entity. At least one
        # option is required, if a person is both a control person and owner, submit an
        # array containing both. Providing this replaces the beneficial owner's current
        # prongs.
        prongs: nil,
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

      # Archive a Beneficial Owner
      sig do
        params(
          entity_beneficial_owner_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::EntityBeneficialOwner)
      end
      def archive(
        # The identifier of the Beneficial Owner to archive.
        entity_beneficial_owner_id,
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
