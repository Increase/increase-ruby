# typed: strong

module Increase
  module Resources
    class PhysicalCards
      # Create a Physical Card
      sig do
        params(
          card_id: String,
          cardholder: Increase::PhysicalCardCreateParams::Cardholder::OrHash,
          shipment: Increase::PhysicalCardCreateParams::Shipment::OrHash,
          physical_card_profile_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCard)
      end
      def create(
        # The underlying card representing this physical card.
        card_id:,
        # Details about the cardholder, as it will appear on the physical card.
        cardholder:,
        # The details used to ship this physical card.
        shipment:,
        # The physical card profile to use for this physical card. The latest default
        # physical card profile will be used if not provided.
        physical_card_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieve a Physical Card
      sig do
        params(
          physical_card_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCard)
      end
      def retrieve(
        # The identifier of the Physical Card.
        physical_card_id,
        request_options: {}
      )
      end

      # Update a Physical Card
      sig do
        params(
          physical_card_id: String,
          status: Increase::PhysicalCardUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::PhysicalCard)
      end
      def update(
        # The Physical Card identifier.
        physical_card_id,
        # The status to update the Physical Card to.
        status:,
        request_options: {}
      )
      end

      # List Physical Cards
      sig do
        params(
          card_id: String,
          created_at: Increase::PhysicalCardListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::PhysicalCard])
      end
      def list(
        # Filter Physical Cards to ones belonging to the specified Card.
        card_id: nil,
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
