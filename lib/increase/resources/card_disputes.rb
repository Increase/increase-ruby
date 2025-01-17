# frozen_string_literal: true

module Increase
  module Resources
    class CardDisputes
      # Create a Card Dispute
      #
      # @param params [Increase::Models::CardDisputeCreateParams, Hash{Symbol=>Object}] Attributes to send in this request.
      #
      #   @option params [String] :disputed_transaction_id The Transaction you wish to dispute. This Transaction must have a `source_type`
      #     of `card_settlement`.
      #
      #   @option params [String] :explanation Why you are disputing this Transaction.
      #
      #   @option params [Integer] :amount The monetary amount of the part of the transaction that is being disputed. This
      #     is optional and will default to the full amount of the transaction if not
      #     provided. If provided, the amount must be less than or equal to the amount of
      #     the transaction.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::CardDispute]
      #
      def create(params = {}, opts = {})
        parsed = Increase::Models::CardDisputeCreateParams.dump(params)
        req = {
          method: :post,
          path: "card_disputes",
          body: parsed,
          model: Increase::Models::CardDispute
        }
        @client.request(req, opts)
      end

      # Retrieve a Card Dispute
      #
      # @param card_dispute_id [String] The identifier of the Card Dispute.
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Models::CardDispute]
      #
      def retrieve(card_dispute_id, opts = {})
        req = {
          method: :get,
          path: ["card_disputes/%0s", card_dispute_id],
          model: Increase::Models::CardDispute
        }
        @client.request(req, opts)
      end

      # List Card Disputes
      #
      # @param params [Increase::Models::CardDisputeListParams, Hash{Symbol=>Object}] Attributes to send in this request.
      #
      #   @option params [Increase::Models::CardDisputeListParams::CreatedAt] :created_at
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
      #   @option params [Increase::Models::CardDisputeListParams::Status] :status
      #
      # @param opts [Hash{Symbol=>Object}, Increase::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Increase::Page<Increase::Models::CardDispute>]
      #
      def list(params = {}, opts = {})
        parsed = Increase::Models::CardDisputeListParams.dump(params)
        req = {
          method: :get,
          path: "card_disputes",
          query: parsed,
          page: Increase::Page,
          model: Increase::Models::CardDispute
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
