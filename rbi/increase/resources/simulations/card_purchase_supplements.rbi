# typed: strong

module Increase
  module Resources
    class Simulations
      class CardPurchaseSupplements
        # Simulates the creation of a Card Purchase Supplement (Level 3 data) for a card
        # settlement. This happens asynchronously in production when Visa sends enhanced
        # transaction data about a purchase.
        sig do
          params(
            transaction_id: String,
            invoice:
              Increase::Simulations::CardPurchaseSupplementCreateParams::Invoice::OrHash,
            line_items:
              T::Array[
                Increase::Simulations::CardPurchaseSupplementCreateParams::LineItem::OrHash
              ],
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::CardPurchaseSupplement)
        end
        def create(
          # The identifier of the Transaction to create a Card Purchase Supplement for. The
          # Transaction must have a source of type `card_settlement`.
          transaction_id:,
          # Invoice-level information about the payment.
          invoice: nil,
          # Line item information, such as individual products purchased.
          line_items: nil,
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
end
