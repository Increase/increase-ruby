# typed: strong

module Increase
  module Resources
    class CardDisputes
      # Create a Card Dispute
      sig do
        params(
          disputed_transaction_id: String,
          network: Increase::CardDisputeCreateParams::Network::OrSymbol,
          amount: Integer,
          attachment_files:
            T::Array[Increase::CardDisputeCreateParams::AttachmentFile::OrHash],
          explanation: String,
          visa: Increase::CardDisputeCreateParams::Visa::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardDispute)
      end
      def create(
        # The Transaction you wish to dispute. This Transaction must have a `source_type`
        # of `card_settlement`.
        disputed_transaction_id:,
        # The network of the disputed transaction. Details specific to the network are
        # required under the sub-object with the same identifier as the network.
        network:,
        # The monetary amount of the part of the transaction that is being disputed. This
        # is optional and will default to the full amount of the transaction if not
        # provided. If provided, the amount must be less than or equal to the amount of
        # the transaction.
        amount: nil,
        # The files to be attached to the initial dispute submission.
        attachment_files: nil,
        # The free-form explanation provided to Increase to provide more context for the
        # user submission. This field is not sent directly to the card networks.
        explanation: nil,
        # The Visa-specific parameters for the dispute. Required if and only if `network`
        # is `visa`.
        visa: nil,
        request_options: {}
      )
      end

      # Retrieve a Card Dispute
      sig do
        params(
          card_dispute_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardDispute)
      end
      def retrieve(
        # The identifier of the Card Dispute.
        card_dispute_id,
        request_options: {}
      )
      end

      # List Card Disputes
      sig do
        params(
          created_at: Increase::CardDisputeListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::CardDisputeListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Internal::Page[Increase::CardDispute])
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

      # Submit a User Submission for a Card Dispute
      sig do
        params(
          card_dispute_id: String,
          network:
            Increase::CardDisputeSubmitUserSubmissionParams::Network::OrSymbol,
          amount: Integer,
          attachment_files:
            T::Array[
              Increase::CardDisputeSubmitUserSubmissionParams::AttachmentFile::OrHash
            ],
          explanation: String,
          visa: Increase::CardDisputeSubmitUserSubmissionParams::Visa::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardDispute)
      end
      def submit_user_submission(
        # The identifier of the Card Dispute to submit a user submission for.
        card_dispute_id,
        # The network of the Card Dispute. Details specific to the network are required
        # under the sub-object with the same identifier as the network.
        network:,
        # The adjusted monetary amount of the part of the transaction that is being
        # disputed. This is optional and will default to the most recent amount provided.
        # If provided, the amount must be less than or equal to the amount of the
        # transaction.
        amount: nil,
        # The files to be attached to the user submission.
        attachment_files: nil,
        # The free-form explanation provided to Increase to provide more context for the
        # user submission. This field is not sent directly to the card networks.
        explanation: nil,
        # The Visa-specific parameters for the dispute. Required if and only if `network`
        # is `visa`.
        visa: nil,
        request_options: {}
      )
      end

      # Withdraw a Card Dispute
      sig do
        params(
          card_dispute_id: String,
          explanation: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardDispute)
      end
      def withdraw(
        # The identifier of the Card Dispute to withdraw.
        card_dispute_id,
        # The explanation for withdrawing the Card Dispute.
        explanation: nil,
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
