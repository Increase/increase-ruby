# frozen_string_literal: true

module Increase
  module Resources
    class CardDisputes
      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardDisputeCreateParams} for more details.
      #
      # Create a Card Dispute
      #
      # @overload create(disputed_transaction_id:, explanation:, amount: nil, request_options: {})
      #
      # @param disputed_transaction_id [String] The Transaction you wish to dispute. This Transaction must have a `source_type`
      #
      # @param explanation [String] Why you are disputing this Transaction.
      #
      # @param amount [Integer] The monetary amount of the part of the transaction that is being disputed. This
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardDispute]
      #
      # @see Increase::Models::CardDisputeCreateParams
      def create(params)
        parsed, options = Increase::CardDisputeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "card_disputes",
          body: parsed,
          model: Increase::CardDispute,
          options: options
        )
      end

      # Retrieve a Card Dispute
      #
      # @overload retrieve(card_dispute_id, request_options: {})
      #
      # @param card_dispute_id [String] The identifier of the Card Dispute.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardDispute]
      #
      # @see Increase::Models::CardDisputeRetrieveParams
      def retrieve(card_dispute_id, params = {})
        @client.request(
          method: :get,
          path: ["card_disputes/%1$s", card_dispute_id],
          model: Increase::CardDispute,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::CardDisputeListParams} for more details.
      #
      # List Card Disputes
      #
      # @overload list(created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param created_at [Increase::Models::CardDisputeListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::CardDisputeListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::CardDispute>]
      #
      # @see Increase::Models::CardDisputeListParams
      def list(params = {})
        parsed, options = Increase::CardDisputeListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "card_disputes",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::CardDispute,
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
