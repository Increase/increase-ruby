# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CardReversalsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.card_reversals.create(card_payment_id: "card_payment_nd3k2kacrqjli8482ave")

    assert_pattern do
      response => Increase::CardPayment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        card_id: String,
        created_at: Time,
        digital_wallet_token_id: String | nil,
        elements: ^(Increase::Internal::Type::ArrayOf[Increase::CardPayment::Element]),
        physical_card_id: String | nil,
        state: Increase::CardPayment::State,
        type: Increase::CardPayment::Type
      }
    end
  end
end
