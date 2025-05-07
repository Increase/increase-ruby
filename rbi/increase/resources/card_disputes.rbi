# typed: strong

module Increase
  module Resources
    class CardDisputes
      # Create a Card Dispute
      sig do
        params(
          disputed_transaction_id: String,
          explanation: String,
          amount: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardDispute)
      end
      def create(
        # The Transaction you wish to dispute. This Transaction must have a `source_type`
        # of `card_settlement`.
        disputed_transaction_id:,
        # Why you are disputing this Transaction.
        explanation:,
        # The monetary amount of the part of the transaction that is being disputed. This
        # is optional and will default to the full amount of the transaction if not
        # provided. If provided, the amount must be less than or equal to the amount of
        # the transaction.
        amount: nil,
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

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
