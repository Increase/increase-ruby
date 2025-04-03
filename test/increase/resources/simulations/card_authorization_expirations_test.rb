# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CardAuthorizationExpirationsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.card_authorization_expirations.create(
        card_payment_id: "card_payment_nd3k2kacrqjli8482ave"
      )

    assert_pattern do
      response => Increase::Models::CardPayment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        card_id: String,
        created_at: Time,
        digital_wallet_token_id: String | nil,
        elements: ^(Increase::Internal::Type::ArrayOf[Increase::Models::CardPayment::Element]),
        physical_card_id: String | nil,
        state: Increase::Models::CardPayment::State,
        type: Increase::Models::CardPayment::Type
      }
    end
  end
end
