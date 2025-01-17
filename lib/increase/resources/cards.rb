# frozen_string_literal: true

module Increase
  module Resources
    class Cards
      # Create a Card
      #
      # @param params [Increase::Models::CardCreateParams, Hash{Symbol=>Object}] Attributes to send in this request.
      #
      #   @option params [String] :account_id The Account the card should belong to.
      #
      #   @option params [Increase::Models::CardCreateParams::BillingAddress] :billing_address The card's billing address.
      #
      #   @option params [String] :description The description you choose to give the card.
      #
      #   @option params [Increase::Models::CardCreateParams::DigitalWallet] :digital_wallet The contact information used in the two-factor steps for digital wallet card
      #     creation. To add the card to a digital wallet, you may supply an email or phone
      #     number with this request. Otherwise, subscribe and then action a Real Time
      #     Decision with the category `digital_wallet_token_requested` or
      #     `digital_wallet_authentication_requested`.
      #
      #   @option params [String] :entity_id The Entity the card belongs to. You only need to supply this in rare situations
      #     when the card is not for the Account holder.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::Card]
      #
      def create(params = {}, opts = {})
        parsed = Increase::Models::CardCreateParams.dump(params)
        req = {
          method: :post,
          path: "cards",
          body: parsed,
          model: Increase::Models::Card
        }
        @client.request(req, opts)
      end

      # Retrieve a Card
      #
      # @param card_id [String] The identifier of the Card.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::Card]
      #
      def retrieve(card_id, opts = {})
        req = {
          method: :get,
          path: ["cards/%0s", card_id],
          model: Increase::Models::Card
        }
        @client.request(req, opts)
      end

      # Update a Card
      #
      # @param card_id [String] The card identifier.
      #
      # @param params [Increase::Models::CardUpdateParams, Hash{Symbol=>Object}] Attributes to send in this request.
      #
      #   @option params [Increase::Models::CardUpdateParams::BillingAddress] :billing_address The card's updated billing address.
      #
      #   @option params [String] :description The description you choose to give the card.
      #
      #   @option params [Increase::Models::CardUpdateParams::DigitalWallet] :digital_wallet The contact information used in the two-factor steps for digital wallet card
      #     creation. At least one field must be present to complete the digital wallet
      #     steps.
      #
      #   @option params [String] :entity_id The Entity the card belongs to. You only need to supply this in rare situations
      #     when the card is not for the Account holder.
      #
      #   @option params [Symbol, Increase::Models::CardUpdateParams::Status] :status The status to update the Card with.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::Card]
      #
      def update(card_id, params = {}, opts = {})
        parsed = Increase::Models::CardUpdateParams.dump(params)
        req = {
          method: :patch,
          path: ["cards/%0s", card_id],
          body: parsed,
          model: Increase::Models::Card
        }
        @client.request(req, opts)
      end

      # List Cards
      #
      # @param params [Increase::Models::CardListParams, Hash{Symbol=>Object}] Attributes to send in this request.
      #
      #   @option params [String] :account_id Filter Cards to ones belonging to the specified Account.
      #
      #   @option params [Increase::Models::CardListParams::CreatedAt] :created_at
      #
      #   @option params [String] :cursor Return the page of entries after this one.
      #
      #   @option params [String] :idempotency_key Filter records to the one with the specified `idempotency_key` you chose for
      #     that object. This value is unique across Increase and is used to ensure that a
      #     request is only processed once. Learn more about
      #     [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #     objects.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Page<Increase::Models::Card>]
      #
      def list(params = {}, opts = {})
        parsed = Increase::Models::CardListParams.dump(params)
        req = {
          method: :get,
          path: "cards",
          query: parsed,
          page: Increase::Page,
          model: Increase::Models::Card
        }
        @client.request(req, opts)
      end

      # Retrieve sensitive details for a Card
      #
      # @param card_id [String] The identifier of the Card to retrieve details for.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::CardDetails]
      #
      def details(card_id, opts = {})
        req = {
          method: :get,
          path: ["cards/%0s/details", card_id],
          model: Increase::Models::CardDetails
        }
        @client.request(req, opts)
      end

      # @param client [Increase::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
