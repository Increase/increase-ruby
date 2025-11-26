# typed: strong

module Increase
  module Resources
    class CardPurchaseSupplements
      # Retrieve a Card Purchase Supplement
      sig do
        params(
          card_purchase_supplement_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::CardPurchaseSupplement)
      end
      def retrieve(
        # The identifier of the Card Purchase Supplement.
        card_purchase_supplement_id,
        request_options: {}
      )
      end

      # List Card Purchase Supplements
      sig do
        params(
          card_payment_id: String,
          created_at:
            Increase::CardPurchaseSupplementListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          request_options: Increase::RequestOptions::OrHash
        ).returns(Increase::Models::CardPurchaseSupplementListResponse)
      end
      def list(
        # Filter Card Purchase Supplements to ones belonging to the specified Card
        # Payment.
        card_payment_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
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
