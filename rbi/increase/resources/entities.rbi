# typed: strong

module Increase
  module Resources
    class Entities
      # Create an Entity
      sig do
        params(
          structure: Increase::EntityCreateParams::Structure::OrSymbol,
          corporation: Increase::EntityCreateParams::Corporation::OrHash,
          description: String,
          government_authority:
            Increase::EntityCreateParams::GovernmentAuthority::OrHash,
          joint: Increase::EntityCreateParams::Joint::OrHash,
          natural_person: Increase::EntityCreateParams::NaturalPerson::OrHash,
          risk_rating: Increase::EntityCreateParams::RiskRating::OrHash,
          supplemental_documents:
            T::Array[
              Increase::EntityCreateParams::SupplementalDocument::OrHash
            ],
          third_party_verification:
            Increase::EntityCreateParams::ThirdPartyVerification::OrHash,
          trust: Increase::EntityCreateParams::Trust::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def create(
        # The type of Entity to create.
        structure:,
        # Details of the corporation entity to create. Required if `structure` is equal to
        # `corporation`.
        corporation: nil,
        # The description you choose to give the entity.
        description: nil,
        # Details of the Government Authority entity to create. Required if `structure` is
        # equal to `government_authority`.
        government_authority: nil,
        # Details of the joint entity to create. Required if `structure` is equal to
        # `joint`.
        joint: nil,
        # Details of the natural person entity to create. Required if `structure` is equal
        # to `natural_person`. Natural people entities should be submitted with
        # `social_security_number` or `individual_taxpayer_identification_number`
        # identification methods.
        natural_person: nil,
        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        risk_rating: nil,
        # Additional documentation associated with the entity.
        supplemental_documents: nil,
        # A reference to data stored in a third-party verification service. Your
        # integration may or may not use this field.
        third_party_verification: nil,
        # Details of the trust entity to create. Required if `structure` is equal to
        # `trust`.
        trust: nil,
        request_options: {}
      )
      end

      # Retrieve an Entity
      sig do
        params(
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def retrieve(
        # The identifier of the Entity to retrieve.
        entity_id,
        request_options: {}
      )
      end

      # Update an Entity
      sig do
        params(
          entity_id: String,
          corporation: Increase::EntityUpdateParams::Corporation::OrHash,
          government_authority:
            Increase::EntityUpdateParams::GovernmentAuthority::OrHash,
          natural_person: Increase::EntityUpdateParams::NaturalPerson::OrHash,
          risk_rating: Increase::EntityUpdateParams::RiskRating::OrHash,
          third_party_verification:
            Increase::EntityUpdateParams::ThirdPartyVerification::OrHash,
          trust: Increase::EntityUpdateParams::Trust::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def update(
        # The entity identifier.
        entity_id,
        # Details of the corporation entity to update.
        corporation: nil,
        # Details of the government authority entity to update.
        government_authority: nil,
        # Details of the natural person entity to update.
        natural_person: nil,
        # An assessment of the entity’s potential risk of involvement in financial crimes,
        # such as money laundering.
        risk_rating: nil,
        # A reference to data stored in a third-party verification service. Your
        # integration may or may not use this field.
        third_party_verification: nil,
        # Details of the trust entity to update.
        trust: nil,
        request_options: {}
      )
      end

      # List Entities
      sig do
        params(
          created_at: Increase::EntityListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::EntityListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::Entity])
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
        status: nil,
        request_options: {}
      )
      end

      # Archive an Entity
      sig do
        params(
          entity_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def archive(
        # The identifier of the Entity to archive. Any accounts associated with an entity
        # must be closed before the entity can be archived.
        entity_id,
        request_options: {}
      )
      end

      # Archive a beneficial owner for a corporate Entity
      sig do
        params(
          entity_id: String,
          beneficial_owner_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def archive_beneficial_owner(
        # The identifier of the Entity associated with the Beneficial Owner that is being
        # archived.
        entity_id,
        # The identifying details of anyone controlling or owning 25% or more of the
        # corporation.
        beneficial_owner_id:,
        request_options: {}
      )
      end

      # Depending on your program, you may be required to re-confirm an Entity's details
      # on a recurring basis. After making any required updates, call this endpoint to
      # record that your user confirmed their details.
      sig do
        params(
          entity_id: String,
          confirmed_at: Time,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def confirm(
        # The identifier of the Entity to confirm the details of.
        entity_id,
        # When your user confirmed the Entity's details. If not provided, the current time
        # will be used.
        confirmed_at: nil,
        request_options: {}
      )
      end

      # Create a beneficial owner for a corporate Entity
      sig do
        params(
          entity_id: String,
          beneficial_owner:
            Increase::EntityCreateBeneficialOwnerParams::BeneficialOwner::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def create_beneficial_owner(
        # The identifier of the Entity to associate with the new Beneficial Owner.
        entity_id,
        # The identifying details of anyone controlling or owning 25% or more of the
        # corporation.
        beneficial_owner:,
        request_options: {}
      )
      end

      # Update a Natural Person or Corporation's address
      sig do
        params(
          entity_id: String,
          address: Increase::EntityUpdateAddressParams::Address::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def update_address(
        # The identifier of the Entity whose address is being updated.
        entity_id,
        # The entity's physical address. Mail receiving locations like PO Boxes and PMB's
        # are disallowed.
        address:,
        request_options: {}
      )
      end

      # Update the address for a beneficial owner belonging to a corporate Entity
      sig do
        params(
          entity_id: String,
          address:
            Increase::EntityUpdateBeneficialOwnerAddressParams::Address::OrHash,
          beneficial_owner_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def update_beneficial_owner_address(
        # The identifier of the Entity associated with the Beneficial Owner whose address
        # is being updated.
        entity_id,
        # The individual's physical address. Mail receiving locations like PO Boxes and
        # PMB's are disallowed.
        address:,
        # The identifying details of anyone controlling or owning 25% or more of the
        # corporation.
        beneficial_owner_id:,
        request_options: {}
      )
      end

      # Update the industry code for a corporate Entity
      sig do
        params(
          entity_id: String,
          industry_code: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Entity)
      end
      def update_industry_code(
        # The identifier of the Entity to update. This endpoint only accepts `corporation`
        # entities.
        entity_id,
        # The North American Industry Classification System (NAICS) code for the
        # corporation's primary line of business. This is a number, like `5132` for
        # `Software Publishers`. A full list of classification codes is available
        # [here](https://increase.com/documentation/data-dictionary#north-american-industry-classification-system-codes).
        industry_code:,
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
