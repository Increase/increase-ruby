# typed: strong

module Increase
  module Resources
    class Cards
      # Create a Card
      sig do
        params(
          account_id: String,
          billing_address: T.any(Increase::Models::CardCreateParams::BillingAddress, Increase::Internal::AnyHash),
          description: String,
          digital_wallet: T.any(Increase::Models::CardCreateParams::DigitalWallet, Increase::Internal::AnyHash),
          entity_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::Card)
      end
      def create(
        # The Account the card should belong to.
        account_id:,
        # The card's billing address.
        billing_address: nil,
        # The description you choose to give the card.
        description: nil,
        # The contact information used in the two-factor steps for digital wallet card
        #   creation. To add the card to a digital wallet, you may supply an email or phone
        #   number with this request. Otherwise, subscribe and then action a Real Time
        #   Decision with the category `digital_wallet_token_requested` or
        #   `digital_wallet_authentication_requested`.
        digital_wallet: nil,
        # The Entity the card belongs to. You only need to supply this in rare situations
        #   when the card is not for the Account holder.
        entity_id: nil,
        request_options: {}
      )
      end

      # Retrieve a Card
      sig do
        params(
          card_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::Card)
      end
      def retrieve(
        # The identifier of the Card.
        card_id,
        request_options: {}
      )
      end

      # Update a Card
      sig do
        params(
          card_id: String,
          billing_address: T.any(Increase::Models::CardUpdateParams::BillingAddress, Increase::Internal::AnyHash),
          description: String,
          digital_wallet: T.any(Increase::Models::CardUpdateParams::DigitalWallet, Increase::Internal::AnyHash),
          entity_id: String,
          status: Increase::Models::CardUpdateParams::Status::OrSymbol,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::Card)
      end
      def update(
        # The card identifier.
        card_id,
        # The card's updated billing address.
        billing_address: nil,
        # The description you choose to give the card.
        description: nil,
        # The contact information used in the two-factor steps for digital wallet card
        #   creation. At least one field must be present to complete the digital wallet
        #   steps.
        digital_wallet: nil,
        # The Entity the card belongs to. You only need to supply this in rare situations
        #   when the card is not for the Account holder.
        entity_id: nil,
        # The status to update the Card with.
        status: nil,
        request_options: {}
      )
      end

      # List Cards
      sig do
        params(
          account_id: String,
          created_at: T.any(Increase::Models::CardListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: T.any(Increase::Models::CardListParams::Status, Increase::Internal::AnyHash),
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::Card])
      end
      def list(
        # Filter Cards to ones belonging to the specified Account.
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
        status: nil,
        request_options: {}
      )
      end

      # Retrieve sensitive details for a Card
      sig do
        params(
          card_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::CardDetails)
      end
      def details(
        # The identifier of the Card to retrieve details for.
        card_id,
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
