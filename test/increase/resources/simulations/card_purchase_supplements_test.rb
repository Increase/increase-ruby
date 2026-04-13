# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CardPurchaseSupplementsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.card_purchase_supplements.create(transaction_id: "transaction_uyrp7fld2ium70oa7oi")

    assert_pattern do
      response => Increase::CardPurchaseSupplement
    end

    assert_pattern do
      response => {
        id: String,
        card_payment_id: String | nil,
        invoice: Increase::CardPurchaseSupplement::Invoice | nil,
        line_items: ^(Increase::Internal::Type::ArrayOf[Increase::CardPurchaseSupplement::LineItem]) | nil,
        transaction_id: String,
        type: Increase::CardPurchaseSupplement::Type
      }
    end
  end
end
