# typed: strong

module Increase
  module Resources
    class CardPayments
      # Retrieve a Card Payment
      sig do
        params(
          card_payment_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::CardPayment)
      end
      def retrieve(
        # The identifier of the Card Payment.
        card_payment_id,
        request_options: {}
      )
      end

      # List Card Payments
      sig do
        params(
          account_id: String,
          card_id: String,
          created_at: T.any(Increase::Models::CardPaymentListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::CardPayment])
      end
      def list(
        # Filter Card Payments to ones belonging to the specified Account.
        account_id: nil,
        # Filter Card Payments to ones belonging to the specified Card.
        card_id: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
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
