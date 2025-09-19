# frozen_string_literal: true

module Increase
  module Resources
    class Cards
      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardCreateParams} for more details.
      #
      # Create a Card
      #
      # @overload create(account_id:, billing_address: nil, description: nil, digital_wallet: nil, entity_id: nil, request_options: {})
      #
      # @param account_id [String] The Account the card should belong to.
      #
      # @param billing_address [Increase::Models::CardCreateParams::BillingAddress] The card's billing address.
      #
      # @param description [String] The description you choose to give the card.
      #
      # @param digital_wallet [Increase::Models::CardCreateParams::DigitalWallet] The contact information used in the two-factor steps for digital wallet card cre
      #
      # @param entity_id [String] The Entity the card belongs to. You only need to supply this in rare situations
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Card]
      #
      # @see Increase::Models::CardCreateParams
      def create(params)
        parsed, options = Increase::CardCreateParams.dump_request(params)
        @client.request(method: :post, path: "cards", body: parsed, model: Increase::Card, options: options)
      end

      # Retrieve a Card
      #
      # @overload retrieve(card_id, request_options: {})
      #
      # @param card_id [String] The identifier of the Card.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Card]
      #
      # @see Increase::Models::CardRetrieveParams
      def retrieve(card_id, params = {})
        @client.request(
          method: :get,
          path: ["cards/%1$s", card_id],
          model: Increase::Card,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardUpdateParams} for more details.
      #
      # Update a Card
      #
      # @overload update(card_id, billing_address: nil, description: nil, digital_wallet: nil, entity_id: nil, pin: nil, status: nil, request_options: {})
      #
      # @param card_id [String] The card identifier.
      #
      # @param billing_address [Increase::Models::CardUpdateParams::BillingAddress] The card's updated billing address.
      #
      # @param description [String] The description you choose to give the card.
      #
      # @param digital_wallet [Increase::Models::CardUpdateParams::DigitalWallet] The contact information used in the two-factor steps for digital wallet card cre
      #
      # @param entity_id [String] The Entity the card belongs to. You only need to supply this in rare situations
      #
      # @param pin [String] The 4-digit PIN for the card, for use with ATMs.
      #
      # @param status [Symbol, Increase::Models::CardUpdateParams::Status] The status to update the Card with.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::Card]
      #
      # @see Increase::Models::CardUpdateParams
      def update(card_id, params = {})
        parsed, options = Increase::CardUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["cards/%1$s", card_id],
          body: parsed,
          model: Increase::Card,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardListParams} for more details.
      #
      # List Cards
      #
      # @overload list(account_id: nil, created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param account_id [String] Filter Cards to ones belonging to the specified Account.
      #
      # @param created_at [Increase::Models::CardListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::CardListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::Card>]
      #
      # @see Increase::Models::CardListParams
      def list(params = {})
        parsed, options = Increase::CardListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "cards",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Card,
          options: options
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
