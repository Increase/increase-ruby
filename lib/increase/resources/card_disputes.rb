# frozen_string_literal: true

module Increase
  module Resources
    class CardDisputes
      # Create a Card Dispute
      #
      # @overload create(disputed_transaction_id:, network:, amount: nil, attachment_files: nil, explanation: nil, visa: nil, request_options: {})
      #
      # @param disputed_transaction_id [String]
      #   The Transaction you wish to dispute. This Transaction must have a `source_type`
      #   of `card_settlement`.
      #
      # @param network [Symbol, Increase::Models::CardDisputeCreateParams::Network]
      #   The network of the disputed transaction. Details specific to the network are
      #   required under the sub-object with the same identifier as the network.
      #
      # @param amount [Integer]
      #   The monetary amount of the part of the transaction that is being disputed. This
      #   is optional and will default to the full amount of the transaction if not
      #   provided. If provided, the amount must be less than or equal to the amount of
      #   the transaction.
      #
      # @param attachment_files [Array<Increase::Models::CardDisputeCreateParams::AttachmentFile>]
      #   The files to be attached to the initial dispute submission.
      #
      # @param explanation [String]
      #   The free-form explanation provided to Increase to provide more context for the
      #   user submission. This field is not sent directly to the card networks.
      #
      # @param visa [Increase::Models::CardDisputeCreateParams::Visa]
      #   The Visa-specific parameters for the dispute. Required if and only if `network`
      #   is `visa`.
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

      # List Card Disputes
      #
      # @overload list(created_at: nil, cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param created_at [Increase::Models::CardDisputeListParams::CreatedAt]
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String]
      #   Filter records to the one with the specified `idempotency_key` you chose for
      #   that object. This value is unique across Increase and is used to ensure that a
      #   request is only processed once. Learn more about
      #   [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      # @param limit [Integer]
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   Defaults to `100`.
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
        query = Increase::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "card_disputes",
          query: query,
          page: Increase::Internal::Page,
          model: Increase::CardDispute,
          options: options
        )
      end

      # Submit a User Submission for a Card Dispute
      #
      # @overload submit_user_submission(card_dispute_id, network:, amount: nil, attachment_files: nil, explanation: nil, visa: nil, request_options: {})
      #
      # @param card_dispute_id [String] The identifier of the Card Dispute to submit a user submission for.
      #
      # @param network [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Network]
      #   The network of the Card Dispute. Details specific to the network are required
      #   under the sub-object with the same identifier as the network.
      #
      # @param amount [Integer]
      #   The adjusted monetary amount of the part of the transaction that is being
      #   disputed. This is optional and will default to the most recent amount provided.
      #   If provided, the amount must be less than or equal to the amount of the
      #   transaction.
      #
      # @param attachment_files [Array<Increase::Models::CardDisputeSubmitUserSubmissionParams::AttachmentFile>]
      #   The files to be attached to the user submission.
      #
      # @param explanation [String]
      #   The free-form explanation provided to Increase to provide more context for the
      #   user submission. This field is not sent directly to the card networks.
      #
      # @param visa [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa]
      #   The Visa-specific parameters for the dispute. Required if and only if `network`
      #   is `visa`.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardDispute]
      #
      # @see Increase::Models::CardDisputeSubmitUserSubmissionParams
      def submit_user_submission(card_dispute_id, params)
        parsed, options = Increase::CardDisputeSubmitUserSubmissionParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["card_disputes/%1$s/submit_user_submission", card_dispute_id],
          body: parsed,
          model: Increase::CardDispute,
          options: options
        )
      end

      # Withdraw a Card Dispute
      #
      # @overload withdraw(card_dispute_id, explanation: nil, request_options: {})
      #
      # @param card_dispute_id [String] The identifier of the Card Dispute to withdraw.
      #
      # @param explanation [String] The explanation for withdrawing the Card Dispute.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::CardDispute]
      #
      # @see Increase::Models::CardDisputeWithdrawParams
      def withdraw(card_dispute_id, params = {})
        parsed, options = Increase::CardDisputeWithdrawParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["card_disputes/%1$s/withdraw", card_dispute_id],
          body: parsed,
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
